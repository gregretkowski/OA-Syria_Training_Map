env.info("RAT Loading", false)
--[[
local a320skins={"Air Berlin", "Alitalia", "American Airlines", "Delta Airlines", "Emirates", "Frontier", "Kuwait Airways", "Qatar", "United", "British Airways"}
local a330skins={"BOURKHAN", "DELTA", "Egypt Air", "Emirates", "GulfAir", "IRoI", "OmanAir", "Qatar", "Turkish Airlines", "US Airways"}
local a380skins={"Air France", "BA", "China Southern", "Emirates", "KA", "LH", "LHF", "Qantas Airways", "QTR", "SA", "TA"}
local b727skins={"Air France", "Alitalia", "American Airlines", "Delta Airlines", "Hapag Lloyd", "Lufthansa", "Northwest", "Singapore Airlines", "Southwest", "UNITED", "ZERO G"}
local b737skins={"Air Algerie", "Air Berlin", "Air France", "airBaltic", "Airzena", "AM", "American_Airlines", "British Airways", "C40s", "Disney", "EA", "easyjet", "FINNAIR", "Jet2", "kulula", "Lufthansa BA", "OMAN AIR", "Polskie Linie Lotnicze LOT", "QANTAS", "RYANAIR", "TNT", "UPS"}
local b747skins={"AF", "AF-One", "AI", "CP", "KLM", "LH", "QA", "TA"}
local b757skins={"AA", "BA", "C-32", "Delta", "DHL", "easyJet", "Swiss", "Thomson"}
local dc10skins={"SWISSAIR HB-IHL"}
local cessnaskins={"D-EKVW", "Muster", "N9672H", "SEagle_blue", "SEagle_red", "V5-BUG", "VH-JGA"}

b737:Livery(b737skins)
b747:Livery(b747skins)
b757:Livery(b757skins)
a380:Livery(a380skins)
chessna:Livery(cessnaskins)
]]--

ExcludedAirfields = {"Deir ez_Zor"}

RedLgTansportsTemplate = { "RAT_RED_AN-26B", 
           "RAT_RED_AN-30M",
           "RAT_RED_IL-76MD",
           "RAT_RED_TU-95MS",
           "RAT_RED_TU-160",
           "RAT_RED_H-6J",
            }
       
RedHeloTemplate = { "RAT_BLUE_HELO_MI-24V",
            "RAT_BLUE_HELO_KA-50",
            "RAT_BLUE_HELO_MI-8",
            }
       
BlueHeloTemplate = { "RAT_BLUE_HELO_CH-47D",
            "RAT_BLUE_HELO_CH-53",
            "RAT_BLUE_HELO_UH-60A",
            "RAT_BLUE_HELO_AH-64A",
            }
              
BlueLgTansportsTemplate = { "RAT_BLUE_A400M", 
           "RAT_BLUE_V-22",
           "RAT_BLUE_C-17A",
           "RAT_BLUE_C-2A",
           "RAT_BLUE_C-5",
           "RAT_BLUE_P-3C",
            }
 
BlueCarrierTemplate = { "RAT_BLUE_C-2A",
           "RAT_BLUE_HELO_CH-53",
            } 

CivilianTemplate = { "RAT_GREY_A-320",
           "RAT_GREY_A-330",
           "RAT_GREY_A-380",
           "RAT_GREY_B-727",
           "RAT_GREY_B-737",
           "RAT_GREY_B-747",
           "RAT_GREY_B-757",
           "RAT_GREY_DC-10",
           "RAT_GREY_Yak-40",
            } 
            
CivilianTemplateSM = { "RAT_GREY_Cessna-P210",
           "RAT_GREY_Yak-52",
           "RAT_GREY_Yak-40",
           "RAT_GREY_P51D",
            } 


