(global Logic {})

(local DRAW-DISTANCE 1000)

(var camera {:pos [0.0 0.0 0.0]
             :x-rotate 0.0
             :z-rotate 0.0})

;; collection of objects, e.g. sphere1, sphere2 ...
(var scene [])

(fn Logic.calc-sphere-distance [{:pos [sx sy sz] : radius} [x y z]]
    (-
        (math.sqrt
            (+
                (^ (- sx x) 2)
                (^ (- sy y) 2)
                (^ (- sz z) 2)
            )
        )
        radius
    )
)

(fn Logic.create-sphere [radius pos color]
    (let [[x y z] (or pos [0 0 0])
          [r g b] (or color [1 1 1])]
        {:radius (or radius 5)
         :pos [(or x 0) (or y 0) (or z 0)]
         :color [(or r 0) (or g 0) (or b 0)]
         :sdf Logic.calc-sphere-distance
         ;; sdf explained here https://en.wikipedia.org/wiki/Signed%5Fdistance%5Ffunction
         }
    )
)

;; in docs def. as (fn distance-estimator ...)
(fn Logic.estimate-distance [point scene]
    (var min DRAW-DISTANCE)
    (var color [0 0 0])
    (each [_ object (ipairs scene)]
        (let [distance (object:sdf point)]
            (when (< distance min)
                (set min distance)
                (set color (. object :color))
            )
        )
    )
    (values min color)
)

Logic
