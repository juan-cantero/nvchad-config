-- Go snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Print debug
  s("pd", {
    t('fmt.Println("🐛 DEBUG:", '), i(1, "variable"), t(")")
  }),

  -- Function
  s("fn", {
    t("func "), i(1, "functionName"), t("("), i(2, "params"), t(") "), i(3, ""), t({" {", "	"}), i(4, "// body"), t({"", "}"})
  }),

  -- Main function
  s("main", {
    t({"package main", "", "import \"fmt\"", "", "func main() {", "	"}), i(1, 'fmt.Println("Hello, World!")'), t({"", "}"})
  }),

  -- Struct
  s("struct", {
    t("type "), i(1, "StructName"), t({" struct {", "	"}), i(2, "Field string"), t({"", "}"})
  }),

  -- Method
  s("method", {
    t("func ("), i(1, "r"), t(" *"), i(2, "Receiver"), t(") "), i(3, "MethodName"), t("("), i(4, "params"), t(") "), i(5, ""), t({" {", "	"}), i(6, "// body"), t({"", "}"})
  }),

  -- Interface
  s("interface", {
    t("type "), i(1, "InterfaceName"), t({" interface {", "	"}), i(2, "Method() error"), t({"", "}"})
  }),

  -- Error handling
  s("err", {
    t({"if err != nil {", "	"}), i(1, "return err"), t({"", "}"})
  }),

  -- For loop
  s("for", {
    t("for "), i(1, "i := 0; i < 10; i++"), t({" {", "	"}), i(2, "// body"), t({"", "}"})
  }),

  -- Range loop
  s("range", {
    t("for "), i(1, "i, v"), t(" := range "), i(2, "slice"), t({" {", "	"}), i(3, "// body"), t({"", "}"})
  }),

  -- If statement
  s("if", {
    t("if "), i(1, "condition"), t({" {", "	"}), i(2, "// body"), t({"", "}"})
  }),

  -- Switch statement
  s("switch", {
    t("switch "), i(1, "variable"), t({" {", "case "}), i(2, "value"), t({":", "	"}), i(3, "// case body"), t({"", "default:", "	"}), i(4, "// default body"), t({"", "}"})
  }),

  -- Package declaration
  s("package", {
    t("package "), i(1, "main")
  }),

  -- Import
  s("import", {
    t('import "'), i(1, "package"), t('"')
  }),

  -- Multiple imports
  s("imports", {
    t({"import (", "	\""}), i(1, "fmt"), t({"\"", "	\""}), i(2, "package"), t({"\"", ")"})
  }),

  -- HTTP handler
  s("handler", {
    t("func "), i(1, "handlerName"), t("(w http.ResponseWriter, r *http.Request) {"), t({"", "	"}), i(2, "// handler body"), t({"", "}"})
  }),

  -- Test function
  s("test", {
    t("func Test"), i(1, "FunctionName"), t("(t *testing.T) {"), t({"", "	"}), i(2, "// test body"), t({"", "}"})
  }),
}