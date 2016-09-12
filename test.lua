local event = require "event"

local ev = event:new()
local callbacks = {}

function callbacks.on_event1(_, ...)
	print("on event1: " .. ...)
end

function callbacks.on_event2(_, ...)
	print("on event2: " .. ...)
end

ev:register(callbacks, callbacks.on_event1)
ev:register(callbacks, callbacks.on_event2)

local t = "this is a test"
ev(t)

--[[
output:
on event1: this is a test
on event2: this is a test
]]--