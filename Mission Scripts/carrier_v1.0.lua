local version = "v1.0"

env.info("Grendel's Aircraft Carrier Script " .. version .. " BEGIN")

AIRCRAFT_CARRIER = {}

function AIRCRAFT_CARRIER:GetStatus()

   return self.fsm:GetState()

end

function AIRCRAFT_CARRIER:GetClosingTime()

   return self.windowEnd

end

function AIRCRAFT_CARRIER:GetTrueBRC()

   return self.group:GetUnit(1):GetHeading()

end

function AIRCRAFT_CARRIER:GetMagneticBRC()

   local trueHdg = self:GetTrueBRC()
   local magDec = self.group:GetCoordinate():GetMagneticDeclination()
   local magHdg = (trueHdg - magDec) % 360
   
   if magHdg == 0 then
      return 360
   end
      
   return magHdg

end

function AIRCRAFT_CARRIER:SetDeckAngle(angle)

   self.deckAngle = angle or 0
   return self

end

function AIRCRAFT_CARRIER:SetWindOverDeck(speedKts)

   self.apparentWindSpeed = speedKts or 10
   return self

end

function AIRCRAFT_CARRIER:SetCruiseSpeed(speedKts)

   self.cruiseSpeed = speedKts or 15
   return self

end

function AIRCRAFT_CARRIER:EnableFlagWhenRecovering(flag, value)

   if not flag then
      return
   end
   
   value = value or 1

   self.recoverFlag = {name=flag, value=value}

end

function AIRCRAFT_CARRIER:EnableFlagWhenCruising(flag, value)

   if not flag then
      return
   end
   
   value = value or 1

   self.cruiseFlag = {name=flag, value=value}

end

