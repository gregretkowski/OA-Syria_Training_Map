env.info("Support Aircraft Loading", false)

-----------------
-- AWACS SPAWN --
-----------------
SPAWN:New('blueEWR_AWACS_MAGIC'):InitLimit(1,99):SpawnScheduled(60,1):InitRepeatOnLanding()
--SPAWN:New('blueEWR_AWACS_DARKSTAR'):InitLimit(1,99):SpawnScheduled(60,1):InitRepeatOnLanding()
--SPAWN:New('AWACS_BEAR'):InitLimit(1,99):SpawnScheduled(60,1):InitRepeatOnEngineShutDown()

------------------
-- TANKER START --
------------------

local Tanker_KC135MPRS_Shell1 = SPAWN
   :New( "Tanker_KC135MPRS_Shell1" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(238.175)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Shell1 )
     Shell1:CommandSetCallsign(3,1)
     end 
     )

local Tanker_KC135MPRS_Shell2 = SPAWN
   :New( "Tanker_KC135MPRS_Shell2" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(262.425)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Shell2 )
     Shell2:CommandSetCallsign(3,2)
     end 
     )
     
local Tanker_KC135_Texaco1 = SPAWN
   :New( "Tanker_KC135_Texaco1" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(317.750)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Texaco1 )
     Texaco1:CommandSetCallsign(1,1)
     end 
     )
     
local Tanker_KC135_Texaco2 = SPAWN
   :New( "Tanker_KC135_Texaco2" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(225.325)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Texaco2 )
     Texaco2:CommandSetCallsign(1,2)
     end 
     )
--[[  
local Tanker_C130_Arco3 = SPAWN
   :New( "Tanker_C130_Arco3" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(276.125)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Arco3 )
     Arco3:CommandSetCallsign(2,3)
     end 
     )
     
local Tanker_C130_Arco2 = SPAWN
   :New( "Tanker_C130_Arco2" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(317.550)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Arco2 )
     Arco2:CommandSetCallsign(2,2)
     end 
     )
]]--
env.info("Support Aircraft Complete", false)
