env.info("BEGIN Tanker Adjustment")

function IncreaseAlt()
  if ( Group.getByName("Tanker_KC135_Texaco2 #IFF:(12)5011FR") ) then
    local Texaco = GROUP:FindByName("Tanker_KC135_Texaco2 #IFF:(12)5011FR")
    TexAlt = Texaco:GetAltitude()
    TexCord1 = COORDINATE:NewFromLLDD(latitude, longitude, (TexAlt+1000))
    TexCord2 = COORDINATE:NewFromLLDD(latitude, longitude, (TexAlt+1000))
    Texaco:TaskOrbit(Coord,(TexAlt+1000),205,CoordRaceTrack)
  end
end



env.info("END Tanker Adjustment")
