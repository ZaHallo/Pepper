local main = {}

function main.console(command)
   os.execute(command)
end

function main.consoleReturn(command)
	local strfull = ""
	for str in io.popen(command):lines("*a") do
		strfull = strfull..str.."\n"
	end
  return strfull
end

function main.directory_exists( sPath )
  if type( sPath ) ~= "string" then return false end

  local response = os.execute( "cd " .. sPath )
  if response == 0 then
    return true
  end
  return false
end

return main
