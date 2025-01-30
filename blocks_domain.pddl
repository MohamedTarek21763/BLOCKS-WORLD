(define (domain blocks)
  (:requirements :strips)
  (:types block big small)  ; Add big and small as types
  (:predicates
    (on ?x ?y)  ; Block X is on block Y
    (clear ?x)  ; Block X is clear (nothing is on it)
    (holding ?x)  ; We are holding block X
  )

  (:action stack
    :parameters (?x ?y ?z)
    :precondition (and (clear ?x) (clear ?y) (holding ?z))
    :effect (and (on ?z ?y) (clear ?z) (not (holding ?z)))
  )

  (:action unstack
    :parameters (?x ?y ?z)
    :precondition (and (on ?z ?y) (clear ?x) (holding ?x))
    :effect (and (holding ?z) (clear ?y) (not (on ?z ?y)))
  )
)