--////RedLgTansports
local RedLgTransportRAT = RAT:New("RAT_RED_Template", "Red Transport") --yak1:RAT("RAT_YAK") will create a RAT object called "yak1". The template group in the mission editor must have the name "RAT_YAK".
RedLgTransportRAT:InitRandomizeTemplate(RedLgTansportsTemplate)
RedLgTransportRAT:SetTerminalType(AIRBASE.TerminalType.OpenMedOrBig)
RedLgTransportRAT:ExcludedAirports(ExcludedAirfields)
RedLgTransportRAT:SetMinDistance(50)
RedLgTransportRAT:EnableATC(true)
RedLgTransportRAT:ATC_Messages(false)
RedLgTransportRAT:SetCoalition("sameonly") --"same"=own coalition+neutral (default), "sameonly"=own coalition only, "neutral"=all neutral airports. Default is "same", so aircraft will use airports of the coalition their spawn template has plus all neutral airports.
RedLgTransportRAT:CheckOnRunway(true, 75, distance)
RedLgTransportRAT:CheckOnTop(true, 2)
RedLgTransportRAT:RespawnAfterCrashON()
RedLgTransportRAT:RespawnInAirAllowed(true) --If aircraft cannot be spawned on parking spots, it is allowed to spawn them in air above the same airport.
RedLgTransportRAT:SetEPLRS(true) --If true (or nil), turn EPLRS on.
RedLgTransportRAT:PlaceMarkers(false)
--RedLgTransportRAT:SetTakeoff("cold") --Type can be "takeoff-cold" or "cold", "takeoff-hot" or "hot", "takeoff-runway" or "runway", "air".
RedLgTransportRAT:TimeDestroyInactive(300) --Time in seconds. Default is 600 seconds = 10 minutes. Minimum is 60 seconds.
RedLgTransportRAT:Spawn(5)

--////RedHelos
local RedHelos = RAT:New("RAT_RED_HELO_Template", "Red Helo") --yak1:RAT("RAT_YAK") will create a RAT object called "yak1". The template group in the mission editor must have the name "RAT_YAK".
RedHelos:InitRandomizeTemplate(RedHeloTemplate)
RedHelos:SetCoalition("sameonly") --"same"=own coalition+neutral (default), "sameonly"=own coalition only, "neutral"=all neutral airports. Default is "same", so aircraft will use airports of the coalition their spawn template has plus all neutral airports.
RedHelos:SetTerminalType(AIRBASE.TerminalType.HelicopterUsable)
RedHelos:ExcludedAirports(ExcludedAirfields)
RedHelos:SetMaxDistance(190)
RedHelos:SetMinDistance(50)
RedHelos:EnableATC(true)
RedHelos:ATC_Messages(false)
RedHelos:CheckOnRunway(true, 75, distance)
RedHelos:CheckOnTop(true, 2)
RedHelos:RespawnAfterCrashON()
RedHelos:RespawnInAirAllowed(true) --If aircraft cannot be spawned on parking spots, it is allowed to spawn them in air above the same airport.
RedHelos:SetEPLRS(true) --If true (or nil), turn EPLRS on.
RedHelos:PlaceMarkers(false)
--RedHelos:SetTakeoff("cold") --Type can be "takeoff-cold" or "cold", "takeoff-hot" or "hot", "takeoff-runway" or "runway", "air".
RedHelos:TimeDestroyInactive(300) --Time in seconds. Default is 600 seconds = 10 minutes. Minimum is 60 seconds.
RedHelos:Spawn(5)

