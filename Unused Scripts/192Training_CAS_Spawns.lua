env.info("CAS Loading", false)

-----------------
-- AWACS SPAWN --
-----------------
SPAWN:New('Qaraoun JTAC Helo Infrantry 1'):InitLimit(6,99):SpawnScheduled(120,1)
SPAWN:New('Qaraoun JTAC Helo Insert'):InitLimit(2,99):SpawnScheduled(120,1)

env.info("CAS Complete", false)