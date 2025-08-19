-- Dart snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Print debug
  s("pd", {
    t("print('🐛 DEBUG: "), i(1, "message"), t("');")
  }),

  -- TODO comment
  s("todo", {
    t("// TODO: "), i(1, "Add implementation")
  }),

  -- Class template
  s("class", {
    t("class "), i(1, "ClassName"), t({" {", "  "}), i(2, "// Constructor and properties"), t({"", "}"})
  }),

  -- Function template
  s("fn", {
    i(1, "void"), t(" "), i(2, "functionName"), t("("), i(3, ""), t({") {", "  "}), i(4, "// Implementation"), t({"", "}"})
  }),

  -- Try-catch block
  s("try", {
    t({"try {", "  "}), i(1, "// Code that might throw"), t({"", "} catch (e) {", "  "}), i(2, "print('Error: $e');"), t({"", "}"})
  }),

  -- List initialization
  s("list", {
    t("List<"), i(1, "String"), t("> "), i(2, "items"), t(" = ["), i(3, ""), t("];")
  }),

  -- Map initialization
  s("map", {
    t("Map<"), i(1, "String"), t(", "), i(2, "dynamic"), t("> "), i(3, "data"), t(" = {"), i(4, ""), t("};")
  }),
}