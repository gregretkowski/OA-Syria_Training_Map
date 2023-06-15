env.info("ACM_redfor loading", false)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN ACM/BFM SECTION
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- AI ACM/BFM
--
-- ZONES: if zones are MOOSE polygon zones, zone name in mission editor MUST be suffixed with ~ZONE_POLYGON
-- 

BFMACM_redfor = {
  menuAdded_redfor = {},
  menuF10_redfor = {},
  zoneBfmAcmName_redfor = "ACM_REDFOR", -- The BFM/ACM Zone
  zonesNoSpawnName_redfor = { -- zones inside BFM/ACM zone within which adversaries may NOT be spawned.
      "zone_box",
  },
  adversary_redfor = {
    menu = { -- Adversary menu
      {template = "ADV_F1CE_REDFOR", menuText = "Adversary F1"},
      {template = "ADV_M2000_REDFOR", menuText = "Adversary Mirage V"},
      {template = "ADV_F15_REDFOR", menuText = "Adversary A4"},
      {template = "ADV_F5_REDFOR", menuText = "Adversary F-5"},
      {template = "ADV_Mig21_REDFOR", menuText = "Adversary Mig-21"},
      {template = "ADV_Mig29_REDFOR", menuText = "Adversary Mig-29"},
      {template = "ADV_F18_REDFOR", menuText = "Adversary F-18"},
      {template = "ADV_F14_REDFOR", menuText = "Adversary F-14"},
      {template = "ADV_F16_REDFOR", menuText = "Adversary F-16"},
    },
    range_redfor = {5, 10, 20}, -- ranges at which to spawn_redfor adversaries in nautical miles
    spawn_redfor = {}, -- container for aversary spawn_redfor objects
    defaultRadio = "245.000",
  },
}

--BFMACM_redfor.rangeRadio = (JTF1.rangeRadio and JTF1.rangeRadio or BFMACM_redfor.defaultRadio)

-- add event handler
BFMACM_redfor.eventHandler = EVENTHANDLER:New()
BFMACM_redfor.eventHandler:HandleEvent(EVENTS.PlayerEnterAircraft)
BFMACM_redfor.eventHandler:HandleEvent(EVENTS.PlayerLeaveUnit)

-- check player is present and unit is alive
function BFMACM_redfor:GetPlayerUnitAndName(unitname)
  if unitname ~= nil then
    local DCSunit = Unit.getByName(unitname)
    if DCSunit then
      local playername=DCSunit:getPlayerName()
      local unit = UNIT:Find(DCSunit)
      if DCSunit and unit and playername then
        return unit, playername
      end
    end
  end
  -- Return nil if we could not find a player.
  return nil,nil
end

-- Add main BFMACM_redfor zone
 _zone = ( ZONE:FindByName(BFMACM_redfor.zoneBfmAcmName_redfor) and ZONE:FindByName(BFMACM_redfor.zoneBfmAcmName_redfor) or ZONE_POLYGON:FindByName(BFMACM_redfor.zoneBfmAcmName_redfor))
if _zone == nil then
  _msg = "[ACM] ERROR: ACM Zone: " .. tostring(BFMACM_redfor.zoneBfmAcmName_redfor) .. " not found!"
  BASE:E(_msg)
else
  BFMACM_redfor.zoneBfmAcm = _zone
  _msg = "[ACM] ACM Zone: " .. tostring(BFMACM_redfor.zoneBfmAcmName_redfor) .. " added."
  BASE:T(_msg)
end

-- Add spawn_redfor exclusion zone(s)
if BFMACM_redfor.zonesNoSpawnName_redfor then
  BFMACM_redfor.zonesNoSpawn = {}
  for i, zoneNoSpawnName in ipairs(BFMACM_redfor.zonesNoSpawnName_redfor) do
    _zone = (ZONE:FindByName(zoneNoSpawnName) and ZONE:FindByName(zoneNoSpawnName) or ZONE_POLYGON:FindByName(zoneNoSpawnName))
    if _zone == nil then
      _msg = "[ACM] ERROR: Exclusion zone: " .. tostring(zoneNoSpawnName) .. " not found!"
      BASE:E(_msg)
    else
      BFMACM_redfor.zonesNoSpawn[i] = _zone
      _msg = "[ACM] Exclusion zone: " .. tostring(zoneNoSpawnName) .. " added."
      BASE:T(_msg)
    end
  end
else
  BASE:T("[ACM] No exclusion zones defined")
end