function AIRCRAFT_CARRIER:New(group)

   if (not group) then
      AIRCRAFT_CARRIER:logError("Unable to create.  Group is nil.")
      return
   end

   local navy = NAVYGROUP:New(group)
   navy:SetPatrolAdInfinitum()

   -- Finite State Machine
   local fsm = FSM:New()
   fsm:SetStartState("Idle")
   fsm:AddTransition("Idle", "Activate", "Cruising")
   fsm:AddTransition("Cruising", "Open", "Turning")
   fsm:AddTransition("Turning", "Opened", "Recovering")
   fsm:AddTransition("Recovering", "Extend", "Recovering")
   fsm:AddTransition("Recovering", "Closed", "Cruising")
   fsm:AddTransition("Turning", "Closed", "Cruising")
   fsm:AddTransition("*", "Died", "Dead")
   
   --[FROM]  OnLeave<state>  -->  OnBefore<event> -->  [EVENT]  -->  OnAfter<event>  -->  OnEnter<state> [TO]  

   function fsm:OnAfterActivate(from, event, to, ac)
   
      ac:logDebug("OnAfterActivate")
      ac.navyGroup:Activate()
      ac.navyGroup:Cruise(ac.cruiseSpeed)
   
   end
      
   function fsm:OnAfterOpen(from, event, to, ac, durationMins)
   
      ac:logDebug("OnAfterOpen")
      local startTime = 0 --timer.getAbsTime()
      local endTime = startTime + (8 * 60 * 60) -- 8 hours in future
      --local startStr = UTILS.SecondsToClock(startTime, true)
      --local endStr = UTILS.SecondsToClock(endTime, true)
   
      --NAVYGROUP:AddTurnIntoWind(starttime,stoptime,speed,uturn,offset)
   
      ac.navyGroup:AddTurnIntoWind(startTime, endTime, ac.apparentWindSpeed, false, ac.deckAngle)
      
      self:__Opened(5, ac, durationMins)
   
   end
   
   function fsm:OnBeforeOpened(from, event, to, ac, durationMins)
   
      ac:logDebug("OnBeforeOpened")
   
      if ac:isTurnedIntoWind() then
         ac.windowEnd = timer.getAbsTime() + (durationMins * 60)
         return true
      end
      
      if ac.cancel then
         self:__Closed(1, ac)
         return false
      end
      
      self:__Opened(5, ac, durationMins)
      return false
   
   end
         
   function fsm:OnBeforeClosed(from, event, to, ac)
   
      ac:logDebug("OnBeforeClosed")
   
      if ac.cancel then
         -- Request to cancel acknowledged
         ac.cancel = false
         return true
      end
   
      if ac.extend then
         -- Request to extend window acknowledged
         self:__Extend(1, ac)
         return false
      end

      local time = timer.getAbsTime()

      if not ac.warningRaised then
         if time > (ac.windowEnd - 5*60) then
            -- 5 minutes until window closes
            ac:raiseRecoveryClosingEvent()
            ac.warningRaised = true
         end
      end

      if time > ac.windowEnd then
         -- Recover window has expired
         return true
      end
   
      -- Still within recover window.
      self:__Closed(3, ac)
      return false
   
   end
   
   function fsm:OnAfterClosed(from, event, to, ac)
   
      ac:logDebug("OnAfterClosed")
      ac.navyGroup:TurnIntoWindStop()
      ac.navyGroup:Cruise(ac.cruiseSpeed)
      --self:__Closed(1, ac)
   
   end
   
   function fsm:OnAfterExtend(from, event, to, ac)
   
      ac:logDebug("OnAfterExtend")
      ac.windowEnd = ac.windowEnd + (ac.extend * 60)
      ac.extend = nil
      ac.warningRaised = false
   
   end
   
   function fsm:OnEnterCruising(from, event, to, ac)
   
      ac:logDebug("OnEnterCruising")
      ac:raiseStateChangeEvent(from, to)
   
   end
   
   function fsm:OnEnterTurning(from, event, to, ac)
   
      ac:logDebug("OnEnterTurning")
      ac:raiseStateChangeEvent(from, to)
   
   end
   
   function fsm:OnEnterRecovering(from, event, to, ac)
   
      ac:logDebug("OnEnterRecovering")
      self:__Closed(5, ac)
      
      ac:raiseStateChangeEvent(from, to)
         
   end
   
   local ac = 
   {
      debug = false,
      fsm = fsm, 
      group = group,
      navyGroup = navy,
      recoverFlag = nil,
      cruiseFlag = nil,
      deckAngle = 0,
      cruiseSpeed = 10,
      apparentWindSpeed = 15,
      windowEnd = 0,
      extend = nil,
      cancel = false,
      eventHandlers = {stateChange = {}, recoveryClosing = {}},
      warningRaised = false,
   }

   local mt = {}
   mt.__index = self
   setmetatable(ac, mt)
   
   group:HandleEvent(EVENTS.Dead)
   
   function group:OnEventDead(EventData)
   
      if (group:GetName() == EventData.IniGroupName) then
         if (not group:IsAlive()) then
            fsm:Died(ac)
         end
      end
   end

   return ac

end

function AIRCRAFT_CARRIER:Activate()

   self.fsm:__Activate(1, self)

end

function AIRCRAFT_CARRIER:Recover(durationMins)

   self.fsm:__Open(1, self, durationMins or 30)

end

function AIRCRAFT_CARRIER:Extend(durationMins)

   self.extend = durationMins or 30

end

function AIRCRAFT_CARRIER:Cancel()

   self.cancel = true

end

function AIRCRAFT_CARRIER:OnStateChange(callback)

   table.insert(self.eventHandlers.stateChange, callback)

end

function AIRCRAFT_CARRIER:OnRecoveryClosing(callback)

   table.insert(self.eventHandlers.recoveryClosing, callback)

end

function AIRCRAFT_CARRIER:raiseStateChangeEvent(from, to)

   local handlers = self.eventHandlers.stateChange
   for i = 1, #handlers do
      handlers[i](from, to)
   end
   
   if self.cruiseFlag then
      if to == "Cruising" then
         USERFLAG:New(self.cruiseFlag.name):Set(self.cruiseFlag.value)
      else
         USERFLAG:New(self.cruiseFlag.name):Set(0)
      end
   end
   
   if self.recoverFlag then
      if to == "Recovering" then
         USERFLAG:New(self.recoverFlag.name):Set(self.recoverFlag.value)
      else
         USERFLAG:New(self.recoverFlag.name):Set(0)
      end
   end

end

function AIRCRAFT_CARRIER:raiseRecoveryClosingEvent()

   local handlers = self.eventHandlers.recoveryClosing
   for i = 1, #handlers do
      handlers[i]()
   end

