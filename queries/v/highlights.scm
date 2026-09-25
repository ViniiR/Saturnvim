; extends

(function_declaration
  name: (identifier)
  signature: (signature
    parameters: (parameter_list)
    result: (plain_type
      (type_reference_expression
        (identifier) @type))))

(call_expression
  name: (selector_expression
    operand: (reference_expression
      (identifier))
    field: (reference_expression
      (identifier) @function))
  arguments: (argument_list))
