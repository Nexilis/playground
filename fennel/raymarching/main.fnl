(var camera {:pos [0.0 0.0 0.0]
             :x-rotate 0.0
             :z-rotate 0.0})

(var scene [])

(var camera-x-rotation (.. "Camera x rotation is: " (tostring camera.x-rotate)))

;; todo: impl sphere-distance

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
    (love.graphics.print camera-x-rotation))
