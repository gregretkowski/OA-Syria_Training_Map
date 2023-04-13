env.info("BEGIN Spawn Areas")

local tblAreas = {}

local function InitSpawns(prefixName)

   tblAreas[prefixName] = {spawns={}, groups={}}

   local setGrps = SET_GROUP:New():FilterPrefixes(prefixName):FilterOnce()
   env.info("InitSpawns: prefix="..prefixName..";num="..setGrps:Count())
   
   setGrps:ForEachGroup(
      function(templateGroup)
         
         env.info("SPAWN:New GrpName="..templateGroup:GetName())
         local spwn = SPAWN:New(templateGroup:GetName())
         table.insert(tblAreas[prefixName].spawns, spwn)
         
      end
   )

end

function SpawnArea(prefixName)

   if (tblAreas[prefixName] == nil) then
      InitSpawns(prefixName)
   end

   DespawnArea(prefixName)

   local area = tblAreas[prefixName]

   env.info("Spawning "..#area.spawns.." groups!")
   for i = 1, #area.spawns, 1 do
      local grp = area.spawns[i]:Spawn()
      table.insert(area.groups, grp)
      env.info("SPAWN:Spawn GrpName="..grp:GetName())
   end

end

function DespawnArea(prefixName)

   local area = tblAreas[prefixName]
   
   if (area == nil) then
      return
   end

   if (#area.groups == 0) then
      return
   end

   env.info("Despawning "..#area.groups.." groups!")
   for i = 1, #area.groups, 1 do
   
      area.groups[i]:Destroy()
   
   end
   
   tblAreas[prefixName].groups = {}

end

env.info("END Spawn Areas")