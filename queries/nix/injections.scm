;; extends

; NOTE: this is better however due to formatting issues i decided to remove it
; e.g. /* syntax-bash */ is broken into 3 lines
; (
;  (comment) @syntax_comment
;  (indented_string_expression
;    (string_fragment) @first_fragment) @injection.content
;  (#match? @syntax_comment "[[:space:]]*syntax-bash[[:space:]]*")
;  (#set! injection.language "bash")
;  (#set! injection.include-children)
;  (#set! injection.combined)
;  )

; INFO: also implemented by default in pkgs.writeShellScript (exact same behavior)

; Enable bash highlighting in nix '''' strings, on the condition that:
; the second line matches regex: \s*#syntax-bash
; INFO: breaks when having two bash strings in the same file
; add a commented first line in bash to fix the highlight
(
 (indented_string_expression
   (string_fragment) @first_fragment) @injection.content
 (#match? @first_fragment "\n[[:space:]]*#syntax-bash")
 (#set! injection.language "bash")
 (#set! injection.include-children)
 (#set! injection.combined)
 )

; more info check: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/nix/injections.scm