-- Add spawn_redfor objects
for i, adversaryMenu in ipairs(BFMACM_redfor.adversary_redfor.menu) do
  _adv = GROUP:FindByName(adversaryMenu.template)
  if _adv then
    BFMACM_redfor.adversary_redfor.spawn_redfor[adversaryMenu.template] = SPAWN:New(adversaryMenu.template)
  else
    _msg = "[ACM] ERROR: spawn_redfor template: " .. tostring(adversaryMenu.template) .. " not found!" .. tostring(zoneNoSpawnName) .. " not found!"
    BASE:E(_msg)
  end
end

-- Spawn adversaries
function BFMACM_redfor.SpawnAdv(adv,qty,group,rng,unit)
  local playerName = (unit:GetPlayerName() and unit:GetPlayerName() or "Unknown") 
  local range_redfor = rng * 1852
  local hdg = unit:GetHeading()
  local pos = unit:GetPointVec2()
  local spawnPt = pos:Translate(range_redfor, hdg, true)
  local spawnVec3 = spawnPt:GetVec3()

  -- check player is in BFM ACM zone.
  local spawnAllowed = unit:IsInZone(BFMACM_redfor.zoneBfmAcm)
  local msgNoSpawn = ", Cannot spawn_redfor adversary_redfor aircraft if you are outside the ACM zone!"

  -- Check spawn_redfor location is not in an exclusion zone
  if spawnAllowed then
    if BFMACM_redfor.zonesNoSpawn then
      for i, zoneExclusion in ipairs(BFMACM_redfor.zonesNoSpawn) do
        spawnAllowed = not zoneExclusion:IsVec3InZone(spawnVec3)
      end
      msgNoSpawn = ", Cannot spawn_redfor adversary_redfor aircraft in an exclusion zone. Change course, or increase your range_redfor from the zone, and try again."
    end
  end

  -- Check spawn_redfor location is inside the BFM/ACM zone
  if spawnAllowed then
    spawnAllowed = BFMACM_redfor.zoneBfmAcm:IsVec3InZone(spawnVec3)
    msgNoSpawn = ", Cannot spawn_redfor adversary_redfor aircraft outside the ACM zone. Change course and try again."
  end

  -- Spawn the adversary_redfor, if not in an exclusion zone or outside the BFM/ACM zone.
  if spawnAllowed then
    BFMACM_redfor.adversary_redfor.spawn_redfor[adv]:InitGrouping(qty)
    :InitHeading(hdg + 180)
    :OnSpawnGroup(
      function ( SpawnGroup )
        local CheckAdversary = SCHEDULER:New( SpawnGroup, 
        function (CheckAdversary)
          if SpawnGroup then
            if SpawnGroup:IsNotInZone( BFMACM_redfor.zoneBfmAcm ) then
              local msg = "All players, BFM Adversary left BFM Zone and was removed!"
              if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
                MISSIONSRS:SendRadio(msg,BFMACM_redfor.rangeRadio)
              else -- otherwise, send in-game text message
                MESSAGE:New(msg):ToAll()
              end
              --MESSAGE:New("Adversary left BFM Zone and was removed!"):ToAll()
              SpawnGroup:Destroy()
              SpawnGroup = nil
            end
          end
        end,
        {}, 0, 5 )
      end
    )
    :SpawnFromVec3(spawnVec3)
    local msg = "All players, " .. playerName .. " has spawned BFM Adversary."
    if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
      MISSIONSRS:SendRadio(msg,BFMACM_redfor.rangeRadio)
    else -- otherwise, send in-game text message
      MESSAGE:New(msg):ToAll()
    end
    --MESSAGE:New(playerName .. " has spawned Adversary."):ToGroup(group)
  else
    local msg = playerName .. msgNoSpawn
    if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
      MISSIONSRS:SendRadio(msg,BFMACM_redfor.rangeRadio)
    else -- otherwise, send in-game text message
      MESSAGE:New(msg):ToAll()
    end
    --MESSAGE:New(playerName .. msgNoSpawn):ToGroup(group)
  end
end
  
