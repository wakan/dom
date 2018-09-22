commandArray = {}
function readAll(file)
	local f = io.open(file, "rb")
	local content = f:read("*all")
	f:close()
	return content
end

local min = readAll('/tmp/dom.fromscript.control.date_file_tmp_min')
local max = readAll('/tmp/dom.fromscript.control.date_file_tmp_max')
commandArray['UpdateDevice']='38|0|'..min..max
return commandArray
