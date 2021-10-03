(local logic (require :logic))

(fn love.draw []
    (love.graphics.print (logic.sphere-distance (logic.sphere 5) [5 0 0]) 0 0) ;; should be 0.0
    (love.graphics.print (logic.sphere-distance (logic.sphere 5) [0 15 0]) 0 15) ;; should be 10.0
    (love.graphics.print (logic.sphere-distance (logic.sphere 5) [0 0 0]) 0 30) ;; should be -5.0
)

