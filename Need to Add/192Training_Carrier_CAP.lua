env.info("Airforce Loading", false)

CAPZoneBlueCarrier 	= ZONE_GROUP:New("CAP Zone Carrier", GROUP:FindByName( "CVN-72" ), 25000)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////VARIABLES

BlueSquadronName1 = "USN Fighter"

BLUESQUADRON1GROUPNAME = ""

BlueSquadronsEnabled = 1

BlueRespawnTimerInitialMin = 5 --300
BlueRespawnTimerInitialMax = 10 --450

BlueRespawnTimerMin = 600
BlueRespawnTimerMax = 1200

BlueFlightLevelMin = 5
BlueFlightLevelMax = 13

BluePatrolWaypointDistance = 46300
BluePatrolWaypointInitial = 18520

EngagementDistance = 90000

CleanupTime = 300


USNAirForceCAP = { 
				 "USAF F/A-18C", 
				 "USAF F-14B", 
				 }
	
--[[
AWACS_MAGIC_DATA = {}
AWACS_MAGIC_DATA[1] = {
	TimeStamp 	= nil,
	Vec2 		= nil	
}

AWACS_DARKSTAR_DATA = {}
AWACS_DARKSTAR_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

SHELL_DATA = {}
SHELL_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

ARCO_DATA = {}
ARCO_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
]]--

