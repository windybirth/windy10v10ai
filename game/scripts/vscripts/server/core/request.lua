local ____lualib = require("lualib_bundle")
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Promise = ____lualib.__TS__Promise
local __TS__New = ____lualib.__TS__New
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["18"] = 5,["19"] = 5,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 18,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 19,["33"] = 18,["34"] = 22,["35"] = 22,["36"] = 23,["37"] = 24,["38"] = 25,["39"] = 25,["40"] = 25,["41"] = 26,["42"] = 25,["43"] = 25,["44"] = 28,["45"] = 29,["46"] = 29,["47"] = 29,["48"] = 29,["49"] = 29,["50"] = 29,["51"] = 29,["52"] = 30,["53"] = 30,["54"] = 30,["55"] = 30,["56"] = 30,["57"] = 29,["58"] = 29,["60"] = 33,["63"] = 22,["64"] = 38,["65"] = 38,["66"] = 38,["67"] = 38,["68"] = 38,["69"] = 38,["70"] = 38,["71"] = 39,["72"] = 38,["73"] = 38,["74"] = 42,["75"] = 43,["77"] = 46,["78"] = 15,["79"] = 49,["80"] = 50,["81"] = 53,["82"] = 54,["83"] = 55,["85"] = 57,["86"] = 49,["87"] = 60,["88"] = 61,["89"] = 61,["90"] = 61,["91"] = 66,["92"] = 66,["93"] = 66,["94"] = 66,["95"] = 66,["96"] = 61,["97"] = 61,["98"] = 67,["99"] = 67,["100"] = 67,["101"] = 67,["102"] = 67,["103"] = 67,["104"] = 67,["105"] = 67,["106"] = 67,["107"] = 67,["108"] = 61,["109"] = 61,["110"] = 61,["111"] = 72,["112"] = 73,["113"] = 74,["114"] = 75,["115"] = 76,["118"] = 80,["119"] = 60,["120"] = 83,["121"] = 84,["122"] = 85,["123"] = 85,["124"] = 85,["126"] = 85,["127"] = 86,["128"] = 87,["129"] = 88,["131"] = 90,["134"] = 93,["135"] = 83,["136"] = 96,["137"] = 97,["138"] = 97,["139"] = 97,["140"] = 97,["141"] = 97,["142"] = 97,["143"] = 97,["144"] = 97,["145"] = 97,["146"] = 107,["147"] = 108,["148"] = 109,["150"] = 112,["152"] = 96,["153"] = 117,["155"] = 126,["156"] = 131,["157"] = 131,["158"] = 131,["159"] = 132,["161"] = 136,["162"] = 137,["163"] = 137,["164"] = 137,["165"] = 137,["166"] = 137,["168"] = 137,["169"] = 138,["171"] = 141,["172"] = 141,["173"] = 141,["174"] = 141,["175"] = 141,["176"] = 141,["178"] = 141,["180"] = 142,["181"] = 143,["182"] = 144,["183"] = 145,["184"] = 145,["185"] = 145,["186"] = 146,["187"] = 147,["188"] = 146,["189"] = 145,["190"] = 145,["191"] = 144,["194"] = 151,["197"] = 117,["204"] = 161,["205"] = 162,["206"] = 162,["207"] = 162,["210"] = 164,["211"] = 165,["212"] = 166,["213"] = 168,["214"] = 169,["215"] = 169,["216"] = 169,["217"] = 169,["218"] = 169,["219"] = 169,["220"] = 169,["221"] = 169,["222"] = 169,["223"] = 169,["224"] = 171,["225"] = 174,["227"] = 176,["228"] = 177,["229"] = 179,["230"] = 179,["231"] = 179,["232"] = 179,["234"] = 179,["235"] = 179,["236"] = 179,["238"] = 179,["240"] = 181,["241"] = 181,["245"] = 175,["248"] = 184,["250"] = 175,["253"] = 163,["256"] = 188,["258"] = 163,["260"] = 162,["261"] = 162,["262"] = 161});
local ____exports = {}
local ____OpenAPI = require("server.core.OpenAPI")
local NoSignatureURLs = ____OpenAPI.NoSignatureURLs
local function isDefined(____, value)
    return value ~= nil and value ~= nil
end
local function isString(____, value)
    return type(value) == "string"
end
local function getQueryString(____, params)
    local qs = {}
    local function append(____, key, value)
        qs[#qs + 1] = (encodeURIComponent(nil, key) .. "=") .. encodeURIComponent(
            nil,
            tostring(value)
        )
    end
    local process
    process = function(____, key, value)
        if isDefined(nil, value) then
            if __TS__ArrayIsArray(value) then
                __TS__ArrayForEach(
                    value,
                    function(____, v)
                        process(nil, key, v)
                    end
                )
            elseif type(value) == "table" then
                __TS__ArrayForEach(
                    __TS__ObjectEntries(value),
                    function(____, ____bindingPattern0)
                        local v
                        local k
                        k = ____bindingPattern0[1]
                        v = ____bindingPattern0[2]
                        process(
                            nil,
                            ((key .. "[") .. tostring(k)) .. "]",
                            v
                        )
                    end
                )
            else
                append(nil, key, value)
            end
        end
    end
    __TS__ArrayForEach(
        __TS__ObjectEntries(params),
        function(____, ____bindingPattern0)
            local value
            local key
            key = ____bindingPattern0[1]
            value = ____bindingPattern0[2]
            process(nil, key, value)
        end
    )
    if #qs > 0 then
        return "?" .. table.concat(qs, "&")
    end
    return ""
