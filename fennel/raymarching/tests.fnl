(local lu (require :luaunit))
;(local sut (require :main))

(global TestSuite {})

(fn TestSuite.test-true-is-true []
    (lu.assertEquals true true))

(os.exit (lu.LuaUnit.run))
