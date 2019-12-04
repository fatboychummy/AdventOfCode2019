local function run(day)
  local fuel = 0
  for line in io.lines(day .. "input.txt") do
    fuel = fuel + math.floor(tonumber(line) / 3) - 2
  end
  return fuel
end

return run