--////blueHelos
local BlueHelos = RAT:New("RAT_BLUE_HELO_Template", "Blue Helo") --yak1:RAT("RAT_YAK") will create a RAT object called "yak1". The template group in the mission editor must have the name "RAT_YAK".
BlueHelos:InitRandomizeTemplate(BlueHeloTemplate)
--BlueHelos:Uncontrolled()
--BlueHelos:ActivateUncontrolled(3, 60, 1200, .5)
BlueHelos:SetTerminalType(AIRBASE.TerminalType.HelicopterUsable)
BlueHelos:ExcludedAirports(ExcludedAirfields)
BlueHelos:SetMaxDistance(190)
BlueHelos:SetMinDistance(50)
BlueHelos:EnableATC(true)
BlueHelos:ATC_Messages(false)
BlueHelos:SetCoalition("sameonly") --"same"=own coalition+neutral (default), "sameonly"=own coalition only, "neutral"=all neutral airports. Default is "same", so aircraft will use airports of the coalition their spawn template has plus all neutral airports.
BlueHelos:CheckOnRunway(true, 75, distance)
BlueHelos:CheckOnTop(true, 2)
BlueHelos:ContinueJourney()
BlueHelos:RespawnAfterCrashON()
BlueHelos:RespawnInAirAllowed(true) --If aircraft cannot be spawned on parking spots, it is allowed to spawn them in air above the same airport.
BlueHelos:SetEPLRS(true) --If true (or nil), turn EPLRS on.
BlueHelos:PlaceMarkers(false)
--BlueHelos:SetTakeoff("cold") --Type can be "takeoff-cold" or "cold", "takeoff-hot" or "hot", "takeoff-runway" or "runway", "air".
BlueHelos:TimeDestroyInactive(300) --Time in seconds. Default is 600 seconds = 10 minutes. Minimum is 60 seconds.
BlueHelos:Spawn(2) --20 if uncontrolled

--////BlueLgTansports
local BlueLgTransportRAT = RAT:New("RAT_BLUE_Template", "Blue Transport") --yak1:RAT("RAT_YAK") will create a RAT object called "yak1". The template group in the mission editor must have the name "RAT_YAK".
BlueLgTransportRAT:InitRandomizeTemplate(BlueLgTansportsTemplate)
BlueLgTransportRAT:ExcludedAirports(ExcludedAirfields)
BlueLgTransportRAT:_Debug(false) --Turn debug on=true or off=false. No argument means on.
BlueLgTransportRAT:SetMinDistance(50)
BlueLgTransportRAT:EnableATC(true)
BlueLgTransportRAT:ATC_Messages(false)
BlueLgTransportRAT:SetCoalition("sameonly") --"same"=own coalition+neutral (default), "sameonly"=own coalition only, "neutral"=all neutral airports. Default is "same", so aircraft will use airports of the coalition their spawn template has plus all neutral airports.
BlueLgTransportRAT:CheckOnRunway(true, 75, distance)
BlueLgTransportRAT:CheckOnTop(true, 2)
BlueLgTransportRAT:SetDeparture({"RAT_WEST","RAT_NORTH", "RAT_SOUTH"})
BlueLgTransportRAT:RespawnAfterCrashON()
BlueLgTransportRAT:RespawnInAirAllowed(true) --If aircraft cannot be spawned on parking spots, it is allowed to spawn them in air above the same airport.
BlueLgTransportRAT:SetEPLRS(true) --If true (or nil), turn EPLRS on.
BlueLgTransportRAT:PlaceMarkers(false)
BlueLgTransportRAT:SetTakeoff("cold") --Type can be "takeoff-cold" or "cold", "takeoff-hot" or "hot", "takeoff-runway" or "runway", "air".
BlueLgTransportRAT:TimeDestroyInactive(300) --Time in seconds. Default is 600 seconds = 10 minutes. Minimum is 60 seconds.
BlueLgTransportRAT:Spawn(2)

