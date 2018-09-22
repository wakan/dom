commandArray = {}
function readAll(file)
	local f = io.open(file, "rb")
	local content = f:read("*all")
	f:close()
	return content
end

local value = readAll('/tmp/dom.fromscript.memory_logging.val')
commandArray['UpdateDevice']='39|'..value..'|'..value..'% CPU'
return commandArray
