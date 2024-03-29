local installer = { firstinstall = false }

local install = {
	"clear";
	"mkdir PepperLua";
	"mkdir PepperLua/bin";
	"mkdir PepperLua/internal";
	"curl -o PepperLua/internal/console.lua https://raw.githubusercontent.com/ZaHallo/Pepper/main/console.lua";
	"curl -o PepperLua/internal/installer.lua https://raw.githubusercontent.com/ZaHallo/Pepper/main/pkg.lua";
	"curl -o PepperLua/internal/json.lua https://raw.githubusercontent.com/rxi/json.lua/master/json.lua";
	"curl -o PepperLua/installPackages.json https://raw.githubusercontent.com/ZaHallo/Pepper/main/packages.json";
}

if os.execute( "cd PepperLua" )~=0 then
	installer.firstinstall = true	
	for _, run in pairs(install) do
		os.execute(run)
	end
end

Pepper = { bin = {} }
Pepper.Console = require("PepperLua.internal.console")
Pepper.Json = require("PepperLua.internal.json")
Pepper.Installer = require("PepperLua.internal.installer")

local CurrentPacksFile = io.open("PepperLua/installPackages.json", "r")
local CurrentPacks = Pepper.Json.decode(CurrentPacksFile:read("*all"))

if installer.firstinstall == true then
	for Key, Value in pairs(CurrentPacks) do
		Pepper.Installer.get_package(Value, "PepperLua/bin/"..Key..".lua")
	end
end

for Key, Value in pairs(CurrentPacks) do
	require("PepperLua/bin/"..Key)
end

CurrentPacksFile:close()

Pepper.Uninstall = function()
	for Key, Value in pairs(CurrentPacks) do
		os.execute("rm PepperLua/bin/"..Key..".lua")
	end
	os.execute("rmdir PepperLua/bin")
	os.execute("rm PepperLua/installPackages.json")
	os.execute("rm PepperLua/internal/console.lua")
	os.execute("rm PepperLua/internal/installer.lua")
	os.execute("rm PepperLua/internal/json.lua")
	os.execute("rmdir PepperLua/internal")
	os.execute("rmdir PepperLua")
	Pepper = nil
end

os.execute("clear")
