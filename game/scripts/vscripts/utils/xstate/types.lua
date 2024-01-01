local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 5,["7"] = 5,["8"] = 6,["9"] = 6,["10"] = 7,["11"] = 7});
local ____exports = {}
____exports.InterpreterStatus = InterpreterStatus or ({})
____exports.InterpreterStatus.NotStarted = 0
____exports.InterpreterStatus[____exports.InterpreterStatus.NotStarted] = "NotStarted"
____exports.InterpreterStatus.Running = 1
____exports.InterpreterStatus[____exports.InterpreterStatus.Running] = "Running"
____exports.InterpreterStatus.Stopped = 2
____exports.InterpreterStatus[____exports.InterpreterStatus.Stopped] = "Stopped"
____exports.StateMachine = {}
return ____exports
