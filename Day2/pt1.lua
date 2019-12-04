local function run(day)
  local icode = require(day .. "intcode")

  return icode(day)[0]
end

return run