end
local function getUrl(____, config, options)
    local path = __TS__StringReplace(options.url, "{api-version}", config.VERSION)
    local url = config.BASE .. path
    if options.query then
        return url .. getQueryString(nil, options.query)
    end
    return url
end
local function getHeaders(____, config, options)
    local headers = __TS__ArrayReduce(
        __TS__ArrayFilter(
            __TS__ObjectEntries(__TS__ObjectAssign({Accept = "application/json"}, config.HEADERS, options.headers)),
            function(____, ____bindingPattern0)
                local value
                local _ = ____bindingPattern0[1]
                value = ____bindingPattern0[2]
                return isDefined(nil, value)
            end
        ),
        function(____, headers, ____bindingPattern0)
            local value
            local key
            key = ____bindingPattern0[1]
            value = ____bindingPattern0[2]
            return __TS__ObjectAssign(
                {},
                headers,
                {[key] = tostring(value)}
            )
        end,
        {}
    )
    if options.body then
        if options.mediaType then
            headers["Content-Type"] = options.mediaType
        elseif isString(nil, options.body) then
            headers["Content-Type"] = "text/plain"
        end
    end
    return headers
end
local function getRequestBody(____, options)
    if options.body then
        local ____options_mediaType_includes_result_0 = options.mediaType
        if ____options_mediaType_includes_result_0 ~= nil then
            ____options_mediaType_includes_result_0 = __TS__StringIncludes(options.mediaType, "/json")
        end
        if ____options_mediaType_includes_result_0 then
            return json.encode(options.body)
        elseif isString(nil, options.body) then
            return options.body
        else
            return json.encode(options.body)
        end
    end
    return nil
end
local function throwError(____, result)
    local errors = {
        [400] = "Bad Request",
        [401] = "Unauthorized",
        [403] = "Forbidden",
        [404] = "Not Found",
        [500] = "Internal Server Error",
        [502] = "Bad Gateway",
        [503] = "Service Unavailable"
    }
    local __error = errors[result.StatusCode]
    if __error then
        error(__error)
    end
    if result.StatusCode ~= 200 then
    end
end
____exports.sendRequest = function(____, config, options, url, body, headers, sign, authKey)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local request = CreateHTTPRequestScriptVM(options.method, url)
        for ____, ____value in ipairs(__TS__ObjectEntries(headers)) do
            local k = ____value[1]
            local v = ____value[2]
            request:SetHTTPRequestHeaderValue(k, v)
        end
        if sign then
            local ____SHA_sha3_512_4 = SHA.sha3_512
            local ____authKey_3 = authKey
            local ____body_2 = body
            if ____body_2 == nil then
                ____body_2 = "{}"
            end
            local signature = ____SHA_sha3_512_4(____authKey_3 .. tostring(____body_2))
            request:SetHTTPRequestHeaderValue("dota-signature", signature)
        end
        if body ~= nil then
            local ____request_6 = request
            local ____request_SetHTTPRequestRawPostBody_7 = request.SetHTTPRequestRawPostBody
            local ____options_mediaType_5 = options.mediaType
            if ____options_mediaType_5 == nil then
                ____options_mediaType_5 = "application/json"
            end
            ____request_SetHTTPRequestRawPostBody_7(____request_6, ____options_mediaType_5, body)
        end
        request:SetHTTPRequestAbsoluteTimeoutMS(config.ABSOLUTE_TIMEOUT)
        request:SetHTTPRequestNetworkActivityTimeout(config.NETWORK_ACTIVITY_TIMEOUT)
        local function send()
            return __TS__New(
                __TS__Promise,
                function(____, resolve, reject)
                    request:Send(function(result)
                        resolve(nil, result)
                    end)
                end
            )
        end
        return ____awaiter_resolve(
            nil,
            __TS__Await(send(nil))
        )
    end)
end
--- Request method
-- 
-- @param config The OpenAPI configuration object
-- @param options The request options from the service
-- @returns CancelablePromise<T>
-- @throws ApiError
____exports.request = function(____, config, options)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                local ____try = __TS__AsyncAwaiter(function()
                    local url = getUrl(nil, config, options)
                    local body = getRequestBody(nil, options)
                    local headers = getHeaders(nil, config, options)
                    local should_sign = not __TS__ArrayIncludes(NoSignatureURLs, options.url)
                    local response = __TS__Await(____exports.sendRequest(
                        nil,
                        config,
                        options,
                        url,
                        body,
                        headers,
                        should_sign,
                        config.AUTHKEY
                    ))
                    throwError(nil, response)
                    if response.Body then
                        local ____try = __TS__AsyncAwaiter(function()
                            local data = JSON:decode(response.Body)
                            if data and data.state == "ERROR" then
                                local ____reject_10 = reject
                                local ____data_errorCode_8 = data.errorCode
                                if ____data_errorCode_8 == nil then
                                    ____data_errorCode_8 = "UNKNOWN ERROR CODE"
                                end
                                local ____data_errorMessage_9 = data.errorMessage
                                if ____data_errorMessage_9 == nil then
                                    ____data_errorMessage_9 = "No Message"
                                end
                                ____reject_10(nil, {errorCode = ____data_errorCode_8, errorMessage = ____data_errorMessage_9})
                            else
                                if data ~= nil then
                                    resolve(nil, data)
                                end
                            end
                        end)
                        __TS__Await(____try.catch(
                            ____try,
                            function(____, e)
                                reject(nil, e)
                            end
                        ))
                    end
                end)
                __TS__Await(____try.catch(
                    ____try,
                    function(____, e)
                        reject(nil, e)
                    end
                ))
            end)
        end
    )
end
return ____exports
