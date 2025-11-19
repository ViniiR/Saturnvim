; Enable bash highlighting in nix '''' strings.
; FIXME: mildly broken
((indented_string_expression
   (string_fragment) @first_fragment) @injection.content
 (#match? @first_fragment "\n[[:space:]]*#syntax-bash")
 (#set! injection.language "bash")
 (#set! injection.include-children))
