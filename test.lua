local event = require "event"

local ev = event:new()
local callbacks1 = {}
local callbacks2 = {}

function callbacks1.on_event1(cb, ...)
    if cb == callbacks1 then
        print("callbacks1.on_event1: " .. ...)
	end
end

function callbacks1.on_event2(cb, ...)
	if cb == callbacks1 then
        print("callbacks1.on_event2: " .. ...)
	end
end

function callbacks2.on_event1(cb, ...)
	if cb == callbacks2 then
        print("callbacks2.on_event1: " .. ...)
	end
end

function callbacks2.on_event2(cb, ...)
    if cb == callbacks2 then
        print("callbacks2.on_event2: " .. ...)
	end
end

ev:register(callbacks1, callbacks1.on_event1)
ev:register(callbacks1, callbacks2.on_event1)

ev:register(callbacks2, callbacks1.on_event2)
ev:register(callbacks2, callbacks2.on_event2)

local t = "this is a test"
ev(t)

--[[
output:
callbacks1.on_event1: this is a test
callbacks2.on_event2: this is a test
]]--
