env.info("Navygroup Loading", false)

-------------------------------
--- Lincoln RECOVERY TANKER ---
-------------------------------

local ArcoRoosevelt=RECOVERYTANKER:New(UNIT:FindByName("CVN-72 A. Lincoln"), "Tanker_S3-B_Arco1")
ArcoRoosevelt:SetTakeoffCold()
ArcoRoosevelt:SetTACAN(117, "ARC")
ArcoRoosevelt:SetRadio(317.525, "AM")
ArcoRoosevelt:SetCallsign(2,1)
ArcoRoosevelt:Start()


-------------------------------
----- Lincoln RESCUE HELO -----
-------------------------------

local RescueheloLincoln=RESCUEHELO:New(UNIT:FindByName("CVN-72 A. Lincoln"), "Rescue_Helo")
RescueheloLincoln:SetTakeoffHot()
RescueheloLincoln:SetAltitude(60)
RescueheloLincoln:SetOffsetX(300)
RescueheloLincoln:SetOffsetZ(300)
RescueheloLincoln:Start()


env.info("Navygroup Complete", false)