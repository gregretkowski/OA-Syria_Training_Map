env.info("RED IADS Loading", false)

-----------------
-- REDFOR IADS --
-----------------

function SEF_ReaddIADS ()
  redIADS = SkynetIADS:create('SYRIA')
  redIADS:setUpdateInterval(15)
  redIADS:addEarlyWarningRadarsByPrefix('rEWR')
  redIADS:addSAMSitesByPrefix('rSAM')
  redIADS:addSAMSitesByPrefix('kbSAM')
  redIADS:getSAMSitesByNatoName('SA-2'):setGoLiveRangeInPercent(80)
  redIADS:getSAMSitesByNatoName('SA-3'):setGoLiveRangeInPercent(80)
  redIADS:getSAMSitesByNatoName('SA-5'):setGoLiveRangeInPercent(80)
  redIADS:getSAMSitesByNatoName('SA-6'):setGoLiveRangeInPercent(80)
  redIADS:getSAMSitesByNatoName('SA-8'):setGoLiveRangeInPercent(80)
  redIADS:getSAMSitesByNatoName('SA-10'):setGoLiveRangeInPercent(80):setActAsEW(true)
  redIADS:getSAMSitesByNatoName('SA-11'):setGoLiveRangeInPercent(80)
  redIADS:getSAMSitesByNatoName('SA-13'):setGoLiveRangeInPercent(80)
  redIADS:getSAMSitesByNatoName('SA-15'):setGoLiveRangeInPercent(100)
  --local sa151 = redIADS:getSAMSiteByGroupName('SAM-SA15-1')
  --redIADS:getSAMSiteByGroupName('SAM-SA10-1'):addPointDefence(sa151)
  --local sa152 = redIADS:getSAMSiteByGroupName('SAM-SA15-2')
  --redIADS:getSAMSiteByGroupName('SAM-SA10-2'):addPointDefence(sa152)
  redIADS:addRadioMenu()  
  redIADS:activate()
  timer.scheduleFunction(SEF_ReaddIADS, nil, timer.getTime() + 1800)  --1800
end    
timer.scheduleFunction(SEF_ReaddIADS, nil, timer.getTime() + 45)

env.info("RED IADS Complete", false)

