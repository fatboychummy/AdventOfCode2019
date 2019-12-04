local function intCode(day, noun, verb)
  local data = {}

  -- opcode functions
  -- 1 = add
  -- 2 = mult
  -- 99 = stop
  -- any other should cause "attempt to call nil value" error
  local opcodes = {
    [1] = function(a, b, out)
      data[out] = data[a] + data[b]
      return false
    end,
    [2] = function(a, b, out)
      data[out] = data[a] * data[b]
      return false
    end,
    [99] = function()
      print("99 recieved. Stop")
      return true
    end
  }

  -- read the file, set up an iterator
  local file = io.open(day .. "input.txt", 'r')
  local iter = string.gmatch(file:read("*a"), "%d+")
  file:close()

  -- read the iter into data
  data[0] = tonumber(iter())
  repeat
    local it = iter()
    data[#data + 1] = tonumber(it)
  until not it

  -- initialize to the starting values
  data[1] = noun or 12
  data[2] = verb or 2

  local p = 0
  repeat
    local a = data[p]
    local b = data[p + 1]
    local c = data[p + 2]
    local d = data[p + 3]

    p = p + 4
    local ok, out = pcall(opcodes[a], b, c, d)
    if not ok then return textutils.serialize(data) end
  until out

  return data
end

return intCode
