(var camera {:pos [0.0 0.0 0.0]
             :x-rotate 0.0
             :z-rotate 0.0})

(var scene [])

(var camera-x-rotation (.. "Camera x rotation is: " (tostring camera.x-rotate)))

(fn love.draw []
    (love.graphics.print camera-x-rotation))
