; extends

(command
  name: (command_name
    (word)) @_command
  .
  argument: (raw_string) @injection.content
  .
  (#eq? @_command "awk")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "awk"))

(command
  name: (command_name
    (word)) @_command
  argument: (_)? @_param
  .
  argument: (raw_string) @injection.content
  .
  (#eq? @_command "awk")
  (#offset! @injection.content 0 1 0 -1)
  (#not-any-of? @_param "--file" "--field-separator")
  (#not-lua-match? @_param "^%-[^%-]*[fF]")
  ; (#not-match? @_param "^(--file|--field-separator|-[^-]*[fF])")
  ; (#not-match? @param "^(--file|--field-separator|-[^-]*[fF])")
  (#set! injection.include-children)
  (#set! injection.language "awk"))

; (command
;   name: (command_name
;     (word) @command)
;   argument: (word) @param
;   .
;   argument: (raw_string) @injection.content
;   .
;   (#eq? @command "awk")
;   (#not-match? @param "^(--file|-[^-]*[f])")
;   (#set! injection.language "awk"))
;
; (command
;   name: (command_name
;     (word) @command)
;   argument: [
;     (string)
;     (word)
;   ]*
;   argument: (word) @param
;   .
;   argument: (raw_string) @injection.content
;   .
;   (#eq? @command "awk")
;   (#not-match? @param "^(--file|-[^-]*[f])")
;   (#set! injection.include-children)
;   (#set! injection.language "awk"))
; (command
;   name: (command_name
;     (word) @command)
;   argument: (word) @param
;   argument: (string)
;   .
;   argument: (raw_string) @injection.content
;   .
;   (#eq? @command "awk")
;   (#match? @param "^(--file|-[^-]*[f])")
;   (#set! injection.include-children)
;   (#set! injection.language "awk"))
;
; (command
;   name: (command_name
;     (word) @command)
;   argument: (word) @param
;   .
;   argument: (raw_string) @injection.content
;   .
;   (#eq? @command "awk")
;   (#not-match? @param "^(--file|-[^-]*[f])")
;   (#set! injection.include-children)
;   (#set! injection.language "awk"))
; (command
;   name: (command_name
;     (word) @command)
;   argument: (word) @param
;   argument: (raw_string) @injection.content
;   .
;   (#eq? @command "awk")
;   (#not-match? @param "^(--file|-[^-]*[f])")
;   (#set! injection.language "awk"))
;
;
;
; argument: (word)? @param-post
; (#not-match? @param-post ;
;    "^(--file|-[^-]*[f]*.*)$";
;   )
; (command
;   name: (command_name
;     (word) @command)
;   argument: (word)? @param
;   argument: (raw_string) @injection.content
;   (#eq? @command "awk")
;   (#not-match? @param "^-[^-][f]*.*")
;   (#set! injection.language "awk"))
; (command
;   name: (command_name
;     (word) @command)
;   argument: (word)? @param
;   argument: (raw_string) @injection.content
;   (#eq? @command "awk")
;   (#match? @param "^-[^-]*[^f]+")
;   (#set! injection.language "awk"))
; (command
;   name: (command_name
;     (word) @command)
;   argument: (word)? @arg-pre
;   argument: (raw_string) @injection.content
;   argument: (word)? @arg-post
;   (#eq? @command "awk")
;   (#match? @arg-pre "^-[^-]*[beP]+")
;   (#match? @arg-post "^-[^-]*[beP]+")
;   (#set! injection.language "awk"))
; (command
;   name: (command_name
;     (word) @command)
;   argument: (word) @arg
;   argument: (raw_string) @injection.content
;   (#eq? @command "awk")
;   (#match? @arg "^-[^-]*[be]+")
;   (#set! injection.language "awk"))
;
; (command
;   name: (command_name
;     (word) @command)
;   .
;   argument: (raw_string) @injection.content
;   (#eq? @command "awk")
;   (#set! injection.language "awk"))
