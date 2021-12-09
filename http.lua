Pepper.HTTP = {}
local main = Pepper.HTTP
local console = Pepper.Console
local metaClient = {}

function main.client(credentialsOBJ)
	local self = setmetatable({},{__index=metaClient})

	if credentialsOBJ then
		self.credentials = credentialsOBJ
	end

	return self
end

function metaClient:GET(resource, options)
	return Pepper.String.split(console.consoleReturn("curl "..resource.." "..options), "\n")
end

function main.credentials(username,passwd)
	local self = {}

	self.user = username
	self.pass = passwd

	return self
end

