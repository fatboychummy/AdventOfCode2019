local function run(day)
  local data = {}
  for i = 0, 999 do
    -- initialize everything to 0
    data[i] = 0
  end

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

  -- initialize to the starting values
  data[1] = 12
  data[2] = 2

  repeat
    local a = tonumber(iter()) -- opcode
    local b = tonumber(iter()) -- position 1
    local c = tonumber(iter()) -- position 2
    local d = tonumber(iter()) -- output position
  until opcodes[a](b, c, d)

  return data[0]
end

return run
