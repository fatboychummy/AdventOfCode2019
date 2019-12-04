local function run(day)
  local data = {}
  for i = 0, 999 do
    -- initialize everything to 0
    data[i] = 0
  end

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

  local file = io.open(day .. "input.txt", 'r')
  local iter = string.gmatch(file:read("*a"), "%d+")
  file:close()

  data[1] = 12
  data[2] = 2

  repeat
    local a = tonumber(iter())
    local b = tonumber(iter())
    local c = tonumber(iter())
    local d = tonumber(iter())
  until opcodes[a](b, c, d)

  return data[0]
end

return run
