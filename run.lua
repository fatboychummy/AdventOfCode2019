local tArgs = {...}
local day = tArgs[1]
local part = tArgs[2]

if #tArgs < 2 then
  error("Usage: <file> <day:number> <part:number>", 0)
end

local runner = require("Day" .. day .. ".pt" .. part)

local file = "output/d" .. day .. "p" .. part .. ".out"
fs.delete(file)

print("Running Day " .. day .. " part " .. part)

local start = os.time()
io.open(file, 'w'):write(tostring(runner("Day" .. day .. "/") or "No output")):close()
local elapsed = (os.time() - start) * 50

print("Finished in " .. tostring(elapsed) .. " seconds.")
