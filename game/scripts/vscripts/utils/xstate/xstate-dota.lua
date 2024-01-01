local ____lualib = require("lualib_bundle")
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local Set = ____lualib.Set
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["19"] = 2,["20"] = 6,["21"] = 14,["22"] = 16,["23"] = 17,["24"] = 19,["25"] = 20,["26"] = 20,["27"] = 20,["29"] = 20,["31"] = 20,["32"] = 19,["33"] = 23,["34"] = 26,["35"] = 23,["36"] = 32,["37"] = 37,["38"] = 37,["39"] = 37,["41"] = 37,["43"] = 37,["44"] = 38,["45"] = 38,["46"] = 39,["48"] = 42,["49"] = 42,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 43,["55"] = 47,["57"] = 42,["59"] = 38,["60"] = 32,["61"] = 50,["62"] = 52,["63"] = 53,["64"] = 52,["65"] = 56,["66"] = 57,["67"] = 57,["68"] = 57,["70"] = 57,["72"] = 57,["73"] = 56,["74"] = 60,["75"] = 64,["76"] = 64,["77"] = 64,["78"] = 64,["79"] = 64,["80"] = 64,["81"] = 64,["82"] = 60,["83"] = 73,["84"] = 78,["85"] = 79,["86"] = 81,["87"] = 81,["88"] = 81,["89"] = 82,["90"] = 83,["91"] = 84,["92"] = 86,["93"] = 87,["95"] = 89,["96"] = 89,["97"] = 89,["98"] = 90,["99"] = 90,["100"] = 91,["101"] = 91,["102"] = 91,["103"] = 91,["105"] = 91,["107"] = 90,["108"] = 89,["109"] = 89,["111"] = 95,["112"] = 96,["114"] = 98,["115"] = 81,["116"] = 81,["117"] = 101,["118"] = 73,["119"] = 104,["120"] = 110,["121"] = 110,["123"] = 114,["124"] = 115,["125"] = 115,["126"] = 115,["127"] = 116,["129"] = 117,["133"] = 115,["134"] = 115,["136"] = 123,["137"] = 123,["138"] = 124,["139"] = 124,["140"] = 124,["141"] = 123,["142"] = 123,["143"] = 123,["144"] = 123,["145"] = 129,["146"] = 129,["147"] = 129,["148"] = 129,["149"] = 132,["150"] = 132,["151"] = 132,["152"] = 132,["153"] = 132,["154"] = 129,["155"] = 138,["156"] = 142,["157"] = 142,["158"] = 142,["160"] = 142,["162"] = 142,["163"] = 142,["164"] = 143,["165"] = 144,["166"] = 146,["167"] = 147,["168"] = 147,["169"] = 147,["170"] = 147,["171"] = 147,["174"] = 147,["178"] = 150,["179"] = 151,["180"] = 153,["181"] = 154,["182"] = 155,["184"] = 158,["185"] = 158,["186"] = 158,["188"] = 158,["190"] = 158,["191"] = 158,["192"] = 158,["193"] = 158,["195"] = 158,["196"] = 158,["197"] = 158,["199"] = 160,["200"] = 162,["201"] = 162,["202"] = 162,["204"] = 162,["205"] = 163,["206"] = 165,["207"] = 166,["208"] = 166,["209"] = 166,["210"] = 166,["213"] = 166,["217"] = 169,["218"] = 171,["219"] = 171,["220"] = 171,["222"] = 171,["223"] = 171,["224"] = 171,["225"] = 171,["227"] = 170,["228"] = 170,["229"] = 170,["230"] = 170,["231"] = 174,["232"] = 176,["233"] = 176,["234"] = 176,["236"] = 176,["237"] = 178,["238"] = 178,["239"] = 178,["240"] = 178,["241"] = 178,["242"] = 178,["243"] = 178,["247"] = 190,["248"] = 129,["249"] = 129,["250"] = 193,["251"] = 104,["252"] = 196,["253"] = 204,["254"] = 204,["255"] = 204,["256"] = 204,["257"] = 204,["258"] = 205,["259"] = 207,["260"] = 207,["261"] = 207,["262"] = 207,["263"] = 207,["264"] = 207,["265"] = 207,["267"] = 204,["268"] = 204,["269"] = 196,["270"] = 211,["271"] = 216,["272"] = 217,["273"] = 218,["274"] = 220,["275"] = 220,["276"] = 220,["277"] = 222,["278"] = 223,["281"] = 226,["282"] = 227,["283"] = 227,["284"] = 227,["285"] = 227,["286"] = 227,["287"] = 228,["288"] = 220,["289"] = 230,["290"] = 231,["291"] = 232,["292"] = 234,["293"] = 220,["294"] = 238,["295"] = 239,["296"] = 240,["297"] = 240,["298"] = 240,["300"] = 240,["302"] = 240,["303"] = 241,["304"] = 241,["305"] = 241,["306"] = 241,["307"] = 241,["308"] = 241,["309"] = 248,["310"] = 249,["311"] = 250,["312"] = 251,["313"] = 252,["314"] = 252,["315"] = 252,["317"] = 252,["320"] = 250,["326"] = 258,["328"] = 260,["329"] = 261,["330"] = 262,["331"] = 220,["332"] = 264,["333"] = 265,["334"] = 266,["335"] = 267,["336"] = 220,["337"] = 269,["338"] = 270,["339"] = 220,["340"] = 272,["341"] = 273,["342"] = 220,["343"] = 220,["344"] = 277,["345"] = 211});
local ____exports = {}
local ____types = require("utils.xstate.types")
local InterpreterStatus = ____types.InterpreterStatus
____exports.InterpreterStatus = InterpreterStatus
local INIT_EVENT = {type = "xstate.init"}
local ASSIGN_ACTION = "xstate.assign"
local function toArray(self, item)
    local ____temp_0
    if item == nil then
        ____temp_0 = {}
    else
        ____temp_0 = __TS__ArrayConcat({}, item)
    end
    return ____temp_0
