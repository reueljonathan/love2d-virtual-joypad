local utils = {}

function utils.split(s)
	local result = {}
	-- print("inside split")
	for w in s:gmatch("%w+") do
		-- print(" " .. w)
		result[#result+1] = w
	end
	return result
end

return utils