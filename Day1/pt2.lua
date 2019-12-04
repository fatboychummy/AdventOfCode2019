local function run(day)
  local fuel = 0

  local function calcFuel(num)
    -- base case: fuel required less than or equal to 0
    local localFuel = math.floor(num / 3) - 2
    if localFuel <= 0 then return 0 end

    -- normal case: recurse into self to calculate fuel requirement
    local fuel = 0
    fuel = fuel + localFuel + calcFuel(localFuel)

    -- return the fuel needed for this
    return fuel
  end

  for line in io.lines(day .. "input.txt") do
    fuel = fuel + calcFuel(tonumber(line))
  end
  return fuel
end

return run
