Pepper.Datastores = {}
local main = Pepper.Datastores
local meta = {}


function main.open(name,scope)
	local self = setmetatable({},{__index=meta})

	self.datastore = name.."."..scope

	return self
end

function meta:write(key,value)
	return os.execute("curl $REPLIT_DB_URL -d '"..self.datastore.."."..key.."="..value.."'")==0
end
function meta:read(key)
	local response = Pepper.Console.consoleReturn("curl $REPLIT_DB_URL/"..self.datastore.."."..key)
	return response
end
function meta:delete(key)
	return os.execute("curl -XDELETE $REPLIT_DB_URL/"..self.datastore.."."..key)==0
end
function meta:listall()
	local response = Pepper.String.split(Pepper.Console.consoleReturn('curl "$REPLIT_DB_URL"'), "\n")
	return response
end
