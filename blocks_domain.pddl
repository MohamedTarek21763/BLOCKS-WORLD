(define (domain blocks)
  (:requirements :strips :typing)

  (:types block) 

  (:predicates
  (clear ?x - block)
  (on-table ?x - block)
  (holding ?x - block)
  (handempty) 
  (on ?x - block ?y - block)
)




  ;; Action to pick up a block from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (clear ?x) (on-table ?x) (handempty))
    :effect (and (holding ?x) (not (clear ?x)) (not (on-table ?x)) (not (handempty)))
  )

  ;; Action to put down a block on the table
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (on-table ?x) (clear ?x) (handempty) (not (holding ?x)))
  )

  ;; Action to stack a block on another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)) (not (clear ?y)))
  )

  ;; Action to unstack a block from another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (handempty)) (not (clear ?x)))
  )
)
