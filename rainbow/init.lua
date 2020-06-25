local eight_bit = require 'rainbow.8bit'
local four_bit = require 'rainbow.4bit'

local rainbow = {}

local function escape(...)
	return "\x1B[" .. table.concat({...}, ";") .. "m"
end

function rainbow.colorize8(name, text)
	color = eight_bit[name]

	if not color then
		error("Unknown color: "..name)
	end

	return escape(38, 5, tostring(color.id))..tostring(text)..escape(39)
end

function rainbow.colorize4(name, text)
	color = four_bit[name]

	if not color then
		error("Unknown color: "..name)
	end

	return escape(3, 5, tostring(color.id))..tostring(text)..escape(39)
end

return rainbow
