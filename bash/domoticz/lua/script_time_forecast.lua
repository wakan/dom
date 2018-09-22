commandArray = {}
function readAll(file)
	local f = io.open(file, "rb")
	local content = f:read("*all")
	f:close()
	return content
end

local value = readAll('/tmp/dom.fromscript.forecast.apparentTemperature')
commandArray['UpdateDevice']='42|'..value..'|'..value
value = readAll('/tmp/dom.fromscript.forecast.temperature')
commandArray['UpdateDevice']='43|'..value..'|'..value
value = readAll('/tmp/dom.fromscript.forecast.cloudCover')
commandArray['UpdateDevice']='44|'..value..'|'..value
value = readAll('/tmp/dom.fromscript.forecast.humidity')
commandArray['UpdateDevice']='45|'..value..'|'..value
value = readAll('/tmp/dom.fromscript.forecast.visibility')
commandArray['UpdateDevice']='46|'..value..'|'..value
value = readAll('/tmp/dom.fromscript.forecast.uvIndex')
commandArray['UpdateDevice']='47|'..value..'|'..value
return commandArray
