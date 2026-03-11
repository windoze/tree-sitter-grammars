; Identifiers

(identifier) @variable

; Functions

(function_declaration
  name: (identifier) @function.method)

(call_expression
  (identifier) @function.call)

(call_expression
  (navigation_expression
    (identifier) @function.call .))

(anonymous_function
  "fun" @keyword.function)

(getter
  "get" @function.method)

(setter
  "set" @function.method)

; Types

(class_declaration
  name: (identifier) @type)

(object_declaration
  name: (identifier) @type)

(type_alias
  type: (identifier) @type)

(user_type
  (identifier) @type)

((identifier) @type
  (#match? @type "^[A-Z]"))

(enum_entry
  (identifier) @constant)

; Constructors

(constructor_delegation_call
  ["this" "super"] @constructor)

(secondary_constructor
  "constructor" @constructor)

(primary_constructor
  "constructor" @constructor)

; Annotations

(annotation
  "@" @attribute)

(annotation
  (user_type
    (identifier) @attribute))

; Parameters

(parameter
  (identifier) @variable.parameter)

(class_parameter
  (identifier) @variable.parameter)

(lambda_parameters
  (variable_declaration
    (identifier) @variable.parameter))

; Properties

(navigation_expression
  (identifier) @variable.member .)

(class_body
  (property_declaration
    (variable_declaration
      (identifier) @variable.member)))

; Builtins

(this_expression) @variable.builtin

(super_expression) @variable.builtin

; Literals

[
  (number_literal)
  (float_literal)
] @number

[
  (string_literal)
  (multiline_string_literal)
] @string

(string_content) @string

(character_literal) @character

(escape_sequence) @string.escape

(interpolation
  "$" @punctuation.special)

(interpolation
  "${" @punctuation.special
  "}" @punctuation.special)

[
  "null"
] @constant.builtin

; Comments

[
  (line_comment)
  (block_comment)
] @comment

; Keywords

[
  "package"
  "import"
] @keyword.import

[
  "fun"
] @keyword.function

[
  "class"
  "interface"
  "object"
  "typealias"
  "enum"
] @keyword.type

[
  "val"
  "var"
] @keyword

[
  "return"
] @keyword.return

[
  "for"
  "while"
  "do"
  "continue"
  "break"
] @keyword.repeat

[
  "in"
  "!in"
] @keyword

[
  "if"
  "else"
  "when"
] @keyword.conditional

[
  "try"
  "catch"
  "finally"
  "throw"
] @keyword.exception

[
  "abstract"
  "final"
  "open"
  "override"
  "lateinit"
  "public"
  "private"
  "protected"
  "internal"
  "sealed"
  "data"
  "inner"
  "value"
  "annotation"
  "companion"
  "const"
  "inline"
  "external"
  "suspend"
  "tailrec"
  "operator"
  "infix"
  "vararg"
  "noinline"
  "crossinline"
  "reified"
  "expect"
  "actual"
] @keyword.modifier

[
  "is"
  "!is"
  "as"
  "as?"
  "by"
  "where"
  "init"
] @keyword

; Operators

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "++"
  "--"
  "!"
  "!!"
  "=="
  "!="
  "==="
  "!=="
  "<"
  ">"
  "<="
  ">="
  "||"
  "&&"
  ".."
  "..<"
  "?:"
  "->"
  "::"
] @operator

"@" @operator

; Punctuation

[
  "."
  ","
  ";"
  ":"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

(type_arguments
  [
    "<"
    ">"
  ] @punctuation.bracket)

(type_parameters
  [
    "<"
    ">"
  ] @punctuation.bracket)

(label) @label
