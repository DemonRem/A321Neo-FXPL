local last_poi_update = 0
local prev_range = 0

local function update_airports(data)
    local multi_airports = Data_manager.get_arpt_by_coords(adirs_get_lat(data.id), adirs_get_lon(data.id), data.config.range >= ND_RANGE_160)
    
    data.poi.arpt = {}
    
    for i,airports in ipairs(multi_airports) do
        for j,x in ipairs(airports) do
            table.insert(data.poi.arpt, {lat=x.lat, lon=x.lon, id=x.id})
        end
    end
end

local function update_vor(data)
    local multi_vors = Data_manager.get_nav_by_coords(NAV_ID_VOR, adirs_get_lat(data.id), adirs_get_lon(data.id), data.config.range >= ND_RANGE_160)

    data.poi.vor = {}
    
    for i,vors in ipairs(multi_vors) do
        for j,x in ipairs(vors) do
            table.insert(data.poi.vor, {lat=x.lat, lon=x.lon, id=x.id})
        end
    end
end

local function update_ndb(data)
    local multi_ndbs = Data_manager.get_nav_by_coords(NAV_ID_NDB, adirs_get_lat(data.id), adirs_get_lon(data.id), data.config.range >= ND_RANGE_160)

    data.poi.ndb = {}
    
    for i,ndbs in ipairs(multi_ndbs) do
        for j,x in ipairs(ndbs) do
            table.insert(data.poi.ndb, {lat=x.lat, lon=x.lon, id=x.id})
        end
    end
end

local function update_wpt(data)
    local multi_fixes = Data_manager.get_fix_by_coords(adirs_get_lat(data.id), adirs_get_lon(data.id), data.config.range >= ND_RANGE_160)

    data.poi.wpt = {}
    
    for i,fixes in ipairs(multi_fixes) do
        for j,x in ipairs(fixes) do
            table.insert(data.poi.wpt, {lat=x.lat, lon=x.lon, id=x.id})
        end
    end
end



function update_poi(data)

    if not adirs_is_position_ok(data.id) then
        return
    end

    --if prev_range == data.config.range and get(TIME) - last_poi_update < 10 then
    --    return
    --end

    prev_range = data.config.range

    last_poi_update = get(TIME)

    update_airports(data)
    update_vor(data)
    update_ndb(data)
    update_wpt(data)

end

