env.info("ACM_bluefor loading", false)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN ACM/BFM SECTION
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- AI ACM/BFM
--
-- ZONES: if zones are MOOSE polygon zones, zone name in mission editor MUST be suffixed with ~ZONE_POLYGON
-- 

BFMACM_bluefor = {
  menuAdded_bluefor = {},
  menuF10_bluefor = {},
  zoneBfmAcmName_bluefor = "ACM_BLUEFOR", -- The BFM/ACM Zone
  zonesNoSpawnName_bluefor = { -- zones inside BFM/ACM zone within which adversaries may NOT be spawned.
      "zone_box",
  },
  adversary_bluefor = {
    menu = { -- Adversary menu
      {template = "ADV_Mirage_F1EE_BLUEFOR", menuText = "Adversary F1EE"},
      {template = "ADV_M-2000C_BLUEFOR", menuText = "Adversary Mirage 2000"},
      {template = "ADV_MiG-29_BLUEFOR", menuText = "Adversary MiG-29"},
      {template = "ADV_F-5E_BLUEFOR", menuText = "Adversary F-5E"},
      {template = "ADV_MiG-21_BLUEFOR", menuText = "Adversary MiG-21"},
      {template = "ADV_MiG-31_BLUEFOR", menuText = "Adversary MiG-31"},
      {template = "ADV_F-18C_BLUEFOR", menuText = "Adversary F-18C"},
      {template = "ADV_F-14A_BLUEFOR", menuText = "Adversary F-14A"},
      {template = "ADV_F16CM_BLUEFOR", menuText = "Adversary F-16CM"},
      {template = "ADV_J-11A_BLUEFOR", menuText = "Adversary J-11A/SU-27"},
      {template = "ADV_JF-17_BLUEFOR", menuText = "Adversary JF-17"},
    },
    range_bluefor = {5, 10, 20}, -- ranges at which to spawn_bluefor adversaries in nautical miles
    spawn_bluefor = {}, -- container for aversary spawn_bluefor objects
    defaultRadio = "245.000",
  },
}

--BFMACM_bluefor.rangeRadio = (JTF1.rangeRadio and JTF1.rangeRadio or BFMACM_bluefor.defaultRadio)

-- add event handler
BFMACM_bluefor.eventHandler = EVENTHANDLER:New()
BFMACM_bluefor.eventHandler:HandleEvent(EVENTS.PlayerEnterAircraft)
BFMACM_bluefor.eventHandler:HandleEvent(EVENTS.PlayerLeaveUnit)

-- check player is present and unit is alive
function BFMACM_bluefor:GetPlayerUnitAndName(unitname)
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

-- Add main BFMACM_bluefor zone
 _zone = ( ZONE:FindByName(BFMACM_bluefor.zoneBfmAcmName_bluefor) and ZONE:FindByName(BFMACM_bluefor.zoneBfmAcmName_bluefor) or ZONE_POLYGON:FindByName(BFMACM_bluefor.zoneBfmAcmName_bluefor))
if _zone == nil then
  _msg = "[ACM] ERROR: ACM Zone: " .. tostring(BFMACM_bluefor.zoneBfmAcmName_bluefor) .. " not found!"
  BASE:E(_msg)
else
  BFMACM_bluefor.zoneBfmAcm = _zone
  _msg = "[ACM] ACM Zone: " .. tostring(BFMACM_bluefor.zoneBfmAcmName_bluefor) .. " added."
  BASE:T(_msg)
end

-- Add spawn_bluefor exclusion zone(s)
if BFMACM_bluefor.zonesNoSpawnName_bluefor then
  BFMACM_bluefor.zonesNoSpawn = {}
  for i, zoneNoSpawnName in ipairs(BFMACM_bluefor.zonesNoSpawnName_bluefor) do
    _zone = (ZONE:FindByName(zoneNoSpawnName) and ZONE:FindByName(zoneNoSpawnName) or ZONE_POLYGON:FindByName(zoneNoSpawnName))
    if _zone == nil then
      _msg = "[ACM] ERROR: Exclusion zone: " .. tostring(zoneNoSpawnName) .. " not found!"
      BASE:E(_msg)
    else
      BFMACM_bluefor.zonesNoSpawn[i] = _zone
      _msg = "[ACM] Exclusion zone: " .. tostring(zoneNoSpawnName) .. " added."
      BASE:T(_msg)
    end
  end
