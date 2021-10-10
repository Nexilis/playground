(local lu (require :luaunit))
(local logic (require :logic))

(global Tests {})

(fn Tests.test-sphere-distance []
    (let [radius 5
          sphere (logic.sphere radius)
          test-data [{:expected-distance 0
                      :sphere-position [5 0 0]}
                     {:expected-distance 10
                      :sphere-position [0 15 0]}
                     {:expected-distance -5
                      :sphere-position [0 0 0]}]
          ]

        (each [_ value (ipairs test-data)]
            (let [sphere-position value.sphere-position
                  actual (logic.sphere-distance sphere sphere-position)]
                (lu.assertEquals actual value.expected-distance)
            )
        )
    )
)

(os.exit (lu.LuaUnit.run))