--////BlueLgTansports2
local BlueLgTransportRAT2 = RAT:New("RAT_BLUE_Template2", "Blue Transport2") --yak1:RAT("RAT_YAK") will create a RAT object called "yak1". The template group in the mission editor must have the name "RAT_YAK".
BlueLgTransportRAT2:InitRandomizeTemplate(BlueLgTansportsTemplate)
BlueLgTransportRAT2:SetTerminalType(AIRBASE.TerminalType.OpenMedOrBig)
BlueLgTransportRAT2:ExcludedAirports(ExcludedAirfields)
--BlueLgTransportRAT2:Uncontrolled()
--BlueLgTransportRAT2:ActivateUncontrolled(3, 600, 1200, .5)
BlueLgTransportRAT2:SetTerminalType(AIRBASE.TerminalType.OpenBig)
BlueLgTransportRAT2:_Debug(false) --Turn debug on=true or off=false. No argument means on.
BlueLgTransportRAT2:SetMinDistance(50)
BlueLgTransportRAT2:EnableATC(true)
BlueLgTransportRAT2:ATC_Messages(false)
BlueLgTransportRAT2:SetCoalition("sameonly") --"same"=own coalition+neutral (default), "sameonly"=own coalition only, "neutral"=all neutral airports. Default is "same", so aircraft will use airports of the coalition their spawn template has plus all neutral airports.
BlueLgTransportRAT2:CheckOnRunway(true, 75, distance)
BlueLgTransportRAT2:CheckOnTop(true, 2)
BlueLgTransportRAT2:SetDeparture({"Ramat David","Akrotiri"})
BlueLgTransportRAT2:RespawnAfterCrashON()
BlueLgTransportRAT2:RespawnInAirAllowed(true) --If aircraft cannot be spawned on parking spots, it is allowed to spawn them in air above the same airport.
BlueLgTransportRAT2:SetEPLRS(true) --If true (or nil), turn EPLRS on.
BlueLgTransportRAT2:PlaceMarkers(false)
BlueLgTransportRAT2:SetTakeoff("cold") --Type can be "takeoff-cold" or "cold", "takeoff-hot" or "hot", "takeoff-runway" or "runway", "air".
BlueLgTransportRAT2:TimeDestroyInactive(300) --Time in seconds. Default is 600 seconds = 10 minutes. Minimum is 60 seconds.
BlueLgTransportRAT2:Spawn(2)

--////BlueCarrier
local BlueCarrierRAT = RAT:New("RAT_BLUE_Template", "Blue Carrier Transport") --yak1:RAT("RAT_YAK") will create a RAT object called "yak1". The template group in the mission editor must have the name "RAT_YAK".
BlueCarrierRAT:InitRandomizeTemplate(BlueCarrierTemplate)
BlueCarrierRAT:SetTerminalType(AIRBASE.TerminalType.OpenMedOrBig)
BlueCarrierRAT:ExcludedAirports(ExcludedAirfields)
BlueCarrierRAT:_Debug(false) --Turn debug on=true or off=false. No argument means on.
BlueCarrierRAT:EnableATC(true)
BlueCarrierRAT:ATC_Messages(false)
BlueCarrierRAT:SetCoalition("sameonly") --"same"=own coalition+neutral (default), "sameonly"=own coalition only, "neutral"=all neutral airports. Default is "same", so aircraft will use airports of the coalition their spawn template has plus all neutral airports.
BlueCarrierRAT:CheckOnRunway(true, 75, distance)
BlueCarrierRAT:CheckOnTop(true, 2)
BlueCarrierRAT:Commute(starshape) --If true, keep homebase, i.e. travel A-->B-->A-->C-->A-->D... instead of A-->B-->A-->B-->A...BlueCarrierRAT:Immortal()
BlueCarrierRAT:SetDeparture({"RAT_WEST","RAT_NORTH", "RAT_SOUTH", "Ramat David","Akrotiri"})
BlueCarrierRAT:SetDestination({"CVN-72 A. Lincoln","LHA-1 Tarawa"})
BlueCarrierRAT:RespawnAfterCrashON()
BlueCarrierRAT:RespawnInAirAllowed(true) --If aircraft cannot be spawned on parking spots, it is allowed to spawn them in air above the same airport.
BlueCarrierRAT:SetEPLRS(true) --If true (or nil), turn EPLRS on.
BlueCarrierRAT:PlaceMarkers(false)
--BlueCarrierRAT:SetTakeoff("cold") --Type can be "takeoff-cold" or "cold", "takeoff-hot" or "hot", "takeoff-runway" or "runway", "air".
BlueCarrierRAT:TimeDestroyInactive(300) --Time in seconds. Default is 600 seconds = 10 minutes. Minimum is 60 seconds.
BlueCarrierRAT:Spawn(2)