else
  BASE:T("[ACM] No exclusion zones defined")
end

-- Add spawn_bluefor objects
for i, adversaryMenu in ipairs(BFMACM_bluefor.adversary_bluefor.menu) do
  _adv = GROUP:FindByName(adversaryMenu.template)
  if _adv then
    BFMACM_bluefor.adversary_bluefor.spawn_bluefor[adversaryMenu.template] = SPAWN:New(adversaryMenu.template)
  else
    _msg = "[ACM] ERROR: spawn_bluefor template: " .. tostring(adversaryMenu.template) .. " not found!" .. tostring(zoneNoSpawnName) .. " not found!"
    BASE:E(_msg)
  end
end

-- Spawn adversaries
function BFMACM_bluefor.SpawnAdv(adv,qty,group,rng,unit)
  local playerName = (unit:GetPlayerName() and unit:GetPlayerName() or "Unknown") 
  local range_bluefor = rng * 1852
  local hdg = unit:GetHeading()
  local pos = unit:GetPointVec2()
  local spawnPt = pos:Translate(range_bluefor, hdg, true)
  local spawnVec3 = spawnPt:GetVec3()

  -- check player is in BFM ACM zone.
  local spawnAllowed = unit:IsInZone(BFMACM_bluefor.zoneBfmAcm)
  local msgNoSpawn = ", Cannot spawn_bluefor adversary_bluefor aircraft if you are outside the ACM zone!"

  -- Check spawn_bluefor location is not in an exclusion zone
  if spawnAllowed then
    if BFMACM_bluefor.zonesNoSpawn then
      for i, zoneExclusion in ipairs(BFMACM_bluefor.zonesNoSpawn) do
        spawnAllowed = not zoneExclusion:IsVec3InZone(spawnVec3)
      end
      msgNoSpawn = ", Cannot spawn_bluefor adversary_bluefor aircraft in an exclusion zone. Change course, or increase your range_bluefor from the zone, and try again."
    end
  end

  -- Check spawn_bluefor location is inside the BFM/ACM zone
  if spawnAllowed then
    spawnAllowed = BFMACM_bluefor.zoneBfmAcm:IsVec3InZone(spawnVec3)
    msgNoSpawn = ", Cannot spawn_bluefor adversary_bluefor aircraft outside the ACM zone. Change course and try again."
  end

  -- Spawn the adversary_bluefor, if not in an exclusion zone or outside the BFM/ACM zone.
  if spawnAllowed then
    BFMACM_bluefor.adversary_bluefor.spawn_bluefor[adv]:InitGrouping(qty)
    :InitHeading(hdg + 180)
    :OnSpawnGroup(
      function ( SpawnGroup )
        local CheckAdversary = SCHEDULER:New( SpawnGroup, 
        function (CheckAdversary)
          if SpawnGroup then
            if SpawnGroup:IsNotInZone( BFMACM_bluefor.zoneBfmAcm ) then
              local msg = "All players, BFM Adversary left BFM Zone and was removed!"
              if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
                MISSIONSRS:SendRadio(msg,BFMACM_bluefor.rangeRadio)
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
      MISSIONSRS:SendRadio(msg,BFMACM_bluefor.rangeRadio)
    else -- otherwise, send in-game text message
      MESSAGE:New(msg):ToAll()
    end
    --MESSAGE:New(playerName .. " has spawned Adversary."):ToGroup(group)
  else
    local msg = playerName .. msgNoSpawn
    if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
      MISSIONSRS:SendRadio(msg,BFMACM_bluefor.rangeRadio)
    else -- otherwise, send in-game text message
      MESSAGE:New(msg):ToAll()
    end
    --MESSAGE:New(playerName .. msgNoSpawn):ToGroup(group)
  end
end
  
function BFMACM_bluefor:AddMenu(unitname)
  BASE:T("[ACM] AddMenu called.")
  local unit, playername = BFMACM_bluefor:GetPlayerUnitAndName(unitname)
  if unit and playername then
    local group = unit:GetGroup()
    local gid = group:GetID()
    local uid = unit:GetID()
    if group and gid then
      -- only add menu once!
      if BFMACM_bluefor.menuAdded_bluefor[uid] == nil then
        -- add GROUP menu if not already present
        if BFMACM_bluefor.menuF10_bluefor[gid] == nil then
          BASE:T("[ACM] Adding menu for group: " .. group:GetName())
          ACM = MENU_MISSION:New("BLUEFOR")
          BFMACM_bluefor.menuF10_bluefor[gid] = MENU_GROUP:New(group, "ACM", ACM)
        end
        if BFMACM_bluefor.menuF10_bluefor[gid][uid] == nil then
          -- add playername submenu
          BASE:T("[ACM] Add submenu for player: " .. playername)
          BFMACM_bluefor.menuF10_bluefor[gid][uid] = MENU_GROUP:New(group, playername, BFMACM_bluefor.menuF10_bluefor[gid])
          -- add adversary_bluefor submenus and range_bluefor selectors
          BASE:T("[ACM] Add submenus and range_bluefor selectors for player: " .. playername)
          for iMenu, adversary_bluefor in ipairs(BFMACM_bluefor.adversary_bluefor.menu) do
            -- Add adversary_bluefor type menu
            BFMACM_bluefor.menuF10_bluefor[gid][uid][iMenu] = MENU_GROUP:New(group, adversary_bluefor.menuText, BFMACM_bluefor.menuF10_bluefor[gid][uid])
            -- Add single or pair selection for adversary_bluefor type
            BFMACM_bluefor.menuF10_bluefor[gid][uid][iMenu].single = MENU_GROUP:New(group, "Single", BFMACM_bluefor.menuF10_bluefor[gid][uid][iMenu])
            BFMACM_bluefor.menuF10_bluefor[gid][uid][iMenu].pair = MENU_GROUP:New(group, "Pair", BFMACM_bluefor.menuF10_bluefor[gid][uid][iMenu])
            -- select range_bluefor at which to spawn_bluefor adversary_bluefor
            for iCommand, range_bluefor in ipairs(BFMACM_bluefor.adversary_bluefor.range_bluefor) do
                MENU_GROUP_COMMAND:New(group, tostring(range_bluefor) .. " nm", BFMACM_bluefor.menuF10_bluefor[gid][uid][iMenu].single, BFMACM_bluefor.SpawnAdv, adversary_bluefor.template, 1, group, range_bluefor, unit)
                MENU_GROUP_COMMAND:New(group, tostring(range_bluefor) .. " nm", BFMACM_bluefor.menuF10_bluefor[gid][uid][iMenu].pair, BFMACM_bluefor.SpawnAdv, adversary_bluefor.template, 2, group, range_bluefor, unit)
            end
          end
        end
        BFMACM_bluefor.menuAdded_bluefor[uid] = true
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
function BFMACM_bluefor.eventHandler:OnEventPlayerEnterAircraft(EventData)
  BASE:T("[BFMACM_bluefor] PlayerEnterAircraft called.")
  local unitname = EventData.IniUnitName
  local unit, playername = BFMACM_bluefor:GetPlayerUnitAndName(unitname)
  if unit and playername then
    BASE:T("[BFMACM_bluefor] Player entered Aircraft: " .. playername)
    SCHEDULER:New(nil, BFMACM_bluefor.AddMenu, {BFMACM_bluefor, unitname},0.1)
  end
end

-- handler for PlayerLeaveUnit event.
-- remove GROUP:UNIT menu.
function BFMACM_bluefor.eventHandler:OnEventPlayerLeaveUnit(EventData)
  local playername = EventData.IniPlayerName
  local unit = EventData.IniUnit
  local gid = EventData.IniGroup:GetID()
  local uid = EventData.IniUnit:GetID()
  BASE:T("[ACM] " .. playername .. " left unit:" .. unit:GetName() .. " UID: " .. uid)
  if gid and uid then
    if BFMACM_bluefor.menuF10_bluefor[gid] then
      BASE:T("[ACM] Removing menu for unit UID:" .. uid)
      BFMACM_bluefor.menuF10_bluefor[gid][uid]:Remove()
      BFMACM_bluefor.menuF10_bluefor[gid][uid] = nil
      BFMACM_bluefor.menuAdded_bluefor[uid] = nil
    end
  end
end

--- END ACMBFM SECTION
env.info("ACM_bluefor complete", false)