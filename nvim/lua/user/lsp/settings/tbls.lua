local M = {}

function M.has_value(tbl, value)
	for _, val in pairs(tbl) do
		if (val == value) then
			return true
		end
	end

	return false
end

return M
