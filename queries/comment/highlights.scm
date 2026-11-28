; extends

; TODO: send PR for this when they're open
((tag
  (name) @comment.note @nospell
  ("(" @punctuation.bracket
    (user) @constant
    ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#match? @comment.note "IMPORTANT"))

("text" @comment.note @nospell
  (#match? @comment.note "IMPORTANT"))
