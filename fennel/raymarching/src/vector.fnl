(global Vector {})

(fn Vector.create-vec [x y z]
    (if (not x) [0 0 0]
        (and (not y) (not z)) [x x x]
        [x y (or z 0)]
    )
)

Vector
