Pepper.String = {}
local main = Pepper.String

function main.split(s, sep)
	local lines = {}
	for str in s:gmatch("(.-)"..sep) do
		lines[#lines+1] = str
	end
	return lines
end