end

function AIRCRAFT_CARRIER:isTurnedIntoWind()

   local expectedBRC =  self.navyGroup:GetHeadingIntoWind(self.deckAngle, self.apparentWindSpeed)
   local actualBRC = self:GetTrueBRC()
   local magBRC = self:GetMagneticBRC()

   self:logDebug("BRC expected=" .. expectedBRC .. "; actual=" .. actualBRC .. "; mag=" .. magBRC)

   -- ships heading is within 1 degree of expected course.
   return math.abs(expectedBRC - actualBRC) < 1

end

function AIRCRAFT_CARRIER:logDebug(msg)

   if (self and self.debug) then
      if (self.group) then
         env.info("AIRCRAFT_CARRIER [" .. self.group:GetName() .."]: " .. msg)
      else
         env.info("AIRCRAFT_CARRIER: " .. msg)
      end
   end

end

function AIRCRAFT_CARRIER:logError(msg)

   if (self and self.group) then
      env.error("AIRCRAFT_CARRIER [" .. self.group:GetName() .."]: " .. msg)
   else
      env.error("AIRCRAFT_CARRIER: " .. msg)
   end
      
end

AIRCRAFT_CARRIER_MENU = {}

function AIRCRAFT_CARRIER_MENU:NewForCoalition(coalition, rootMenu, text)

   local root = MENU_COALITION:New(coalition, text or "Aircraft Carriers", rootMenu)
   root:RemoveSubMenus()

   local m = 
   {
      coalition = coalition,
      root = root,
      registry = {},
   }

   local mt = {}
   mt.__index = self
   setmetatable(m, mt)
   
   return m

end

--[[
function AIRCRAFT_CARRIER_MENU:NewForGroup(group, rootMenu, text)

end

function AIRCRAFT_CARRIER_MENU:NewForPilotNearCarrier(radiusNm, rootMenu, text)

end
--]]

function AIRCRAFT_CARRIER_MENU:Register(carrier, displayName)

   if not carrier then
      self:logError("Unable to create.  Carrier is nil.")
      return
   end
   
   if not displayName then
      self:logError("Unable to create.  DisplayName is nil.")
      return
   end

   self.registry[displayName] = {carrier = carrier}
   
   carrier:OnStateChange(function(from, to) self:onCarrierStateChange(displayName, from, to) end)
   carrier:OnRecoveryClosing(function() self:onCarrierRecoveryClosing(displayName) end)
   self:refreshMenu(displayName)

end

function AIRCRAFT_CARRIER_MENU:onCarrierStateChange(displayName, from, to)

   self:refreshMenu(displayName)
   
   --- TODO: should message based on self.coalition, not hard-coded to BLUE
   
   if from == "Turning" and to == "Recovering" then
      local entry = self.registry[displayName]
      local time = UTILS.SecondsToClock(entry.carrier:GetClosingTime(), true)
      local brc = string.format("%03d", UTILS.Round(entry.carrier:GetMagneticBRC(), 0))
      MESSAGE:New(displayName .. " is ready to receive aircraft [BRC " .. brc .. "].", 10):ToBlue()
      MESSAGE:New("Recovery window will close at " .. time .. "L.", 10):ToBlue()
   end
   
   if from == "Recovering" and to == "Cruising" then
      MESSAGE:New(displayName .. " recovery window has closed.", 10):ToBlue()
   end

end

function AIRCRAFT_CARRIER_MENU:onCarrierRecoveryClosing(displayName)

   env.info("recovery closing!!")
   
   MESSAGE:New(displayName .. " recovery window will close in 5 minutes.", 10):ToBlue()

end

