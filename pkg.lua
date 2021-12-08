local console = require("PepperLua.internal.console")

local main = {}

function main.file_exists(name)
  local f=io.open(name,"r")
  if f~=nil then 
	 	io.close(f)	
		return true 
	else 
		return false 
	end
end

function main.get_package(packagepath, saveasdirectory)
	console.console("curl -o "..saveasdirectory.." "..packagepath)
	console.console("clear")
end

function  main.tryGet(packagepath,saveasdirectory)
	if not main.file_exists(saveasdirectory) then
		main.get_package(packagepath,saveasdirectory)
	end
end

return main
