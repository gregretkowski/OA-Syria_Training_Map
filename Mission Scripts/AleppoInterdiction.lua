dca = { }

dca.utils = {}

do 
    local PAYLOADS = {
        ["MiG-29S"] = {
            [1] = 
            {
                ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
            }, -- end of [1]
            [2] = 
            {
                ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
            }, -- end of [2]
            [3] = 
            {
                ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
            }, -- end of [3]
            [4] = 
            {
                ["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
            }, -- end of [4]
            [5] = 
            {
                ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
            }, -- end of [5]
            [6] = 
            {
                ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
            }, -- end of [6]
            [7] = 
            {
                ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
            }, -- end of [7]
        }, -- end of ["pylons"], -- end of ["pylons"],
        ["MiG-31"] = {
            [1] = 
            {
                ["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
            }, -- end of [1]
            [2] = 
            {
                ["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
            }, -- end of [2]
            [3] = 
            {
                ["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
            }, -- end of [3]
            [4] = 
            {
                ["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
            }, -- end of [4]
            [5] = 
            {
                ["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
            }, -- end of [5]
            [6] = 
            {
                ["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
            }, -- end of [6]
        },
        ["Su-27"] = {
            [1] = 
            {
                ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
            }, -- end of [1]
            [2] = 
            {
                ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
            }, -- end of [2]
            [3] = 
            {
                ["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
            }, -- end of [3]
            [4] = 
            {
                ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
            }, -- end of [4]
            [5] = 
            {
                ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
            }, -- end of [5]
            [6] = 
            {
                ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
            }, -- end of [6]
            [7] = 
            {
                ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
            }, -- end of [7]
            [8] = 
            {
                ["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
            }, -- end of [8]
            [9] = 
            {
                ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
            }, -- end of [9]
            [10] = 
            {
                ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
            }, -- end of [10]
        },
        ["MiG-21Bis"] = {
            [1] = 
            {
                ["CLSID"] = "{R-60 2L}",
            }, -- end of [1]
            [3] = 
            {
                ["CLSID"] = "{PTB_490C_MIG21}",
            }, -- end of [3]
            [6] = 
            {
                ["CLSID"] = "{ASO-2}",
            }, -- end of [6]
            [5] = 
            {
                ["CLSID"] = "{R-60 2R}",
            }, -- end of [5]
        },
        ["F-5E-3"] = {
            [1] = 
            {
                ["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
            }, -- end of [1]
            [3] = 
            {
                ["CLSID"] = "{PTB-150GAL}",
            }, -- end of [3]
            [4] = 
            {
                ["CLSID"] = "{PTB-150GAL}",
            }, -- end of [4]
            [5] = 
            {
                ["CLSID"] = "{PTB-150GAL}",
            }, -- end of [5]
            [7] = 
            {
                ["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
            }, -- end of [7]
        },
        ["JF-17"] = {
            [1] = 
            {
                ["CLSID"] = "DIS_PL-5EII",
            }, -- end of [1]
            [2] = 
            {
                ["CLSID"] = "DIS_SD-10_DUAL_L",
            }, -- end of [2]
            [3] = 
            {
                ["CLSID"] = "DIS_TANK1100",
            }, -- end of [3]
            [5] = 
            {
                ["CLSID"] = "DIS_TANK1100",
            }, -- end of [5]
            [6] = 
            {
                ["CLSID"] = "DIS_SD-10_DUAL_R",
            }, -- end of [6]
            [7] = 
            {
                ["CLSID"] = "DIS_PL-5EII",
            }, -- end of [7]
        },
        ["F-15C"] = {
            [1] = 
            {
                ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
            }, -- end of [1]
            [2] = 
            {
                ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
            }, -- end of [2]
            [3] = 
            {
                ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
            }, -- end of [3]
            [4] = 
            {
                ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
            }, -- end of [4]
            [5] = 
            {
                ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
            }, -- end of [5]
            [6] = 
            {
                ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
            }, -- end of [6]
            [7] = 
            {
                ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
            }, -- end of [7]
            [8] = 
            {
                ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
            }, -- end of [8]
            [9] = 
            {
                ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
            }, -- end of [9]
            [10] = 
            {
                ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
            }, -- end of [10]
            [11] = 
            {
                ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
            }, -- end of [11]
        },
        ["F-14B"] = {
            [1] = 
            {
                ["CLSID"] = "{LAU-138 wtip - AIM-9M}",
            }, -- end of [1]
            [2] = 
            {
                ["CLSID"] = "{SHOULDER AIM_54A_Mk60 L}",
            }, -- end of [2]
            [3] = 
            {
                ["CLSID"] = "{F14-300gal}",
            }, -- end of [3]
            [4] = 
            {
                ["CLSID"] = "{AIM_54A_Mk60}",
            }, -- end of [4]
            [5] = 
            {
                ["CLSID"] = "{AIM_54A_Mk60}",
            }, -- end of [5]
            [6] = 
            {
                ["CLSID"] = "{AIM_54A_Mk60}",
            }, -- end of [6]
            [7] = 
            {
                ["CLSID"] = "{AIM_54A_Mk60}",
            }, -- end of [7]
            [8] = 
            {
                ["CLSID"] = "{F14-300gal}",
            }, -- end of [8]
            [9] = 
            {
                ["CLSID"] = "{SHOULDER AIM_54A_Mk60 R}",
            }, -- end of [9]
            [10] = 
            {
                ["CLSID"] = "{LAU-138 wtip - AIM-9M}",
            }, -- end of [10]
        },
        ["J-11A"] = {
            [1] = 
            {
                ["CLSID"] = "{RKL609_L}",
            }, -- end of [1]
            [2] = 
            {
                ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
            }, -- end of [2]
            [3] = 
            {
                ["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
            }, -- end of [3]
            [4] = 
            {
                ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
            }, -- end of [4]
            [5] = 
            {
                ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
            }, -- end of [5]
            [6] = 
            {
                ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
            }, -- end of [6]
            [7] = 
            {
                ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
            }, -- end of [7]
            [8] = 
            {
                ["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
            }, -- end of [8]
            [9] = 
            {
                ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
            }, -- end of [9]
            [10] = 
            {
                ["CLSID"] = "{RKL609_R}",
            }, -- end of [10]
        }, 
        ["Mirage-F1CE"] = {
            [1] = 
            {
                ["CLSID"] = "{R550_Magic_1}",
            }, -- end of [1]
            [3] = 
            {
                ["CLSID"] = "{R530F_EM}",
            }, -- end of [3]
            [4] = 
            {
                ["CLSID"] = "PTB-1200-F1",
            }, -- end of [4]
            [5] = 
            {
                ["CLSID"] = "{R530F_EM}",
            }, -- end of [5]
            [7] = 
            {
                ["CLSID"] = "{R550_Magic_1}",
            }, -- end of [7]
        },
        ["M-2000C"] = {
            [1] = 
            {
                ["CLSID"] = "{MMagicII}",
            }, -- end of [1]
            [2] = 
            {
                ["CLSID"] = "{Matra_S530D}",
            }, -- end of [2]
            [5] = 
            {
                ["CLSID"] = "{M2KC_RPL_522}",
            }, -- end of [5]
            [9] = 
            {
                ["CLSID"] = "{MMagicII}",
            }, -- end of [9]
            [8] = 
            {
                ["CLSID"] = "{Matra_S530D}",
            }, -- end of [8]
        },
    }

    local id = 0

    local internalConfig = {}

    local configDefaults = {
        ["COALITION"] = coalition.side.BLUE,
        ["AGGRESSOR_TYPES"] = {
            "MiG-31",
            "JF-17",
            "F-15C",
            "MiG-29S",
            "Su-27",
            "F-14B",
            "J-11A",
            "MiG-21Bis", 
            "F-5E-3",
            "M-2000C",
            "Mirage-F1CE",
        },
        ["MAIN_MENU_NAME"] = "Red Flag DCA",
        ["ROUTES"] = {},
        ["POP_UP_ZONES"] = {},
    }

    local function log(tmpl, ...)
        local txt = string.format("[DCA] " .. tmpl, ...)

        if __DEV_ENV == true then
            trigger.action.outText(txt, 30)
        end

        env.info(txt)
    end

    local function debugTable(tbl)
        log(mist.utils.tableShow(tbl))
    end

    local function buildConfig()
        local cfg = mist.utils.deepCopy(configDefaults)
        
        if dca.config then
            for k,v in pairs(dca.config) do
                cfg[k] = v
            end
        end

        return cfg
    end

    local function spawnGroup(opts)
        id = id + 1
        local groupName = string.format("%s %s",  opts["type"], id)
        local payloads = opts.wvrLoadout and WVR_PAYLOADS or PAYLOADS
        local pylons = payloads[opts["type"]]

        if opts.gunsOnly == true then
            pylons = {}
        end

        if not pylons then
            pylons = {}
        end

        local unitTemplate = {  
            ["alt"] = opts.altitude,
            ["hardpoint_racks"] = true,
            ["alt_type"] = "BARO",
            ["livery_id"] = "",
            ["skill"] = "Veteran",
            ["speed"] = 220.97222222222,
            ["type"] = opts["type"],
            -- ["unitId"] = 235,
            ["psi"] = -2.4350102284861,
            -- ["name"] = opts["type"],
            ["y"] = opts.y,
            ["x"] = opts.x,
            ["payload"] = 
            {
                ["pylons"] = pylons,
                ["fuel"] = "10000",
                ["flare"] = 30,
                ["chaff"] = 30,
                ["gun"] = 100, 
            }, -- end of ["payload"]
            ["heading"] = 0,
            ["callsign"] = 101,
            ["onboard_num"] = "027",
        }

        local groupData = {
            ["modulation"] = 0,
            ["tasks"] = 
            {
            }, -- end of ["tasks"]
            ["radioSet"] = false,
            ["task"] = "CAP",
            ["uncontrolled"] = false,
            ["route"] = {
                ["points"] = 
                {
                    [1] = 
                    {
                        ["alt"] = opts.altitude,
                        ["action"] = "Turning Point",
                        ["alt_type"] = "BARO",
                        ["speed"] = 200,
                        ["task"] = 
                        {
                            ["id"] = "ComboTask",
                            ["params"] = 
                            {
                                ["tasks"] = 
                                {
                                    [1] = 
                                    {
                                        ["enabled"] = true,
                                        ["key"] = "CAP",
                                        ["id"] = "EngageTargets",
                                        ["number"] = 1,
                                        ["auto"] = true,
                                        ["params"] = 
                                        {
                                            ["targetTypes"] = 
                                            {
                                                [1] = "Air",
                                            }, -- end of ["targetTypes"]
                                            ["priority"] = 0,
                                        }, -- end of ["params"]
                                    }, -- end of [1]
                                    [2] = 
                                    {
                                        ["enabled"] = true,
                                        ["auto"] = true,
                                        ["id"] = "WrappedAction",
                                        ["number"] = 2,
                                        ["params"] = 
                                        {
                                            ["action"] = 
                                            {
                                                ["id"] = "Option",
                                                ["params"] = 
                                                {
                                                    -- PROHIBIT_AG                
                                                    ["value"] = true,
                                                    ["name"] = 17,
                                                }, -- end of ["params"]
                                            }, -- end of ["action"]
                                        }, -- end of ["params"]
                                    }, -- end of [2]
                                    [3] = 
                                    {
                                        ["enabled"] = true,
                                        ["auto"] = true,
                                        ["id"] = "WrappedAction",
                                        ["number"] = 3,
                                        ["params"] = 
                                        {
                                            ["action"] = 
                                            {
                                                ["id"] = "Option",
                                                ["params"] = 
                                                {
                                                    -- MISSILE_ATTACK             
                                                    ["value"] = 0,
                                                    ["name"] = 18,
                                                }, -- end of ["params"]
                                            }, -- end of ["action"]
                                        }, -- end of ["params"]
                                    }, -- end of [3]
                                    [4] = 
                                    {
                                        ["enabled"] = true,
                                        ["auto"] = true,
                                        ["id"] = "WrappedAction",
                                        ["number"] = 4,
                                        ["params"] = 
                                        {
                                            ["action"] = 
                                            {
                                                ["id"] = "Option",
                                                ["params"] = 
                                                {
                                                    -- PROHIBIT_WP_PASS_REPORT    
                                                    ["value"] = true,
                                                    ["name"] = 19,
                                                }, -- end of ["params"]
                                            }, -- end of ["action"]
                                        }, -- end of ["params"]
                                    }, -- end of [4]
                                    [5] = 
                                    {
                                        ["enabled"] = true,
                                        ["auto"] = true,
                                        ["id"] = "WrappedAction",
                                        ["number"] = 5,
                                        ["params"] = 
                                        {
                                            ["action"] = 
                                            {
                                                ["id"] = "Option",
                                                ["params"] = 
                                                {
                                                    ["targetTypes"] = 
                                                    {
                                                    }, -- end of ["targetTypes"]
                                                    ["name"] = 21,
                                                    ["value"] = "none;",
                                                    ["noTargetTypes"] = 
                                                    {
                                                        [1] = "Fighters",
                                                        [2] = "Multirole fighters",
                                                        [3] = "Bombers",
                                                        [4] = "Helicopters",
                                                        [5] = "UAVs",
                                                        [6] = "Infantry",
                                                        [7] = "Fortifications",
                                                        [8] = "Tanks",
                                                        [9] = "IFV",
                                                        [10] = "APC",
                                                        [11] = "Artillery",
                                                        [12] = "Unarmed vehicles",
                                                        [13] = "AAA",
                                                        [14] = "SR SAM",
                                                        [15] = "MR SAM",
                                                        [16] = "LR SAM",
                                                        [17] = "Aircraft Carriers",
                                                        [18] = "Cruisers",
                                                        [19] = "Destroyers",
                                                        [20] = "Frigates",
                                                        [21] = "Corvettes",
                                                        [22] = "Light armed ships",
                                                        [23] = "Unarmed ships",
                                                        [24] = "Submarines",
                                                        [25] = "Cruise missiles",
                                                        [26] = "Antiship Missiles",
                                                        [27] = "AA Missiles",
                                                        [28] = "AG Missiles",
                                                        [29] = "SA Missiles",
                                                    }, -- end of ["noTargetTypes"]
                                                }, -- end of ["params"]
                                            }, -- end of ["action"]
                                        }, -- end of ["params"]
                                    }, -- end of [5]
                                    [6] = 
                                    {
                                        ["enabled"] = true,
                                        ["auto"] = true,
                                        ["id"] = "WrappedAction",
                                        ["number"] = 6,
                                        ["params"] = 
                                        {
                                            ["action"] = 
                                            {
                                                ["id"] = "EPLRS",
                                                ["params"] = 
                                                {
                                                    ["value"] = true,
                                                    ["groupId"] = 1,
                                                }, -- end of ["params"]
                                            }, -- end of ["action"]
                                        }, -- end of ["params"]
                                    }, -- end of [6]
                                }, -- end of ["tasks"]
                            }, -- end of ["params"]
                        }, -- end of ["task"]
                        ["type"] = "Turning Point",
                        ["ETA"] = 0,
                        ["ETA_locked"] = true,
                        ["y"] = opts.y,
                        ["x"] = opts.x,
                        ["name"] = "start",
                        ["formation_template"] = "",
                        ["speed_locked"] = true,
                    }, -- end of [1]
                    [2] = 
                    {
                        ["alt"] = opts.altitude,
                        ["action"] = "Turning Point",
                        ["alt_type"] = "BARO",
                        ["speed"] = 200,
                        ["task"] = 
                        {
                            ["id"] = "ComboTask",
                            ["params"] = 
                            {
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                            }, -- end of ["params"]
                        }, -- end of ["task"]
                        
                        ["type"] = "Turning Point",
                        ["y"] = opts.dest.y,
                        ["x"] = opts.dest.x,
                        ["name"] = "end",
                        ["formation_template"] = "",
                        ["speed_locked"] = true,
                    }, -- end of [2]
                }, -- end of ["points"]
        },
            ["hidden"] = false,
            ["units"] = {}, -- end of ["units"]
            ["y"] = opts.x,
            ["x"] = opts.y,
            ["name"] = groupName,
            ["communication"] = true,
            ["start_time"] = 0,
            ["frequency"] = 124,
        }

        local units = {}
        for i = 1,opts.count do
            unitTemplate.name = string.format("%s %s", groupName, i)
            units[i] = unitTemplate
        end

        groupData["units"] = units

        coalition.addGroup(country.id.CJTF_RED, Group.Category.AIRPLANE, groupData)
    end

    local function randomPoint(zoneName)
        local zone = trigger.misc.getZone(zoneName)
        local newPoint = mist.getRandPointInCircle(zone.point, zone.radius)
        return newPoint
    end

    local function spawn(opts)
        local point
        if type(opts.zone) == "table" then
            point = randomPoint(opts.zone[math.random(#opts.zone)])
        else
            point = randomPoint(opts.zone)
        end
 
        opts.x = point.x
        opts.y = point.y
        if opts.type == nil then
            opts.type = opts.collection[math.random(#opts.collection)]  
        end
        if opts.altitude == nil then
            opts.altitude = 5000
        end
    
        if opts.dest ==  nil then
            local pos3 = coalition.getMainRefPoint(coalition.side.RED)
            opts.dest = {
                ["x"] = pos3.x,
                ["y"] = pos3.n,
            }
        end
        spawnGroup(opts)
    end

    local function despawnRedforAI()
        for i,v in ipairs(coalition.getGroups(coalition.side.RED, Group.Category.AIRPLANE)) do
            local firstUnit = v:getUnit(1)
            if firstUnit and firstUnit:getPlayerName() == nil then
                v:destroy()
            end
        end
    end

    local function routeFromGroup(groupName)
        local points = {}
        local route = mist.getGroupRoute(groupName, true)

        if not route then
            log("No group found for border route: %s", groupName)
            return points
        end

        for i,point in ipairs(route) do
            local p = {x=point.x, y=point.y}
            table.insert(points, p)
        end
        
        return points
    end

    function dca.init()
        internalConfig = buildConfig()

        local interceptors = internalConfig.AGGRESSOR_TYPES
        local subMenuFn
        local commandFn
        local rangeMenu = missionCommands.addSubMenu(internalConfig.MAIN_MENU_NAME)
  

        for name,zone in pairs(internalConfig.ROUTES) do
            local zoneMenu = missionCommands.addSubMenu(name, rangeMenu)

            local waypoints = routeFromGroup(zone)
            
            for i,opponent in ipairs(interceptors) do
                pickOpponent = missionCommands.addSubMenu(opponent, zoneMenu)
                for i,d in ipairs({ 1, 2, 4 }) do
                    local newOpts = mist.utils.deepCopy({})
                    newOpts.count = d;
                    newOpts.collection = { opponent }
                    newOpts.altitude = math.random(2000, 9144)
                    newOpts.zone = zone

                    if waypoints then
                        local dest = waypoints[#waypoints]
                        newOpts.dest = dest
                    end

                    missionCommands.addCommand(string.format("%s-Ship", d), pickOpponent, spawn, newOpts)
                end
            end
        end

        local emp = missionCommands.addSubMenu("DANGER", rangeMenu)

        missionCommands.addCommand("Clear REDFOR Jets", emp, despawnRedforAI)

        return rangeMenu
    end

    -- Init menus for Interdiction range 
    dca.config = {
        ["AGGRESSOR_TYPES"] = {
            "MiG-31",
            "MiG-29S",
            "Su-27",
            "J-11A",
            "MiG-21Bis",
            "F-5E-3",
            "Tu-22M3",
            "Tu-160",
            "Su-24M",
        },
        ["MAIN_MENU_NAME"] = "Aleppo Interdiction",
        ["ROUTES"] = {
            ["Spawn"] = "interdiction_range_spawn",
        },
    }
    
    
    local mainMenu = dca.init()

    -- SAM randomization section

    -- Turns off AI in a given zone
    local function toggleAiInZone(zone, enabled)
        local tbl = mist.makeUnitTable({'[red][vehicle]'})
        local units = mist.getUnitsInZones(tbl, { zone })
    
        for i,unit in ipairs(units) do
            local group = unit:getGroup()
    
            if group:getCoalition() == coalition.side.RED then
                group:getController():setOnOff(enabled)
            end
        end
    end

    -- Finds all zones with a prefix.
    -- Example: getZonesByTemplate("sam_hunt") will return all zones named "sam_hunt-1", "sam_hunt-2", etc.
    local function getZonesByTemplate(template)
        local zoneExists = true
        local i = 1
        local tbl = {}
    
        while zoneExists do
            local zoneName = string.format("%s-%s", template, i)
            local zone = trigger.misc.getZone(zoneName)
    
            if not zone then
                zoneExists = false
            else
                i = i + 1
                table.insert(tbl, zoneName)
            end
        end
    
        return tbl
    end

    -- Randomizes the location of groups within pre set zones.
    -- This is for hunting SAMs where the location is unknown and meant to be run once at miz start.
    -- This ensures that groups (SAMs) don't spawn in weird places, like on top of buildings, in trees, etc.
    local function randomizeGroupsInZones(containerZone, zones, limit)
        local occupiedZones = {}
        local groupLookup = {}
        local groups = {}
    
        local tbl = mist.makeUnitTable({'[red]'})
        local units = mist.getUnitsInZones(tbl, { containerZone })
        
        for i,unit in ipairs(units) do
            local group = unit:getGroup()
            local groupName = group:getName()
    
            if not groupLookup[groupName] then
                groupLookup[groupName] = true
                table.insert(groups, group)
            end
        end
    
    
        local count = 0
        local limitReached = false
        local allocatedGroups = {}
        local allocatedZones = {}
    
        if not limit then
            -- This prevents an infinite loop if there are more groups than zones
            if #groups > #zones then
                limit = #zones
            else
                limit = #groups
            end
        end
    
        if #groups < limit then
            limit = #groups
        end
    
        while count < limit do 
            local groupIndex = math.random(1, #groups)
            local zoneIndex = math.random(1, #zones)
    
            local targetZone = zones[zoneIndex]
            local targetGroup = groups[groupIndex]
            local groupName = targetGroup:getName()
    
            if not allocatedGroups[groupName] and not allocatedZones[targetZone] then
                local vars = {} 
                vars.gpName = groupName
                vars.action = 'teleport' 
                vars.point =  trigger.misc.getZone(targetZone).point
                mist.teleportToPoint(vars)
        
                allocatedGroups[groupName] = true
                allocatedZones[targetZone] = true
    
                count = count + 1
            end
        end
    
        for i,group in ipairs(groups) do
            if not allocatedGroups[group:getName()] then
                group:getController():setOnOff(false)
            end
        end
    end    

    -- SAM location randomization init
    local containerZone = "interdiction_sam_spawn"
    local zones = getZonesByTemplate("sam_hunt")

    debugTable(mainMenu)

    toggleAiInZone(containerZone, false)

    local subMenu = missionCommands.addSubMenu("Enable SAMs", mainMenu)

    -- Ensure we only activate once. 
    -- If we activate twice, we will get stuck in our "while" loop.
    local activatedOnce = false

    missionCommands.addCommand("Activate SAM sites", subMenu, 
        function()
            if activatedOnce == true then
                trigger.action.outText("SAM sites already activated", 30)
                return
            end
            activatedOnce = true
            randomizeGroupsInZones(containerZone, zones, 5)
            trigger.action.outText("SAM sites activated", 30)
            missionCommands.removeCommand(subMenu)
        end
    )
    
    missionCommands.addCommand("Disable", subMenu, 
        function()
            for i,z in ipairs(zones) do
                toggleAiInZone(z, false)
            end
            trigger.action.outText("Interdiction SAMs disabled", 30)
        end
    )
end