--[[
Aircraft Carrier...
   LHA-1 Tarawa...
   CVN-72 Lincoln...
      <status>
      Start Recovery...
         15 minutes
         30 minutes
         60 minutes
         90 minutes
      Extend Recovery...
         30 minutes...
         60 minutes...
      End Recovery...
         Confirm? Yes


    STATUS: TURNING
    STATUS: CRUISING
    STATUS: RECOVER
    [CLOSES @18:32 BRC 031]
--]]
function AIRCRAFT_CARRIER_MENU:refreshMenu(displayName)

   local entry = self.registry[displayName]

   local mnuCarrier = MENU_COALITION:New(self.coalition, displayName, self.root)
   mnuCarrier:RemoveSubMenus()
   
   local state = entry.carrier:GetStatus()
   
   if state == "Recovering" then
   
      local time = UTILS.SecondsToClock(entry.carrier:GetClosingTime(), true)
      local brc = string.format("%03d", entry.carrier:GetMagneticBRC())
   
      MENU_COALITION_COMMAND:New(self.coalition, "STATUS: RECOVER BRC " .. brc, mnuCarrier, function() end)
      MENU_COALITION_COMMAND:New(self.coalition, "[CLOSES @ " .. time .. "L]", mnuCarrier, function() end)
      
      local mnuExtend = MENU_COALITION:New(self.coalition, "Extend Recovery", mnuCarrier)
      MENU_COALITION_COMMAND:New(self.coalition, "15 minutes", mnuExtend, function() entry.carrier:Extend(15) end)
      MENU_COALITION_COMMAND:New(self.coalition, "30 minutes", mnuExtend, function() entry.carrier:Extend(30) end)
      MENU_COALITION_COMMAND:New(self.coalition, "60 minutes", mnuExtend, function() entry.carrier:Extend(60) end)
      MENU_COALITION_COMMAND:New(self.coalition, "90 minutes", mnuExtend, function() entry.carrier:Extend(90) end)
      
      local mnuEnd = MENU_COALITION:New(self.coalition, "End Recovery", mnuCarrier)
      MENU_COALITION_COMMAND:New(self.coalition, "Confirm? YES", mnuEnd, function() entry.carrier:Cancel() end)
   
   else
   
      MENU_COALITION_COMMAND:New(self.coalition, "STATUS: " .. string.upper(state), mnuCarrier, function() end)
      
      if state == "Turning" then
         local mnuEnd = MENU_COALITION:New(self.coalition, "Cancel Turn", mnuCarrier)
         MENU_COALITION_COMMAND:New(self.coalition, "Confirm? YES", mnuEnd, function() entry.carrier:Cancel() end)
      else
         local mnuStart = MENU_COALITION:New(self.coalition, "Start Recovery", mnuCarrier)
         MENU_COALITION_COMMAND:New(self.coalition, "15 minutes", mnuStart, function() entry.carrier:Recover(15) end)
         MENU_COALITION_COMMAND:New(self.coalition, "30 minutes", mnuStart, function() entry.carrier:Recover(30) end)
         MENU_COALITION_COMMAND:New(self.coalition, "60 minutes", mnuStart, function() entry.carrier:Recover(60) end)
         MENU_COALITION_COMMAND:New(self.coalition, "90 minutes", mnuStart, function() entry.carrier:Recover(90) end)
      end
      
   end

end

function AIRCRAFT_CARRIER_MENU:logDebug(msg)

   if (self and self.debug) then
      env.info("AIRCRAFT_CARRIER_MENU: " .. msg)     
   end

end

function AIRCRAFT_CARRIER_MENU:logError(msg)

   env.error("AIRCRAFT_CARRIER_MENU: " .. msg)
         
end

--[[
local cvn72 = AIRCRAFT_CARRIER:New(GROUP:FindByName("CVN-72"))
cvn72.debug = true
cvn72:SetDeckAngle(-9)
cvn72:SetWindOverDeck(28)
cvn72:SetCruiseSpeed(10)
cvn72:EnableFlagWhenRecovering("recover")
cvn72:EnableFlagWhenCruising("cruise")
cvn72:Activate()

--local lha1 = AIRCRAFT_CARRIER:New(GROUP:FindByName("LHA-1"))
--lha1.debug = true
--lha1:SetDeckAngle(0)
--lha1:SetWindOverDeck(13)
--lha1:SetCruiseSpeed(8)
--lha1:Activate()

local menu = AIRCRAFT_CARRIER_MENU:NewForCoalition(coalition.side.BLUE, nil, "Aircraft Carriers")
menu:Register(cvn72, "CVN-72 Lincoln")
--menu:Register(lha1, "LHA-1 Tarawa")
--]]

env.info("Grendel's Aircraft Carrier Script " .. version .. " END")