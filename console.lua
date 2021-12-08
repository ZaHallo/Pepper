local main = {}

function main.console(command)
   os.execute(command)
end

function main.consoleReturn(command)
   return io.popen(command):lines("*a")
end

return main