--////CivilianLg
local CivilianRAT = RAT:New("RAT_GREY_Template", "Civilian Transport") --yak1:RAT("RAT_YAK") will create a RAT object called "yak1". The template group in the mission editor must have the name "RAT_YAK".
CivilianRAT:InitRandomizeTemplate(CivilianTemplate)
CivilianRAT:ExcludedAirports(ExcludedAirfields)
CivilianRAT:_Debug(false) --Turn debug on=true or off=false. No argument means on.
--CivilianRAT:SetMinDistance(50)
CivilianRAT:EnableATC(true)
CivilianRAT:ATC_Messages(false)
CivilianRAT:SetCoalition("neutral") --"same"=own coalition+neutral (default), "sameonly"=own coalition only, "neutral"=all neutral airports. Default is "same", so aircraft will use airports of the coalition their spawn template has plus all neutral airports.
CivilianRAT:CheckOnRunway(true, 75, distance)
CivilianRAT:CheckOnTop(true, 2)
CivilianRAT:Commute(starshape) --If true, keep homebase, i.e. travel A-->B-->A-->C-->A-->D... instead of A-->B-->A-->B-->A...CivilianRAT:Immortal()
CivilianRAT:SetDeparture({"RAT_WEST","RAT_NORTH", "RAT_SOUTH"}) --, "Beirut-Rafic Hariri", "Adana Sakirpasa", "Gaziantep", "Sanliurfa", "Gazipasa", "Damascus", "Aleppo", "Larnaca"})
CivilianRAT:SetDestination({"Beirut-Rafic Hariri", "Adana Sakirpasa", "Gaziantep", "Damascus", "Aleppo", "Larnaca", "Paphos"})
CivilianRAT:RespawnAfterCrashON()
CivilianRAT:RespawnInAirAllowed(true) --If aircraft cannot be spawned on parking spots, it is allowed to spawn them in air above the same airport.
CivilianRAT:SetEPLRS(true) --If true (or nil), turn EPLRS on.
CivilianRAT:PlaceMarkers(false)
--CivilianRAT:SetTakeoff("cold") --Type can be "takeoff-cold" or "cold", "takeoff-hot" or "hot", "takeoff-runway" or "runway", "air".
CivilianRAT:TimeDestroyInactive(300) --Time in seconds. Default is 600 seconds = 10 minutes. Minimum is 60 seconds.
CivilianRAT:Spawn(2)

--////Beirut
local BeirutRAT = RAT:New("RAT_BEIRUT_Template", "Beirut Transport") --yak1:RAT("RAT_YAK") will create a RAT object called "yak1". The template group in the mission editor must have the name "RAT_YAK".
BeirutRAT:InitRandomizeTemplate(CivilianTemplate)
BeirutRAT:ExcludedAirports(ExcludedAirfields)
--BeirutRAT:Uncontrolled()
--BeirutRAT:ActivateUncontrolled(3, 60, 1200, .5)
BeirutRAT:SetMinDistance(50)
BeirutRAT:EnableATC(true)
BeirutRAT:ATC_Messages(false)
BeirutRAT:SetCoalition("neutral") --"same"=own coalition+neutral (default), "sameonly"=own coalition only, "neutral"=all neutral airports. Default is "same", so aircraft will use airports of the coalition their spawn template has plus all neutral airports.
BeirutRAT:CheckOnRunway(true, 75, distance)
BeirutRAT:CheckOnTop(true, 2)
BeirutRAT:Commute(starshape) --If true, keep homebase, i.e. travel A-->B-->A-->C-->A-->D... instead of A-->B-->A-->B-->A...BeirutRAT:Immortal()
BeirutRAT:SetDeparture({"Beirut-Rafic Hariri"})
BeirutRAT:SetDestination({"RAT_WEST","RAT_NORTH", "RAT_SOUTH", "Beirut-Rafic Hariri", "Adana Sakirpasa", "Gaziantep", "Damascus", "Aleppo", "Larnaca", "Paphos"})
BeirutRAT:RespawnAfterCrashON()
BeirutRAT:RespawnInAirAllowed(false) --If aircraft cannot be spawned on parking spots, it is allowed to spawn them in air above the same airport.
BeirutRAT:SetEPLRS(true) --If true (or nil), turn EPLRS on.
BeirutRAT:PlaceMarkers(false)
BeirutRAT:SetTakeoff("cold") --Type can be "takeoff-cold" or "cold", "takeoff-hot" or "hot", "takeoff-runway" or "runway", "air".
RedLgTransportRAT:TimeDestroyInactive(300) --Time in seconds. Default is 600 seconds = 10 minutes. Minimum is 60 seconds.
BeirutRAT:Spawn(2) --15 for uncontrolled

