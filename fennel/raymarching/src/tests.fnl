(local lu (require :luaunit))
(local logic (require :logic))
(local vector (require :vector))

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

(fn Tests.test-vector-creation []
    (let [vec1 (vector.create-vec)
          vec2 (vector.create-vec 3)
          vec3 (vector.create-vec 5 7)
          vec4 (vector.create-vec 3 2 1)
         ]
        (lu.assertEquals vec1 [0 0 0])
        (lu.assertEquals vec2 [3 3 3])
        (lu.assertEquals vec3 [5 7 0])
        (lu.assertEquals vec4 [3 2 1])
    )
)

(fn Tests.test-vector-length-func []
    (let [actual1 (vector.length (vector.create-vec 1 0 0))
          actual2 (vector.length (vector.create-vec 0 0 10))
          actual3 (vector.length (vector.create-vec 1 3 6))
         ]
        (lu.assertEquals actual1 1)
        (lu.assertEquals actual2 10)
        (lu.assertEquals (math.ceil actual3) 7)
    )
)

(os.exit (lu.LuaUnit.run))