end
function ____exports.assign(self, assignment)
    return {type = ASSIGN_ACTION, assignment = assignment}
end
local function toActionObject(self, action, actionMap)
    local ____temp_1
    if type(action) == "string" and actionMap and actionMap[action] then
        ____temp_1 = actionMap[action]
    else
        ____temp_1 = action
    end
    action = ____temp_1
    local ____temp_3
    if type(action) == "string" then
        ____temp_3 = {type = action}
    else
        local ____temp_2
        if type(action) == "function" then
            ____temp_2 = {
                type = tostring(action),
                exec = action
            }
        else
            ____temp_2 = action
        end
        ____temp_3 = ____temp_2
    end
    return ____temp_3
end
local IS_PRODUCTION = not IsInToolsMode()
local function createMatcher(self, value)
    return function(____, stateValue) return value == stateValue end
end
local function toEventObject(self, event)
    local ____temp_4
    if type(event) == "string" then
        ____temp_4 = {type = event}
    else
        ____temp_4 = event
    end
    return ____temp_4
end
local function createUnchangedState(self, value, context)
    return {
        value = value,
        context = context,
        actions = {},
        changed = false,
        matches = createMatcher(nil, value)
    }
end
local function handleActions(self, actions, context, eventObject)
    local nextContext = context
    local assigned = false
    local nonAssignActions = __TS__ArrayFilter(
        actions,
        function(____, action)
            if action.type == ASSIGN_ACTION then
                assigned = true
                local tmpContext = __TS__ObjectAssign({}, nextContext)
                if type(action.assignment) == "function" then
                    tmpContext = action:assignment(nextContext, eventObject)
                else
                    __TS__ArrayForEach(
                        __TS__ObjectKeys(action.assignment),
                        function(____, key)
                            local ____tmpContext_7 = tmpContext
                            local ____key_8 = key
                            local ____temp_6
                            if type(action.assignment[key]) == "function" then
                                local ____self_5 = action.assignment
                                ____temp_6 = ____self_5[key](____self_5, nextContext, eventObject)
                            else
                                ____temp_6 = action.assignment[key]
                            end
                            ____tmpContext_7[____key_8] = ____temp_6
                        end
                    )
                end
                nextContext = tmpContext
                return false
            end
            return true
        end
    )
    return {nonAssignActions, nextContext, assigned}
