-- TypeScript snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Console log
  s("cl", {
    t("console.log("), i(1, "'Debug: '"), t(", "), i(2, "variable"), t(");")
  }),
  
  -- Function
  s("fn", {
    t("function "), i(1, "functionName"), t("("), i(2, "params"), t("): "), i(3, "void"), t({" {", "  "}), i(4, "// body"), t({"", "}"})
  }),

  -- Arrow function
  s("af", {
    t("const "), i(1, "functionName"), t(" = ("), i(2, "params"), t("): "), i(3, "void"), t(" => {"), t({"", "  "}), i(4, "// body"), t({"", "}"})
  }),

  -- Interface
  s("int", {
    t("interface "), i(1, "InterfaceName"), t({" {", "  "}), i(2, "property: string;"), t({"", "}"})
  }),

  -- Type definition
  s("type", {
    t("type "), i(1, "TypeName"), t(" = "), i(2, "string"), t(";")
  }),

  -- Class
  s("class", {
    t("class "), i(1, "ClassName"), t({" {", "  constructor("}), i(2, "params"), t({") {", "    "}), i(3, "// constructor body"), t({"", "  }", "}"})
  }),

  -- Import statement
  s("imp", {
    t("import { "), i(1, "module"), t(" } from '"), i(2, "path"), t("';")
  }),

  -- Export statement
  s("exp", {
    t("export { "), i(1, "item"), t(" };")
  }),

  -- Try-catch
  s("try", {
    t({"try {", "  "}), i(1, "// Code that might throw"), t({"", "} catch (error) {", "  "}), i(2, "console.error(error);"), t({"", "}"})
  }),

  -- Async function
  s("async", {
    t("async function "), i(1, "functionName"), t("("), i(2, "params"), t("): Promise<"), i(3, "void"), t({"> {", "  "}), i(4, "// async body"), t({"", "}"})
  }),

  -- React functional component
  s("rfc", {
    t("import React from 'react';"), t({"", "", "interface "}), i(1, "Component"), t({"Props {", "  "}), i(2, "// props"), t({"", "}", "", "const "}),
    f(function(args) return args[1][1] end, {1}), t(": React.FC<"), f(function(args) return args[1][1] end, {1}), t({"Props> = (props) => {", "  return (", "    "}),
    i(3, "<div>Component</div>"), t({"", "  );", "};", "", "export default "}), f(function(args) return args[1][1] end, {1}), t(";")
  }),
}