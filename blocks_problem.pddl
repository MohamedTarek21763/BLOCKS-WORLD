(define (problem blocks-problem)
  (:domain blocks)

  (:objects blockA blockB blockC blockD - block)  ;; Ensure type is correct

  (:init 
    (on-table blockA) 
    (on-table blockB) 
    (on-table blockC) 
    (on-table blockD) 
    (clear blockA) 
    (clear blockB) 
    (clear blockC) 
    (clear blockD) 
    (handempty)
  )

  (:goal 
    (and 
      (on blockA blockB) 
      (on blockB blockC) 
      (on blockC blockD)
    )
  )
)
