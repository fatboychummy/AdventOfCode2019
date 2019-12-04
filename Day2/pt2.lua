local function run(day)
  local icode = require(day .. "intcode")
  local want = 19690720

  -- bruteforce it
  for i = 0, 100 do
    for j = 0, 100 do
      print("Running", i, j)
      if icode(day, i, j)[0] == want then
        return 100 * i + j
      end
    end
  end

  return "Failure"
end

return run
