Pepper.Signals = {}
Pepper.Signals.eventmeta = {}
Pepper.Signals.connectionmeta = {}

--Event
function Pepper.Signals.Event()
	local this = setmetatable({}, {__invoke = Pepper.Signals.eventmeta})

	this.Connections = {}

	return this
end

function Pepper.Signals.eventmeta:Invoke()
	for Connection in pairs(self.Connections) do
		Connection.Lambda()
	end
end

function Pepper.Signals.eventmeta:Connect(ToCall)
	local NewConnection = Pepper.Signals.Connection(self,ToCall)
	self.Connections[NewConnection] = NewConnection
	return NewConnection
end

--Connection
function Pepper.Signals.Connection(Event, ToCall)
	local this = setmetatable({}, {__invoke = Pepper.Signals.connectionmeta})

	this.ConnectedEvent = Event
	this.Lambda = ToCall
	this.Active = true

	return this
end

function Pepper.Signals.connectionmeta:Disconnect()
	self.ConnectedEvent.Connections[self] = nil
	self.ConnectedEvent = nil
	self.Active = false
end
