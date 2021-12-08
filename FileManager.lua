Pepper.FileManager = {}
Pepper.FileManager.meta = {}

function Pepper.FileManager.new(fpath)
	local this = setmetatable({},{__index=Pepper.FileManager.meta})

	this.FilePath = fpath

	return this
end

function Pepper.FileManager.meta:ReadLines()
	local file = io.open(self.FilePath, "r")
	local lines = {}
	if file then
		for str in file:read("*all"):gmatch("(.-)\n") do
			lines[#lines+1] = str
		end
		file:close()
	else
		print("file is innaccessible; does not exist")
	end
	return lines
end

function Pepper.FileManager.meta:WriteLines(lines, append)
	local mode = "w+"
	if append then
		mode = "w"
	end
	local file = io.open(self.FilePath, mode)
	if file then
		file:seek("set")
		for a,b in pairs(lines) do
			file:write(b.."\n")
		end
		file:close()
	else
		print("file is innaccessible; does not exist")
	end
end
