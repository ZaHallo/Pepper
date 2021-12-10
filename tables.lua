Pepper.Tables = {}
local main = Pepper.Tables

main.DeepCopy = function(t)
	local result = {}
	for key, value in pairs(t) do
		if type(value) == "table" then
			value = main.DeepCopy(value)
		end
		result[key] = value
	end
	return result
end