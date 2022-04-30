(define 

    (domain runbook_move_server_rack_to_rack)

   (:types
         tN - object
         tX tY - tN
   )

    (:predicates
        (r ?x - tX ?y - tY)
        (w ?x - tX ?y - tY)
        (b ?x - tX ?y - tY)
        (i ?n - tN ?nn - tN)
        (d ?n - tN ?nn - tN)
    )

    (:action move-r
        :parameters 
           (?x - tX ?y - tY ?xn - tX)
        :precondition 
           (and 
           (r ?x ?y) 
           (i ?x ?xn) (not(w ?xn ?y)) (not(b ?xn ?y)) 
           )
        :effect 
           (and 
           (not(r ?x ?y)) (r ?xn ?y) 
           )
    )
    (:action move-l
        :parameters 
           (?x - tX ?y - tY ?xn - tX)
        :precondition 
           (and 
           (r ?x ?y) 
           (d ?x ?xn) (not(w ?xn ?y)) (not(b ?xn ?y)) 
           )
        :effect 
           (and 
           (not(r ?x ?y)) (r ?xn ?y) 
           )
    )
    (:action move-d
        :parameters 
           (?x - tX ?y - tY ?yn - tY)
        :precondition 
           (and 
           (r ?x ?y) 
           (i ?y ?yn) (not(w ?x ?yn)) (not(b ?x ?yn)) 
           )
        :effect 
           (and 
           (not(r ?x ?y)) (r ?x ?yn) 
           )
    )
    (:action move-u
        :parameters 
           (?x - tX ?y - tY ?yn - tY)
        :precondition 
           (and 
           (r ?x ?y) 
           (d ?y ?yn) (not(w ?x ?yn)) (not(b ?x ?yn)) 
           )
        :effect 
           (and 
           (not(r ?x ?y)) (r ?x ?yn)
           )
    )
    (:action push-r
        :parameters 
           (?x - tX ?y - tY ?xn - tX ?xnn - tX)
        :precondition 
           (and 
           (r ?x ?y) 
           (i ?x ?xn) (not(w ?xn ?y)) (b ?xn ?y) 
           (i ?xn ?xnn) (not(w ?xnn ?y)) (not(b ?xnn ?y))
           )
        :effect 
           (and 
           (not(r ?x ?y)) (r ?xn ?y) 
           (not(b ?xn ?y)) (b ?xnn ?y) 
           )
    )
    (:action push-l
        :parameters
           (?x - tX ?y - tY ?xn - tX ?xnn - tX)
        :precondition
           (and
           (r ?x ?y)
           (d ?x ?xn) (not(w ?xn ?y)) (b ?xn ?y)
           (d ?xn ?xnn) (not(w ?xnn ?y)) (not(b ?xnn ?y))
           )
        :effect
           (and
           (not(r ?x ?y)) (r ?xn ?y)
           (not(b ?xn ?y)) (b ?xnn ?y)
           )
    )
    (:action push-d
        :parameters
           (?x - tX ?y - tY ?yn - tY ?ynn - tY)
        :precondition
           (and
           (r ?x ?y)
           (i ?y ?yn) (not(w ?x ?yn)) (b ?x ?yn)
           (i ?yn ?ynn) (not(w ?x ?ynn)) (not(b ?x ?ynn))
           )
        :effect
           (and
           (not(r ?x ?y)) (r ?x ?yn)
           (not(b ?x ?yn)) (b ?x ?ynn)
           )
    )
    (:action push-u
        :parameters
           (?x - tX ?y - tY ?yn - tY ?ynn - tY)
        :precondition
           (and
           (r ?x ?y)
           (d ?y ?yn) (not(w ?x ?yn)) (b ?x ?yn)
           (d ?yn ?ynn) (not(w ?x ?ynn)) (not(b ?x ?ynn))
           )
        :effect
           (and
           (not(r ?x ?y)) (r ?x ?yn)
           (not(b ?x ?yn)) (b ?x ?ynn)
           )
    )
)
