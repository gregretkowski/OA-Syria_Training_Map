--[[

v1.0 - Initial
v1.1 - Changed menus to be available to all players, not just pilots
   
--]]

env.info("Grendel Easy Menu SCRIPT BEGIN")

local function SetFlag(name)

   env.info("Flag [" .. name .. "] set to 1")
   USERFLAG:New(name):Set(1)

end

local function GetKeysInOrder(tbl)
  local function SortKeys(tbl)
    local keys = {}
    for key in pairs(tbl) do
      table.insert(keys, key)
    end
    table.sort(keys, function(a,b) return a < b end)

    return keys
  end

  local sortedKeys = SortKeys(tbl)
  local tblRet = {}
  for _, key in ipairs(sortedKeys) do
    table.insert(tblRet, key)
  end

  return tblRet
end

local function EnsureAncestorsAndSelfExist(path, tbl)

  local tokens = {}
  for token in string.gmatch(path, '[^/]+') do
    table.insert(tokens, token)
  end

  --['/B']   ={parentPath='/',  disp='B', flag='501'},
  --['/A/C'] ={parentPath='/A', disp='C', flag=nil  },
  local parent = nil
  local key = ''
  for i = 1, #tokens, 1 do
    parent = key    
    key = key..'/'..tokens[i]
    if (tbl[key] == nil) then
      tbl[key] = {parentPath=parent, disp=tokens[i], flag=nil}
    end
  end

  return key
end

local function BuildMenuHierarchy(str)

--[[
"
Top Menu 1=500,
Top Menu 2=204,
A/Menu 1=502,
A/Menu 2=503,
B/Menu 1=504,
A/C/Menu 1=505
"
--]]

  local ret = {}
  ret[''] = {parentPath=nil, disp=nil, flag=nil}
  
  for fullPath, flag in str:gmatch '([^=]+)=%s*(%d+)' do
    fullPath = string.gsub(fullPath, '^%s*(.-)%s*$', '%1') -- remove lead/trail spaces
    --print(fullPath)
    local self = EnsureAncestorsAndSelfExist(fullPath, ret)
    ret[self]['flag'] = flag
  end

  return ret
  
--[[
EXAMPLE OUTPUT...
  
  return
{
  ['']            ={parentPath=nil,    disp=nil,          flag=nil  },
  ['/A']          ={parentPath='',     disp='A',          flag=nil  },
  ['/B']          ={parentPath='',     disp='B',          flag=nil  },
  ['/Top Menu 1'] ={parentPath='',     disp='Top Menu 1', flag='500'},
  ['/Top Menu 2'] ={parentPath='',     disp='Top Menu 2', flag='501'},
  ['/A/C']        ={parentPath='/A',   disp='C',          flag=nil  },
  ['/A/Menu 1']   ={parentPath='/A',   disp='Menu 1',     flag='502'},
  ['/A/Menu 2']   ={parentPath='/A',   disp='Menu 2',     flag='503'},
  ['/A/C/Menu 1'] ={parentPath='/A/C', disp='Menu 1',     flag='505'},
  ['/B/Menu 1']   ={parentPath='/B',   disp='Menu 1',     flag='504'}
}
  --]]
end

local function DefineMenusFromHierarchy(hierarchy)

  local keys = GetKeysInOrder(hierarchy)

  for i = 1, #keys, 1 do
    --print('['..keys[i]..']')
    --print('Parent='..(tblHier[keys[i]]['parentPath'] or 'nil'))
    --print('Display='..(tblHier[keys[i]]['disp'] or 'nil'))
    --print('Flag='..(tblHier[keys[i]]['flag'] or 'nil'))
    
    local entry = hierarchy[keys[i]]
    if (entry['parentPath'] == nil) then
      entry['mnu'] = nil
    elseif (entry['flag'] == nil) then
      local parentEntry = hierarchy[entry['parentPath']]
      entry['mnu'] = MENU_MISSION:New(entry['disp'], parentEntry['mnu'])
      --entry['mnu'] = '<key='..keys[i]..'>'
      --print('MENU_GROUP:New(grp, '..entry['disp']..', '..(parentEntry['mnu'] or 'nil')..')')
    else
      local parentEntry = hierarchy[entry['parentPath']]
      entry['mnu'] = MENU_MISSION_COMMAND:New(entry['disp'], parentEntry['mnu'], SetFlag, entry['flag'])
      --entry['mnu'] = '<key='..keys[i]..'>'
      --print('MENU_GROUP_COMMAND:New(grp, '..entry['disp']..', '..(parentEntry['mnu'] or 'nil')..', SetFlag, '..entry['flag']..')')
    end
  end
end
    
--[[

xxxx1. what happens if more than 10 entries per level? (cutoff after 10)
2. what happens if command menu is also nested? (don't create command, consider it nested)
xxxx3. what happens if entry is duplicated?  (last one wins!)
xxxx4. need to check if case matters? (it does)
xxxx5. what if trailing/leading spaces?  does moose consider different entries?

--]]

local hierarchy = BuildMenuHierarchy(easyMenu)  
DefineMenusFromHierarchy(hierarchy)

env.info("Grendel Easy Menu SCRIPT END")