local main = {}

function main.console(command)
   os.execute(command)
end

function main.consoleReturn(command)
   return io.popen(command):lines("*a")
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
