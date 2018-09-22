commandArray = {}
function readAll(file)
	local f = io.open(file, "rb")
	local content = f:read("*all")
	f:close()
	return content
end

local value = readAll('/tmp/dom.fromscript.arpping_tel_guillaume.val')
if (tonumber(value) == 11) then
	if ( otherdevices['TelGuillaumeAlive'] == 'Off') then
		commandArray['TelGuillaumeAlive']='On'
	end

else
	if (otherdevices['TelGuillaumeAlive'] == 'On') then
		commandArray['TelGuillaumeAlive']='Off'
	end
end
value = readAll('/tmp/dom.fromscript.arpping_tel_marine.val')
if (tonumber(value) == 11) then
	if ( otherdevices['TelMarineAlive'] == 'Off') then
		commandArray['TelMarineAlive']='On'
	end

else
	if (otherdevices['TelMarineAlive'] == 'On') then
		commandArray['TelMarineAlive']='Off'
	end
end
return commandArray
