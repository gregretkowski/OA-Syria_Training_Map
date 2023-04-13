env.info("Start Naval Range")

--function ShipSpawn1()
Ship1 = SPAWN:New( "Warship_Patrol-1" )
  :InitLimit( 7, 1 )
  :InitRandomizeRoute( 0, 9, 200 ) -- Randomize route starting from point 1 till point 9, with a radius of 200 meters around each point.
  :SpawnScheduled( 1, 1 )
--end

--function ShipSpawn2()
Ship2 = SPAWN:New( "Warship_Patrol-2" )
  :InitLimit( 7, 1 )
  :InitRandomizeRoute( 0, 9, 200 ) -- Randomize route starting from point 1 till point 9, with a radius of 200 meters around each point.
  :SpawnScheduled( 1, 1 )
--end

--function ShipSpawn3()
Ship3 = SPAWN:New( "Warship_Patrol-3" )
  :InitLimit( 7, 1 )
  :InitRandomizeRoute( 0, 9, 200 ) -- Randomize route starting from point 1 till point 9, with a radius of 200 meters around each point.
  :SpawnScheduled( 1, 1 )
--end

env.info("End Naval Range")
