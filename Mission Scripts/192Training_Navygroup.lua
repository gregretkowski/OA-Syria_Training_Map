env.info("Navygroup Loading", false)
-------------------------------
--- Lincoln RECOVERY TANKER ---
-------------------------------

local ArcoRoosevelt=RECOVERYTANKER:New(UNIT:FindByName("CVN-72 A. Lincoln"), "Tanker_S3-B_Arco1 #IFF:(12)5017FR")
ArcoRoosevelt:SetTakeoffCold()
ArcoRoosevelt:SetRespawnInAir()
ArcoRoosevelt:SetUnlimitedFuel(true)
ArcoRoosevelt:SetTACAN(117, "ARC", "X")
ArcoRoosevelt:SetRadio(317.525, "AM")
ArcoRoosevelt:SetCallsign(2,1)
ArcoRoosevelt:Start()


-------------------------------
----- Lincoln RESCUE HELO -----
-------------------------------

-- Rescue helo needs to be a global variable to prevent it from being garbage collected
RescueheloLincoln=RESCUEHELO:New(UNIT:FindByName("CVN-72 A. Lincoln"), "Rescue_Helo #IFF:(12)5016FR")
RescueheloLincoln:SetTakeoffHot()
RescueheloLincoln:SetRespawnInAir()
RescueheloLincoln:SetAltitude(60)
RescueheloLincoln:SetOffsetX(300) --left/right
RescueheloLincoln:SetOffsetZ(300) --fwd/back
RescueheloLincoln:Start()
RescueheloLincoln.helo:CommandSetUnlimitedFuel(true)

-------------------------------
----- Tarawa RESCUE HELO -----
-------------------------------

local RescueheloTarawa=RESCUEHELO:New(UNIT:FindByName("LHA-1 Tarawa"), "Rescue_Helo #IFF:(12)5016FR")
RescueheloTarawa:SetTakeoffHot()
RescueheloTarawa:SetAltitude(60)
RescueheloTarawa:SetOffsetX(300) --left/right
RescueheloTarawa:SetOffsetZ(300) --fwd/back
RescueheloTarawa:Start()

-------------------------------
----- Kuznetsov RESCUE HELO -----
-------------------------------

local RescueheloTarawa=RESCUEHELO:New(UNIT:FindByName("Kuznetsov"), "Rescue_Helo_Red")
RescueheloTarawa:SetTakeoffHot()
RescueheloTarawa:SetAltitude(35)
RescueheloTarawa:SetOffsetX(0) --left/right
RescueheloTarawa:SetOffsetZ(-300) --fwd/back
RescueheloTarawa:Start()

-------------------------------
------ Lincoln Navygroup ------
-------------------------------
local cvn72 = AIRCRAFT_CARRIER:New(GROUP:FindByName("CVN-72"))
--cvn72.debug = true
cvn72:SetDeckAngle(-9)
cvn72:SetWindOverDeck(28)
cvn72:SetCruiseSpeed(10)

-- These flags allow us to turn on/off runway lights.
cvn72:EnableFlagWhenRecovering("recover")
cvn72:EnableFlagWhenCruising("cruise")
cvn72:Activate()

local lha1 = AIRCRAFT_CARRIER:New(GROUP:FindByName("LHA-1 Tarawa"))
--lha1.debug = true
lha1:SetDeckAngle(0)
lha1:SetWindOverDeck(15)
lha1:SetCruiseSpeed(8)
lha1:Activate()

local menu = AIRCRAFT_CARRIER_MENU:NewForCoalition(coalition.side.BLUE, nil, "Aircraft Carriers")
menu:Register(cvn72, "CVN-72 Lincoln")
menu:Register(lha1, "LHA-1 Tarawa")

env.info("Navygroup Complete", false)