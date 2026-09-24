; extends

; Keywords
((type_identifier) @keyword
  .
  (compound_statement)
  (#any-of? @keyword "defer"))

((identifier) @keyword
  (#any-of? @keyword "each" "range" "rangex" "ever" "rest"))

(call_expression
  function: (identifier) @keyword
  (#any-of? @keyword "lengthof" "match" "when"))

((type_identifier) @keyword
  (#any-of? @keyword "let" "match"))

(call_expression
  function: (identifier) @keyword
  (#any-of? @keyword "try" "try_when"))

(call_expression
  function: (identifier) @keyword
  (#eq? @keyword "cast")
  arguments: (argument_list
    (_)
    (identifier) @type))

(function_definition
  type: (type_identifier) @keyword
  (#eq? @keyword "handle")
  (ERROR
    (identifier) @type))

((type_identifier) @keyword
  (#eq? @keyword "handle"))

; Builtins
((identifier) @constant.builtin
  (#lua-match? @constant.builtin "^DefaultResult.*"))

(call_expression
  function: (identifier) @constant.builtin
  (#any-of? @constant.builtin "SetOk" "SetErr" "IsOk" "IsErr"))

; Special
(call_expression
  function: (identifier) @punctuation.special
  (#any-of? @punctuation.special "debugf" "debug" "todo")
  arguments: (argument_list))