--////CivilianSm
local CivilianRATsm = RAT:New("RAT_GREY_SM_Template", "Civilian Sm Transport") --yak1:RAT("RAT_YAK") will create a RAT object called "yak1". The template group in the mission editor must have the name "RAT_YAK".
CivilianRATsm:InitRandomizeTemplate(CivilianTemplateSM)
CivilianRATsm:ExcludedAirports(ExcludedAirfields)
--CivilianRATsm:Uncontrolled()
--CivilianRATsm:ActivateUncontrolled(5, 60, 1200, .5)
CivilianRATsm:_Debug(false) --Turn debug on=true or off=false. No argument means on.
CivilianRATsm:EnableATC(true)
CivilianRATsm:ATC_Messages(false)
CivilianRATsm:SetCoalition("neutral") --"same"=own coalition+neutral (default), "sameonly"=own coalition only, "neutral"=all neutral airports. Default is "same", so aircraft will use airports of the coalition their spawn template has plus all neutral airports.
CivilianRATsm:CheckOnRunway(true, 75, distance)
CivilianRATsm:CheckOnTop(true, 2)
CivilianRATsm:SetFLmax(80)
CivilianRATsm:SetMaxDistance(241)
CivilianRATsm:Commute(starshape) --If true, keep homebase, i.e. travel A-->B-->A-->C-->A-->D... instead of A-->B-->A-->B-->A...CivilianRATsm:Immortal()
CivilianRATsm:SetDeparture({"Kingsfield", "Ercan", "Lakatamia", "Gecitkale", "Pinarbashi", "Gazipasa", "Gaziantep", "Sanliurfa", "Adana Sakirpasa", "Aleppo", "Kiryat Shmona", "Eyn Shemer", "Megiddo", "Wujah Al Hajar", "Haifa", "Hatay"})
CivilianRATsm:SetDestination({"Kingsfield", "Ercan", "Lakatamia", "Gecitkale", "Pinarbashi", "Gazipasa", "Gaziantep", "Sanliurfa", "Adana Sakirpasa", "Aleppo", "Kiryat Shmona", "Eyn Shemer", "Megiddo", "Wujah Al Hajar", "Haifa", "Hatay"})
CivilianRATsm:RespawnAfterCrashON()
CivilianRATsm:RespawnInAirAllowed(false) --If aircraft cannot be spawned on parking spots, it is allowed to spawn them in air above the same airport.
CivilianRATsm:SetEPLRS(true) --If true (or nil), turn EPLRS on.
CivilianRATsm:PlaceMarkers(false)
--CivilianRATsm:SetTakeoff("cold") --Type can be "takeoff-cold" or "cold", "takeoff-hot" or "hot", "takeoff-runway" or "runway", "air".
RedLgTransportRAT:TimeDestroyInactive(300) --Time in seconds. Default is 600 seconds = 10 minutes. Minimum is 60 seconds.
CivilianRATsm:Spawn(2) --50 for uncontrolled

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
--BlueTransportRAT:SetCoalitionAircraft(color) --Color of coalition, i.e. "red" or blue" or "neutral".
--BlueTransportRAT:RadioMenuOFF()
--BlueTransportRAT:Livery(skins)
--BlueTransportRAT:ExcludedAirports(ports)
--BlueTransportRAT:Commute(starshape) --If true, keep homebase, i.e. travel A-->B-->A-->C-->A-->D... instead of A-->B-->A-->B-->A...

env.info("RAT Compelte", false)