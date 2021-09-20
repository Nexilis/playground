(var camera {:pos [0.0 0.0 0.0]
             :x-rotate 0.0
             :z-rotate 0.0})

(var scene [])

(var camera-x-rotation (.. "Camera x rotation is: " (tostring camera.x-rotate)))

(fn sphere-distance [{:pos [sx sy sz] : radius} [x y z]]
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

(fn sphere [radius pos color]
    (let [[x y z] (or pos [0 0 0])
          [r g b] (or color [1 1 1])]
        {:radius (or radius 5)
         :pos [(or x 0) (or y 0) (or z 0)]
         :color [(or r 0) (or g 0) (or b 0)]
         :sdf sphere-distance
         ;; sdf explained here https://en.wikipedia.org/wiki/Signed%5Fdistance%5Ffunction
         }
    )
)

(fn love.draw []
    (love.graphics.print (sphere-distance (sphere 5) [5 0 0]) 0 0) ;; should be 0.0
    (love.graphics.print (sphere-distance (sphere 5) [0 15 0]) 0 15) ;; should be 10.0
    (love.graphics.print (sphere-distance (sphere 5) [0 0 0]) 0 30) ;; should be -5.0
    (love.graphics.print camera-x-rotation 0 40))
