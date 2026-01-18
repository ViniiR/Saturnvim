; extends

(command
  name: (command_name
    (word) @command)
  argument: (raw_string) @injection.content
  (#eq? @command "awk")
  (#set! injection.language "awk")
  ; (#set! injection.include-children) ; TODO: check if necessary before PR
  )
