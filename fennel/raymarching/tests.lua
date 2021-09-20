local lu = require("luaunit")
TestSuite = {}
TestSuite["test-true-is-true"] = function()
  return lu.assertEquals(true, true)
end
return os.exit(lu.LuaUnit.run())
