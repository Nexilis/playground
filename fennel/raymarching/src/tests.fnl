(local lu (require :luaunit))
(local logic (require :logic))

(global TestSuite {})

(fn TestSuite.test-sphere-distance []
    (let [sphere (logic.sphere 5)
          actual (logic.sphere-distance sphere [5 0 0])]
        (lu.assertEquals actual 0)
    )
)

(os.exit (lu.LuaUnit.run))
