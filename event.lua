local event = {}

function event.new(self)
	local ev = {}

	setmetatable(ev, self)

	self.__index = self
	self.__call = self.call

	return ev
end

function event.register(self, callbacks, fuc)
	table.insert(self, {callbacks, fuc})

	return #self
end

function event.unregister(self, index)
	table.remove(self, index)
end

function event.call(tbl, ...)
	for _, t in ipairs(tbl) do
		local callbacks = t[1]
		local fuc = t[2]

		fuc(callbacks, ...)
	end
end

return event
