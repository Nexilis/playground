(global Vector {})

(fn Vector.create-vec [x y z]
    (if (not x) [0 0 0]
        (and (not y) (not z)) [x x x]
        [x y (or z 0)]
    )
)

(fn Vector.length [[x y z]]
    (math.sqrt
        (+
            (^ x 2)
            (^ y 2)
            (^ z 2)
        )
    )
)

(fn Vector.subtract [[x0 y0 z0] [x1 y1 z1]]
    [(- x0 x1)
     (- y0 y1)
     (- z0 z1)
    ]
)

(fn Vector.add [[x0 y0 z0] [x1 y1 z1]]
    [(+ x0 x1)
     (+ y0 y1)
     (+ z0 z1)
    ]
)

(fn Vector.multiply [[x0 y0 z0] [x1 y1 z1]]
    [(* x0 x1)
     (* y0 y1)
     (* z0 z1)
    ]
)

(fn Vector.normalize [v]
    (let [len (Vector.length v)
          [x y z] v
         ]
         [(/ x len)
          (/ x len)
          (/ x len)
         ]
    )
)

Vector