BLUESQUADRON1_DATA = {}
BLUESQUADRON1_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON1_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
--[[
BLUESQUADRON2_DATA = {}
BLUESQUADRON2_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON2_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUESQUADRON3_DATA = {}
BLUESQUADRON3_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON3_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUESQUADRON4_DATA = {}
BLUESQUADRON4_DATA[1] = {
  TimeStamp   = nil,
  Vec2    = nil
}
BLUESQUADRON4_DATA[2] = {
  TimeStamp   = nil,
  Vec2    = nil
}
BLUESQUADRON5_DATA = {}
BLUESQUADRON5_DATA[1] = {
  TimeStamp   = nil,
  Vec2    = nil
}
BLUESQUADRON5_DATA[2] = {
  TimeStamp   = nil,
  Vec2    = nil
}
USAEFCAP_DATA = {}
USAEFCAP_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFCAP_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFCAS_DATA = {}
USAEFCAS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFCAS_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFSEAD_DATA = {}
USAEFSEAD_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFSEAD_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFPIN_DATA = {}
USAEFPIN_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFPIN_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFASS_DATA = {}
USAEFASS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFASS_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFDRONE_DATA = {}
USAEFDRONE_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

SYAAFAN26B_DATA = {}
SYAAFAN26B_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

IRIAFMI8_DATA = {}
IRIAFMI8_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAFC130_DATA = {}
USAFC130_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAFUH60A_DATA = {}
USAFUH60A_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

SYAAFSU24M_DATA = {}
SYAAFSU24M_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
SYAAFSU24M_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSSU25T_DATA = {}
VVSSU25T_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
VVSSU25T_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSTU95MS_DATA = {}
VVSTU95MS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSTU160_DATA = {}
VVSTU160_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSTU22M3_DATA = {}
VVSTU22M3_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}				 
]]--
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////AIRBASE INFORMATION
--[[
SEF_AIRBASEINFORMATION = {}
SEF_AIRBASEINFORMATION[1] = {				
		AirbaseName = "Abu al-Duhur",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Palmyra", "Hama", "Al Qusayr", "Rene Mouawad", "Bassel Al-Assad", "Taftanaz", "Minakh", "Hatay" },			
}	
SEF_AIRBASEINFORMATION[2] = {				
		AirbaseName = "Adana Sakirpasa",
		Neighbours = { "Incirlik", "Hatay", "Bassel Al-Assad", "Taftanaz", "Minakh", "Aleppo" },			
}
SEF_AIRBASEINFORMATION[3] = {				
		AirbaseName = "Aleppo",
		Neighbours = { "Minakh", "Kuweires", "Jirah", "Tabqa", "Abu al-Duhur", "Taftanaz", "Hatay", "Bassel Al-Assad", "Hama", "Incirlik", "Adana Sakirpasa", "Al Qusayr" },		
}
SEF_AIRBASEINFORMATION[4] = {				
		AirbaseName = "Al-Dumayr",
		Neighbours = { "An Nasiriyah", "Palmyra", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Rayak", "Beirut-Rafic Hariri", "Wujah Al Hajar", "Rene Mouawad", "Al Qusayr", "Hama", "Kiryat Shmona", "Haifa", "Ramat David", "Megiddo", "King Hussein Air College" },
}
SEF_AIRBASEINFORMATION[5] = {				
		AirbaseName = "Al Qusayr",
		Neighbours = { "Hama", "Palmyra", "Rayak", "Al-Dumayr", "Mezzeh", "Bassel Al-Assad", "Taftanaz", "Abu al-Duhur", "Aleppo", "Rene Mouawad", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj as Sultan North", "Marj as Sultan South", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "An Nasiriyah" },		
}
SEF_AIRBASEINFORMATION[6] = {				
		AirbaseName = "An Nasiriyah",
		Neighbours = { "Hama", "Palmyra", "Rayak", "Al-Dumayr", "Mezzeh", "Bassel Al-Assad", "Rene Mouawad", "Wujah Al Hajar", "King Hussein Air College", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj as Sultan North", "Marj as Sultan South", "Marj Ruhayyil", "Damascus", "Qabr as Sitt" },		
}
SEF_AIRBASEINFORMATION[7] = {				
		AirbaseName = "Bassel Al-Assad",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Hatay", "Minakh", "Taftanaz", "Abu al-Duhur", "Hama", "Rene Mouawad", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Rayak", "An Nasiriyah", "Al Qusayr", "Jirah", "Kuweires" },		
}
SEF_AIRBASEINFORMATION[8] = {				
		AirbaseName = "Beirut-Rafic Hariri",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "Bassel Al-Assad", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[9] = {				
		AirbaseName = "Damascus",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[10] = {				
		AirbaseName = "Eyn Shemer",
		Neighbours = { "Haifa", "Ramat David", "Megiddo", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South" },		
}
SEF_AIRBASEINFORMATION[11] = {				
		AirbaseName = "Haifa",
		Neighbours = { "Eyn Shemer", "Ramat David", "Megiddo", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Al-Dumayr" },		
}
SEF_AIRBASEINFORMATION[12] = {				
		AirbaseName = "Hama",
		Neighbours = { "Al Qusayr", "Hatay", "Taftanaz", "Abu al-Duhur", "Tabqa", "Palmyra", "Wujah Al Hajar", "Rene Mouawad", "Bassel Al-Assad", "Minakh", "Jirah", "Kuweires", "Aleppo", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South" },		
}
SEF_AIRBASEINFORMATION[13] = {				
		AirbaseName = "Hatay",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Minakh", "Aleppo", "Kuweires", "Abu al-Duhur", "Taftanaz", "Bassel Al-Assad", "Jirah", "Hama" },		
}
SEF_AIRBASEINFORMATION[14] = {				
		AirbaseName = "Incirlik",
		Neighbours = { "Adana Sakirpasa", "Hatay", "Minakh", "Aleppo", "Taftanaz", "Bassel Al-Assad" },		
}
SEF_AIRBASEINFORMATION[15] = {				
		AirbaseName = "Jirah",
		Neighbours = { "Tabqa", "Kuweires", "Abu al-Duhur", "Taftanaz", "Aleppo", "Minakh", "Hama", "Bassel Al-Assad", "Palmyra", "Hatay" },		
}
SEF_AIRBASEINFORMATION[16] = {				
		AirbaseName = "King Hussein Air College",
		Neighbours = { "Haifa", "Eyn Shemer", "Megiddo", "Ramat David", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South" },		
}
SEF_AIRBASEINFORMATION[17] = {				
		AirbaseName = "Kiryat Shmona",
		Neighbours = { "Haifa", "Eyn Shemer", "Megiddo", "Ramat David", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Rene Mouawad", "Al Qusayr" },		
}
SEF_AIRBASEINFORMATION[18] = {				
		AirbaseName = "Khalkhalah",
		Neighbours = { "Haifa", "Eyn Shemer", "Megiddo", "Ramat David", "King Hussein Air College", "Kiryat Shmona", "Marj Ruhayyil", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Rene Mouawad", "Al Qusayr" },		
}
SEF_AIRBASEINFORMATION[19] = {				
		AirbaseName = "Kuweires",
		Neighbours = { "Jirah", "Tabqa", "Abu al-Duhur", "Taftanaz", "Aleppo", "Minakh", "Hatay", "Bassel Al-Assad", "Hama", "Palmyra" },		
}
SEF_AIRBASEINFORMATION[20] = {				
		AirbaseName = "Marj as Sultan North",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Damascus", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[21] = {				
		AirbaseName = "Marj as Sultan South",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Damascus", "Marj as Sultan North", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[22] = {				
		AirbaseName = "Marj Ruhayyil",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Damascus", "Marj as Sultan South", "Marj as Sultan North", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[23] = {				
		AirbaseName = "Megiddo",
		Neighbours = { "Eyn Shemer", "Ramat David", "Haifa", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Al-Dumayr" },		
}
SEF_AIRBASEINFORMATION[24] = {				
		AirbaseName = "Mezzeh",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Damascus", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[25] = {				
		AirbaseName = "Minakh",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Abu al-Duhur", "Taftanaz", "Hatay", "Bassel Al-Assad", "Hama", "Incirlik", "Adana Sakirpasa" },		
}
SEF_AIRBASEINFORMATION[26] = {				
		AirbaseName = "Palmyra",
		Neighbours = { "Tabqa", "An Nasiriyah", "Al-Dumayr", "Hama", "Abu al-Duhur", "Jirah", "Kuweires", "Al Qusayr" },		
}
SEF_AIRBASEINFORMATION[27] = {				
		AirbaseName = "Qabr as Sitt",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Marj as Sultan North", "Mezzeh", "Damascus", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[28] = {				
		AirbaseName = "Ramat David",
		Neighbours = { "Eyn Shemer", "Megiddo", "Haifa", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Al-Dumayr" },		
}
SEF_AIRBASEINFORMATION[29] = {				
		AirbaseName = "Rayak",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "Bassel Al-Assad", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[30] = {				
		AirbaseName = "Rene Mouawad",
		Neighbours = { "Hama", "Palmyra", "Rayak", "Al-Dumayr", "Mezzeh", "Bassel Al-Assad", "Taftanaz", "Abu al-Duhur", "Al Qusayr", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj as Sultan North", "Marj as Sultan South", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "An Nasiriyah" },		
}
SEF_AIRBASEINFORMATION[31] = {				
		AirbaseName = "Tabqa",
		Neighbours = { "Palmyra", "Hama", "Abu al-Duhur", "Taftanaz", "Aleppo", "Kuweires", "Jirah", "Minakh" },		
}
SEF_AIRBASEINFORMATION[32] = {				
		AirbaseName = "Taftanaz",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Hama", "Al Qusayr", "Rene Mouawad", "Bassel Al-Assad", "Abu al-Duhur", "Minakh", "Hatay" },		
}
SEF_AIRBASEINFORMATION[33] = {				
		AirbaseName = "Wujah Al Hajar",
		Neighbours = { "Haifa", "Ramat David", "Megiddo", "Beirut-Rafic Hariri", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "Bassel Al-Assad" },		
}
]]--
function SEF_BLUESQUADRONSTOGGLE()

	if ( BlueSquadronsEnabled == 1 ) then		
		BlueSquadronsEnabled = 0
		trigger.action.outText("Allied AI CAP Flights Are Now Disabled", 15)		
	elseif ( BlueSquadronsEnabled == 0 ) then			
		BlueSquadronsEnabled = 1
		trigger.action.outText("Allied AI CAP Flights Are Now Enabled", 15)
	else
	end	
end



--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////BLUE SQUADRONS

function SEF_BLUESQUADRON1_SCHEDULER()
    
	if ( BlueSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(BLUESQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON1GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))			
		else
			SEF_BLUESQUADRON1_SPAWN()
			
			timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))		
	end	
end

function SEF_BLUESQUADRON1_SPAWN()
  
  if ( GROUP:FindByName(BLUESQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON1GROUPNAME):IsAlive() ) then
    --trigger.action.outText("Blue Squadron 1 Is Currently Active, Not Spawning A Replacement Yet",15)  
  else
    BLUESQUADRON1_DATA[1].Vec2 = nil
    BLUESQUADRON1_DATA[1].TimeStamp = nil
    BLUESQUADRON1_DATA[2].Vec2 = nil
    BLUESQUADRON1_DATA[2].TimeStamp = nil
    
    --local SpawnZone = AIRBASE:FindByName("CVN-72 Abraham Lincoln"):GetZone()
    local SpawnZone = CAPZoneBlueCarrier
    --local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()  
    
    local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
    BS1_FlightLevel = Randomiser * 1000
        
    local DepartureZoneVec2 = SpawnZone:GetVec2()
    --local TargetZoneVec2  = DestinationZone:GetVec2()
          
    local FlightDirection = math.random(1,100)
          
    if ( FlightDirection <= 50 ) then     
      --////Clockwise
      --Spawn Point
      BS1_WP0X = DepartureZoneVec2.x
      BS1_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS1_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial
      BS1_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone North Point
      BS1_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance
      BS1_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS1_WP3X = DepartureZoneVec2.x
      BS1_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance           
      --Perimeter Zone South Point
      BS1_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance
      BS1_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS1_WP5X = DepartureZoneVec2.x
      BS1_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance               
    else      
      --////Anti-Clockwise
      --Spawn Point
      BS1_WP0X = DepartureZoneVec2.x
      BS1_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS1_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
      BS1_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone South Point
      BS1_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance
      BS1_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS1_WP3X = DepartureZoneVec2.x
      BS1_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance           
      --Perimeter Zone North Point
      BS1_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance
      BS1_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS1_WP5X = DepartureZoneVec2.x
      BS1_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance         
    end   
    
    BLUESQUADRON1 = SPAWN:NewWithAlias("USAF F-14B", BlueSquadronName1)
              :InitRandomizeTemplate( USNAirForceCAP )              
                      
    :OnSpawnGroup(
      function( SpawnGroup )            
        BLUESQUADRON1GROUPNAME = SpawnGroup.GroupName
        BLUESQUADRON1GROUP = GROUP:FindByName(SpawnGroup.GroupName)             
                          
        --////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
        Mission = {
          ["id"] = "Mission",
          ["params"] = {    
            ["route"] = 
            {                                    
              ["points"] = 
              {
                [1] = 
                {
                  ["alt"] = BS1_FlightLevel/2,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = true,
                          ["id"] = "WrappedAction",
                          ["number"] = 1,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "EPLRS",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["groupId"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                        [2] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 2,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["variantIndex"] = 1,
                                ["name"] = 5,
                                ["formationIndex"] = 6,
                                ["value"] = 393217,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [2]
                        [3] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "EngageTargets",
                          ["number"] = 3,
                          ["params"] = 
                          {
                            ["targetTypes"] = 
                            {
                              [1] = "Air",
                            }, -- end of ["targetTypes"]
                            ["priority"] = 0,
                            ["value"] = "Air;",
                            ["noTargetTypes"] = 
                            {
                              [1] = "Cruise missiles",
                              [2] = "Antiship Missiles",
                              [3] = "AA Missiles",
                              [4] = "AG Missiles",
                              [5] = "SA Missiles",
                            }, -- end of ["noTargetTypes"]
                            ["maxDistEnabled"] = true,
                            ["maxDist"] = EngagementDistance,
                          }, -- end of ["params"]
                        }, -- end of [3]
                        [4] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 4,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 2,
                                ["name"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [4]
                        [5] = 
                        {
                          ["number"] = 5,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 264241152,
                                ["name"] = 10,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [5]
                        [6] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 6,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 19,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [6]
                        [7] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 7,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [7]                        
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 0,
                  ["ETA_locked"] = true,
                  ["y"] = BS1_WP0Y,
                  ["x"] = BS1_WP0X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [1]
                [2] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 127.32626754758,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP1Y,
                  ["x"] = BS1_WP1X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [2]
                [3] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 380.31328316984,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP2Y,
                  ["x"] = BS1_WP2X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [3]
                [4] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 832.92276094724,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP3Y,
                  ["x"] = BS1_WP3X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [4]
                [5] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1289.20366255,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP4Y,
                  ["x"] = BS1_WP4X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [5]
                [6] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["number"] = 1,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "SwitchWaypoint",
                              ["params"] = 
                              {
                                ["goToWaypointIndex"] = 3,
                                ["fromWaypointIndex"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1744.9128539618,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP5Y,
                  ["x"] = BS1_WP5X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [6]
              }, -- end of ["points"]
            }, -- end of ["route"]
          }, --end of ["params"]
        }--end of Mission       
        BLUESQUADRON1GROUP:SetTask(Mission)       
      end
    )
    --:SpawnInZone( SpawnZone, false, BS1_FlightLevel, BS1_FlightLevel )
    :SpawnAtAirbase( AIRBASE:FindByName( "CVN-72 A. Lincoln" ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold
    --trigger.action.outText("Blue Squadron 1 Is Launching Fighters", 15) 
  end
end

function SEF_ClearAIFightersFromCarrierDeck()
  if ( GROUP:FindByName(BLUESQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON1GROUPNAME):IsAlive() ) then
    Group.getByName(BLUESQUADRON1GROUPNAME):destroy()
    trigger.action.outText("USN Fighter Squadron Has Been Cleared", 15)
  else
    trigger.action.outText("USN Fighter Squadron Is Not Currently Deployed", 15)
  end 
end

--////BLUE CAP INITIALISE
timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
env.info("Carrier CAP Complete", false)
