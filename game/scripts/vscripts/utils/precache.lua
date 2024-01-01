local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 41,["8"] = 41,["9"] = 42,["10"] = 42,["11"] = 42,["12"] = 43,["13"] = 44,["14"] = 42,["15"] = 42,["17"] = 48,["18"] = 49,["19"] = 49,["20"] = 49,["21"] = 50,["22"] = 49,["23"] = 49,["25"] = 53,["26"] = 54,["27"] = 55,["28"] = 56,["29"] = 57,["30"] = 58,["31"] = 59,["34"] = 64,["35"] = 65,["36"] = 66,["37"] = 66,["38"] = 66,["39"] = 67,["40"] = 66,["41"] = 66,["43"] = 70,["44"] = 70,["45"] = 70,["46"] = 71,["47"] = 71,["48"] = 71,["49"] = 71,["50"] = 71,["51"] = 70,["52"] = 70,["55"] = 76,["56"] = 77,["57"] = 77,["58"] = 77,["59"] = 78,["60"] = 77,["61"] = 77,["63"] = 83,["64"] = 84,["65"] = 85,["66"] = 86,["67"] = 87,["68"] = 88,["72"] = 3,["73"] = 5,["74"] = 14,["75"] = 22,["76"] = 30,["77"] = 37});
local ____exports = {}
local precacheEveryResourceInKV, precacheResource, precacheResString, precacheUnits, precacheItems, precacheEverythingFromTable
function precacheEveryResourceInKV(kvFileList, context)
    __TS__ArrayForEach(
        kvFileList,
        function(____, file)
            local kvTable = LoadKeyValues(file)
            precacheEverythingFromTable(kvTable, context)
        end
    )
end
function precacheResource(resourceList, context)
    __TS__ArrayForEach(
        resourceList,
        function(____, resource)
            precacheResString(resource, context)
        end
    )
end
function precacheResString(res, context)
    if __TS__StringEndsWith(res, ".vpcf") then
        PrecacheResource("particle", res, context)
    elseif __TS__StringEndsWith(res, ".vsndevts") then
        PrecacheResource("soundfile", res, context)
    elseif __TS__StringEndsWith(res, ".vmdl") then
        PrecacheResource("model", res, context)
    end
end
function precacheUnits(unitNamesList, context)
    if context ~= nil then
        __TS__ArrayForEach(
            unitNamesList,
            function(____, unitName)
                PrecacheUnitByNameSync(unitName, context)
            end
        )
    else
        __TS__ArrayForEach(
            unitNamesList,
            function(____, unitName)
                PrecacheUnitByNameAsync(
                    unitName,
                    function()
                    end
                )
            end
        )
    end
end
function precacheItems(itemList, context)
    __TS__ArrayForEach(
        itemList,
        function(____, itemName)
            PrecacheItemByNameSync(itemName, context)
        end
    )
end
function precacheEverythingFromTable(kvTable, context)
    for k, v in pairs(kvTable) do
        if type(v) == "table" then
            precacheEverythingFromTable(v, context)
        elseif type(v) == "string" then
            precacheResString(v, context)
        end
    end
end
function ____exports.default(context)
    precacheResource({}, context)
    precacheEveryResourceInKV({}, context)
    precacheUnits({}, context)
    precacheItems({}, context)
    print("[Precache] Precache finished.")
end
return ____exports
