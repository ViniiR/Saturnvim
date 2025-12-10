; extends

; injects SQL into ocaml {|...|} strings
((comment) @syntax_comment
  (quoted_string
    (quoted_string_content) @injection.content)
  (#match? @syntax_comment "[[:space:]]*syntax-sql[[:space:]]*")
  (#set! injection.language "sql")
  (#set! injection.include-children)
  ; no need for combined since ocaml will not be used inside it
  ; (#set! injection.combined)
  )
