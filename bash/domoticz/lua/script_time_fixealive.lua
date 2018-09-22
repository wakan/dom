commandArray = {}
function readAll(file)
	local f = io.open(file, "rb")
	local content = f:read("*all")
	f:close()
	return content
end

local value = readAll('/tmp/dom.fromscript.arpping_fixe.val')
if (tonumber(value) == 11) then
	if ( otherdevices['FixeAlive'] == 'Off') then
		commandArray['UpdateDevice']="37|1|On"
	end

else
	if (otherdevices['FixeAlive'] == 'On') then
		commandArray['UpdateDevice']="37|0|Off"
	end
end
return commandArray