function BFMACM_redfor:AddMenu(unitname)
  BASE:T("[ACM] AddMenu called.")
  local unit, playername = BFMACM_redfor:GetPlayerUnitAndName(unitname)
  if unit and playername then
    local group = unit:GetGroup()
    local gid = group:GetID()
    local uid = unit:GetID()
    if group and gid then
      -- only add menu once!
      if BFMACM_redfor.menuAdded_redfor[uid] == nil then
        -- add GROUP menu if not already present
        if BFMACM_redfor.menuF10_redfor[gid] == nil then
          BASE:T("[ACM] Adding menu for group: " .. group:GetName())
          ACM = MENU_COALITION:New(coalition.side.RED, "REDFOR")
          BFMACM_redfor.menuF10_redfor[gid] = MENU_GROUP:New(group, "ACM", ACM)
        end
        if BFMACM_redfor.menuF10_redfor[gid][uid] == nil then
          -- add playername submenu
          BASE:T("[ACM] Add submenu for player: " .. playername)
          BFMACM_redfor.menuF10_redfor[gid][uid] = MENU_GROUP:New(group, playername, BFMACM_redfor.menuF10_redfor[gid])
          -- add adversary_redfor submenus and range_redfor selectors
          BASE:T("[ACM] Add submenus and range_redfor selectors for player: " .. playername)
          for iMenu, adversary_redfor in ipairs(BFMACM_redfor.adversary_redfor.menu) do
            -- Add adversary_redfor type menu
            BFMACM_redfor.menuF10_redfor[gid][uid][iMenu] = MENU_GROUP:New(group, adversary_redfor.menuText, BFMACM_redfor.menuF10_redfor[gid][uid])
            -- Add single or pair selection for adversary_redfor type
            BFMACM_redfor.menuF10_redfor[gid][uid][iMenu].single = MENU_GROUP:New(group, "Single", BFMACM_redfor.menuF10_redfor[gid][uid][iMenu])
            BFMACM_redfor.menuF10_redfor[gid][uid][iMenu].pair = MENU_GROUP:New(group, "Pair", BFMACM_redfor.menuF10_redfor[gid][uid][iMenu])
            -- select range_redfor at which to spawn_redfor adversary_redfor
            for iCommand, range_redfor in ipairs(BFMACM_redfor.adversary_redfor.range_redfor) do
                MENU_GROUP_COMMAND:New(group, tostring(range_redfor) .. " nm", BFMACM_redfor.menuF10_redfor[gid][uid][iMenu].single, BFMACM_redfor.SpawnAdv, adversary_redfor.template, 1, group, range_redfor, unit)
                MENU_GROUP_COMMAND:New(group, tostring(range_redfor) .. " nm", BFMACM_redfor.menuF10_redfor[gid][uid][iMenu].pair, BFMACM_redfor.SpawnAdv, adversary_redfor.template, 2, group, range_redfor, unit)
            end
          end
        end
        BFMACM_redfor.menuAdded_redfor[uid] = true
      end
    else
      BASE:T(string.format("[ACM] ERROR: Could not find group or group ID in AddMenu() function. Unit name: %s.", unitname))
    end
  else
    BASE:T(string.format("[ACM] ERROR: Player unit does not exist in AddMenu() function. Unit name: %s.", unitname))
  end
end
  
-- handler for PlayEnterAircraft event.
-- call function to add GROUP:UNIT menu.
function BFMACM_redfor.eventHandler:OnEventPlayerEnterAircraft(EventData)
  BASE:T("[BFMACM_redfor] PlayerEnterAircraft called.")
  local unitname = EventData.IniUnitName
  local unit, playername = BFMACM_redfor:GetPlayerUnitAndName(unitname)
  if unit and playername then
    BASE:T("[BFMACM_redfor] Player entered Aircraft: " .. playername)
    SCHEDULER:New(nil, BFMACM_redfor.AddMenu, {BFMACM_redfor, unitname},0.1)
  end
end

-- handler for PlayerLeaveUnit event.
-- remove GROUP:UNIT menu.
function BFMACM_redfor.eventHandler:OnEventPlayerLeaveUnit(EventData)
  local playername = EventData.IniPlayerName
  local unit = EventData.IniUnit
  local gid = EventData.IniGroup:GetID()
  local uid = EventData.IniUnit:GetID()
  BASE:T("[ACM] " .. playername .. " left unit:" .. unit:GetName() .. " UID: " .. uid)
  if gid and uid then
    if BFMACM_redfor.menuF10_redfor[gid] then
      BASE:T("[ACM] Removing menu for unit UID:" .. uid)
      BFMACM_redfor.menuF10_redfor[gid][uid]:Remove()
      BFMACM_redfor.menuF10_redfor[gid][uid] = nil
      BFMACM_redfor.menuAdded_redfor[uid] = nil
    end
  end
end

--- END ACMBFM SECTION
env.info("ACM_redfor complete", false)