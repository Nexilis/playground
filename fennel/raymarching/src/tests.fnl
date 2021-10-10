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
    (let [point [5 4 0]
          sphere1 (logic.create-sphere)
          s2-radius 2
          s2-pos [5 7 0]
          s2-color [0 1 0]
          sphere2 (logic.create-sphere s2-radius s2-pos s2-color)
          scene [sphere1 sphere2]
          ;; todo: fix - estimate distance is returning 'something else' :thinking-face:
          [actual-distance actual-color] (logic.estimate-distance point scene)
         ]
        (lu.assertEquals actual-distance 3)
        (lu.assertEquals actual-color [255 255 255])
    )
)

(os.exit (lu.LuaUnit.run))
