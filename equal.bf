[]
[>]>[>]< ; to the second string end
[[>>+<<-]<]<[[>>+<<-]<] ; shift both strings to the right
+>>> ; set the equality flag and move to the start of the first string
include(interleave.bf)
[>] ; move until the zero cell
> ; to the next char (if any)
[ ; if there is a char (uneven lengths and spreadout cells)
 ;; TODO
]

;; TODO: Per character checks
