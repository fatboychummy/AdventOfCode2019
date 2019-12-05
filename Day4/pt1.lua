local function run(day)
  local f = io.open(day .. "input.txt", 'r')
  local dat = f:read("*a")
  f:close()
  f = nil

  local iter = string.gmatch(dat, "%d+")
  local st = tonumber(iter())
  local ed = tonumber(math.abs(iter()))

  local function check(inp)
    inp = tostring(inp)
    local d = {}
    -- insert all characters into a table for easy access
    for char in string.gmatch(inp, ".") do
      d[#d + 1] = char
    end
    
    -- initialize the last number checked to the first in the table
    local last = d[1]
    -- doubleFlag will be true if there are two of the same numbers in a row
    local doubleFlag = false
    -- 
    for i = 2, #d do
      if last == d[i] then
        doubleFlag = true
      end
      if last < d[i] then
        -- immediately stop, this isn't a possible password
        return false
      end

      -- update the last number
      last = d[i]
    end
    
    -- if it meets criteria (didn't fail above, doubleFlag is set), then it's a good password.
    if doubleFlag then
      return true
    end
    -- otherwise it's not
    return false
  end

  -- brute force it
  local count = 0
  for i = st, ed do
    count = count + (check(i) and 1 or 0)
  end

  return count
end

return run
