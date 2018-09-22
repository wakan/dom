commandArray = {}
function readAll(file)
	local f = io.open(file, "rb")
	local content = f:read("*all")
	f:close()
	return content
end

local value = readAll('/tmp/dom.fromscript.liveboxtv_message.val')
if (otherdevices_svalues['LiveboxTv'] ~= value) then
	print("LiveboxTv value changed to "..value)
	commandArray['UpdateDevice']='33|0|'..value
end
return commandArray
