(local lu (require :luaunit))
(local logic (require :logic))

(global Tests {})

(fn Tests.test-sphere-signed-distance-func []
    (let [radius 5
          sphere (logic.create-sphere radius)
          test-data [{:expected-distance 0
                      :sphere-position [5 0 0]}
                     {:expected-distance 10
                      :sphere-position [0 15 0]}
                     {:expected-distance -5
                      :sphere-position [0 0 0]}]
          ]

        (each [_ value (ipairs test-data)]
            (let [sphere-position value.sphere-position
                  actual (sphere:sdf sphere-position)]
                (lu.assertEquals actual value.expected-distance)
            )
        )
    )
)

(fn Tests.test-estimate-distance-func []
    (let [point [10 0 0]
          sphere1 (logic.create-sphere 5 [0 0 0] [254 254 254])
          sphere2 (logic.create-sphere 1 [5 0 0] [100 100 100])
          scene [sphere1 sphere2]
          ;; in Fennel destructuring of multiple values is done with parens instead of square brackets
          (actual-distance actual-color) (logic.estimate-distance point scene)
         ]
        (lu.assertEquals actual-distance 4)
        (lu.assertEquals actual-color [100 100 100])
    )
)

(os.exit (lu.LuaUnit.run))
