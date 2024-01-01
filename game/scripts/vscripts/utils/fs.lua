local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Promise = ____lualib.__TS__Promise
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 9,["15"] = 9,["16"] = 9,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 10,["23"] = 15,["24"] = 16,["25"] = 16,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 19,["31"] = 21,["32"] = 21,["33"] = 21,["34"] = 21,["36"] = 17,["37"] = 16,["38"] = 16,["39"] = 15,["40"] = 27,["41"] = 28,["42"] = 28,["43"] = 28,["44"] = 29,["45"] = 30,["46"] = 31,["48"] = 33,["50"] = 29,["51"] = 28,["52"] = 28,["53"] = 27,["54"] = 39,["55"] = 40,["56"] = 40,["57"] = 40,["58"] = 41,["59"] = 42,["60"] = 43,["61"] = 44,["62"] = 45,["64"] = 47,["66"] = 43,["67"] = 40,["68"] = 40,["69"] = 39,["70"] = 53,["71"] = 54,["72"] = 54,["73"] = 54,["74"] = 55,["75"] = 56,["76"] = 57,["78"] = 59,["80"] = 55,["81"] = 54,["82"] = 54,["83"] = 53});
local ____exports = {}
--- a custom fs to read/write files via http request
-- 
-- @example fs.read('./game/scripts/src/addon_game_mode.ts').then(content => {
--        print(content);
--    });
--    fs.write('./game/scripts/src/test.ts', 'to be or not to be, it is a problem\r\n');
____exports.fs = __TS__Class()
local fs = ____exports.fs
fs.name = "fs"
function fs.prototype.____constructor(self)
end
function fs.request(self, method, url)
    local request = CreateHTTPRequestScriptVM(method, "http://localhost:10384" .. url)
    return request
end
function fs.dir(self, path)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            ____exports.fs:request("GET", path):Send(function(result)
                if result.StatusCode ~= 200 then
                    reject(nil, result.Body)
                else
                    resolve(
                        nil,
                        JSON:decode(result.Body)
                    )
                end
            end)
        end
    )
end
function fs.read(self, path)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            ____exports.fs:request("GET", path):Send(function(result)
                if result.StatusCode ~= 200 then
                    reject(nil, result.Body)
                else
                    resolve(nil, result.Body)
                end
            end)
        end
    )
end
function fs.write(self, path, content)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            local request = ____exports.fs:request("PUT", path)
            request:SetHTTPRequestRawPostBody("application/json", content)
            request:Send(function(result)
                if result.StatusCode ~= 200 then
                    reject(nil, result.Body)
                else
                    resolve(nil)
                end
            end)
        end
    )
end
function fs.mkdir(self, path)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            ____exports.fs:request("POST", path):Send(function(result)
                if result.StatusCode ~= 200 then
                    reject(nil, result.Body)
                else
                    resolve(nil)
                end
            end)
        end
    )
end
return ____exports