end
function ____exports.createMachine(self, fsmConfig, implementations)
    if implementations == nil then
        implementations = {}
    end
    if not IS_PRODUCTION then
        __TS__ArrayForEach(
            __TS__ObjectKeys(fsmConfig.states),
            function(____, state)
                if fsmConfig.states[state].states then
                    error(
                        __TS__New(Error, ("Nested finite states not supported.\n              Please check the configuration for the \"" .. state) .. "\" state."),
                        0
                    )
                end
            end
        )
    end
    local initialActions, initialContext = unpack(handleActions(
        nil,
        __TS__ArrayMap(
            toArray(nil, fsmConfig.states[fsmConfig.initial].entry),
            function(____, action) return toActionObject(nil, action, implementations.actions) end
        ),
        fsmConfig.context,
        INIT_EVENT
    ))
    local machine
    machine = {
        config = fsmConfig,
        _options = implementations,
        initialState = {
            value = fsmConfig.initial,
            actions = initialActions,
            context = initialContext,
            matches = createMatcher(nil, fsmConfig.initial)
        },
        transition = function(____, state, event)
            local ____temp_9
            if type(state) == "string" then
                ____temp_9 = {value = state, context = fsmConfig.context}
            else
                ____temp_9 = state
            end
            local value = ____temp_9.value
            local context = ____temp_9.context
            local eventObject = toEventObject(nil, event)
            local stateConfig = fsmConfig.states[value]
            if not IS_PRODUCTION and not stateConfig then
                local ____Error_12 = Error
                local ____value_11 = value
                local ____fsmConfig_id_10 = fsmConfig.id
                if ____fsmConfig_id_10 == nil then
                    ____fsmConfig_id_10 = ""
                end
                error(
                    __TS__New(____Error_12, (("State '" .. ____value_11) .. "' not found on machine ") .. ____fsmConfig_id_10),
                    0
                )
            end
            if stateConfig.on then
                local transitions = toArray(nil, stateConfig.on[eventObject.type])
                for ____, transition in ipairs(transitions) do
                    if transition == nil then
                        return createUnchangedState(nil, value, context)
                    end
                    local ____temp_13
                    if type(transition) == "string" then
                        ____temp_13 = {target = transition}
                    else
                        ____temp_13 = transition
                    end
                    local target = ____temp_13.target
                    local actions = ____temp_13.actions
                    if actions == nil then
                        actions = {}
                    end
                    local cond = ____temp_13.cond
                    if cond == nil then
                        cond = function() return true end
                    end
                    local isTargetless = target == nil
                    local ____target_14 = target
                    if ____target_14 == nil then
                        ____target_14 = value
                    end
                    local nextStateValue = ____target_14
                    local nextStateConfig = fsmConfig.states[nextStateValue]
                    if not IS_PRODUCTION and not nextStateConfig then
                        local ____Error_16 = Error
                        local ____fsmConfig_id_15 = fsmConfig.id
                        if ____fsmConfig_id_15 == nil then
                            ____fsmConfig_id_15 = ""
                        end
                        error(
                            __TS__New(____Error_16, (("State '" .. nextStateValue) .. "' not found on machine ") .. ____fsmConfig_id_15),
                            0
                        )
                    end
                    if cond(nil, context, eventObject) then
                        local ____isTargetless_17
                        if isTargetless then
                            ____isTargetless_17 = toArray(nil, actions)
                        else
                            ____isTargetless_17 = __TS__ArrayFilter(
                                __TS__ArrayConcat({}, stateConfig.exit, actions, nextStateConfig.entry),
                                function(____, a) return a end
                            )
                        end
                        local allActions = __TS__ArrayMap(
                            ____isTargetless_17,
                            function(____, action) return toActionObject(nil, action, machine._options.actions) end
                        )
                        local nonAssignActions, nextContext, assigned = unpack(handleActions(nil, allActions, context, eventObject))
                        local ____target_18 = target
                        if ____target_18 == nil then
                            ____target_18 = value
                        end
                        local resolvedTarget = ____target_18
                        return {
                            value = resolvedTarget,
                            context = nextContext,
                            actions = nonAssignActions,
                            changed = target ~= value or #nonAssignActions > 0 or assigned,
                            matches = createMatcher(nil, resolvedTarget)
                        }
                    end
                end
            end
            return createUnchangedState(nil, value, context)
        end
    }
    return machine
end
local function executeStateActions(____, state, event)
    return __TS__ArrayForEach(
        state.actions,
        function(____, ____bindingPattern0)
            local exec
            exec = ____bindingPattern0.exec
            if exec then
                xpcall(
                    exec,
                    debug.traceback,
                    nil,
                    state.context,
                    event
                )
            end
        end
    )
end
function ____exports.interpret(self, machine)
    local state = machine.initialState
    local status = InterpreterStatus.NotStarted
    local listeners = __TS__New(Set)
    local service
    service = {
        _machine = machine,
        send = function(____, event)
            if status ~= InterpreterStatus.Running then
                return
            end
            state = machine:transition(state, event)
            executeStateActions(
                nil,
                state,
                toEventObject(nil, event)
            )
            listeners:forEach(function(____, listener) return listener(nil, state) end)
        end,
        subscribe = function(____, listener)
            listeners:add(listener)
            listener(nil, state)
            return {unsubscribe = function() return listeners:delete(listener) end}
        end,
        start = function(____, initialState)
            if initialState then
                local ____temp_19
                if type(initialState) == "table" then
                    ____temp_19 = initialState
                else
                    ____temp_19 = {context = machine.config.context, value = initialState}
                end
                local resolved = ____temp_19
                state = {
                    value = resolved.value,
                    actions = {},
                    context = resolved.context,
                    matches = createMatcher(nil, resolved.value)
                }
                if not IS_PRODUCTION then
                    if not (machine.config.states[state.value] ~= nil) then
                        local ____Error_22 = Error
                        local ____state_value_21 = state.value
                        local ____machine_config_id_20
                        if machine.config.id then
                            ____machine_config_id_20 = (" '" .. machine.config.id) .. "'"
                        else
                            ____machine_config_id_20 = ""
                        end
                        error(
                            __TS__New(____Error_22, ((("Cannot start service in state '" .. ____state_value_21) .. "'. The state is not found on machine") .. ____machine_config_id_20) .. "."),
                            0
                        )
                    end
                end
            else
                state = machine.initialState
            end
            status = InterpreterStatus.Running
            executeStateActions(nil, state, INIT_EVENT)
            return service
        end,
        stop = function()
            status = InterpreterStatus.Stopped
            listeners:clear()
            return service
        end,
        getState = function(self)
            return state
        end,
        getStatus = function(self)
            return status
        end
    }
    return service
end
return ____exports
