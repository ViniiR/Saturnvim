; NOTE: do not extend the original file
; this replaces the original "https://github.com/nvim-treesitter/nvim-treesitter/blob/main/runtime/queries/json/highlights.scm"
[
  (true)
  (false)
] @boolean

(null) @constant.builtin

(number) @number

(pair
  key: (string) @property)

(pair
  value: (string) @string)

(array
  (string) @string)

[
  ","
  ":"
] @punctuation.delimiter

[
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

("\"" @conceal
  (#set! conceal ""))

((escape_sequence) @string.escape
  ; INFO: increase priority to override @conceal
  (#set! priority 110))

((escape_sequence) @conceal
  (#eq? @conceal "\\\"")
  (#set! conceal "\""))

(comment) @comment @spell
