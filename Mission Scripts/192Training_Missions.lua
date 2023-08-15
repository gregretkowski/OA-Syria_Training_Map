env.info("Missions Loading", false)


function SEF_CSARMISSION()

ZoneTable = { ZONE:New( "SISI CSAR" ), ZONE:New( "COD CSAR" )}

TemplateTable = { "CSARspawn"}

Spawn_Vehicle_1 = SPAWN:New( "CSARspawn" )
  :InitLimit( 1, 1 )
  :InitRandomizeTemplate( TemplateTable ) 
  :InitRandomizeZones( ZoneTable )
  :Spawn()
end

function SEF_CSARDESPAWN() -- Add Find & delete all groups starting with "Pilot" inside ZoneTable

DownedPilot=SET_GROUP:New():FilterPrefixes("Pilot"):FilterActive(true):FilterZones(ZONE:New( "SISI CSAR" ), ZONE:New( "COD CSAR" )):FilterOnce()

local DownedPilotcount=DownedPilot:Count()
  for i = 1, DownedPilotcount do
    local grpObj = DownedPilot:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)
  end

end

 
--////Marianas Mission Options
  
  --MarianasCSARmission = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Spawn CSAR mission", MarianasOptions, function() SEF_CSARMISSION() end, nil)


env.info("Missions Complete", false)