;; extends
;; generated from ~/.dotfiles/config/theme; do not edit by hand
; Atoms and keyword keys (`:ok`, `do:`) are constants, even where the upstream
; query calls a module atom (`:ets.lookup`) a type.
((atom) @gravel.constant (#set! priority 105))
((quoted_atom) @gravel.constant (#set! priority 105))
((keyword) @gravel.constant (#set! priority 105))
((quoted_keyword) @gravel.constant (#set! priority 105))
; Upstream captures the right side of a pipe (`|> handle`) as @function, the
; capture gravel reserves for definitions. A piped name is a call.
((binary_operator
  operator: "|>"
  right: (identifier) @function.call)
  (#set! priority 105))
