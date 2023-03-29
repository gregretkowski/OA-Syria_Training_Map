env.info("BLUE IADS Loading", false)

-----------------
-- BLUE IADS --
-----------------

function SEF_ReaddIADS ()
  env.info("Adding Respawns to IADS", false)
  blueIADS = SkynetIADS:create('BlueSAM')
  blueIADS:setUpdateInterval(15)
  blueIADS:addEarlyWarningRadarsByPrefix('blueEWR')
  blueIADS:addSAMSitesByPrefix('bSAM')
  blueIADS:getSAMSitesByNatoName('Patriot'):setActAsEW(true)
  blueIADS:getSAMSitesByNatoName('Patriot')
  blueIADS:getSAMSitesByNatoName('Hawk'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE)
  blueIADS:addRadioMenu()  
  blueIADS:activate()    
  env.info("Respawns integrated into IADS", false)
  timer.scheduleFunction(SEF_ReaddIADS, nil, timer.getTime() + 1800)  --1800
end
timer.scheduleFunction(SEF_ReaddIADS, nil, timer.getTime() + 45)

env.info("BLUE IADS Complete", false)
