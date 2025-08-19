-- Flutter snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Custom StatelessWidget
  s("stless", {
    t({"import 'package:flutter/material.dart';", "", "class "}), i(1, "MyWidget"), t({" extends StatelessWidget {", "  const "}), 
    f(function(args) return args[1][1] end, {1}), t({"({super.key});", "", "  @override", "  Widget build(BuildContext context) {", "    return "}),
    i(2, "Container()"), t({";", "  }", "}"})
  }),
  
  -- Custom StatefulWidget
  s("stful", {
    t({"import 'package:flutter/material.dart';", "", "class "}), i(1, "MyWidget"), t({" extends StatefulWidget {", "  const "}),
    f(function(args) return args[1][1] end, {1}), t({"({super.key});", "", "  @override", "  State<"}),
    f(function(args) return args[1][1] end, {1}), t({"> createState() => _"}),
    f(function(args) return args[1][1] end, {1}), t({"State();", "}", "", "class _"}),
    f(function(args) return args[1][1] end, {1}), t({"State extends State<"}),
    f(function(args) return args[1][1] end, {1}), t({"> {", "  @override", "  Widget build(BuildContext context) {", "    return "}),
    i(2, "Container()"), t({";", "  }", "}"})
  }),

  -- Quick Container with decoration
  s("cont", {
    t("Container("), t({"", "  padding: const EdgeInsets.all("}), i(1, "8.0"), t({"),", "  decoration: BoxDecoration(", "    color: "}),
    i(2, "Colors.white"), t({",", "    borderRadius: BorderRadius.circular("}), i(3, "8"), t({"),", "  ),", "  child: "}),
    i(4, "Text('Hello')"), t({",", ")"})
  }),

  -- Scaffold template
  s("scaffold", {
    t({"Scaffold(", "  appBar: AppBar(", "    title: Text('"}), i(1, "Title"), t({"'),", "  ),", "  body: "}),
    i(2, "Container()"), t({",", ")"})
  }),

  -- Column widget
  s("col", {
    t({"Column(", "  children: [", "    "}), i(1, "Text('Item')"), t({",", "  ],", ")"})
  }),

  -- Row widget
  s("row", {
    t({"Row(", "  children: [", "    "}), i(1, "Text('Item')"), t({",", "  ],", ")"})
  }),

  -- Padding widget
  s("pad", {
    t("Padding("), t({"", "  padding: const EdgeInsets.all("}), i(1, "8.0"), t({"),", "  child: "}), i(2, "Container()"), t({",", ")"})
  }),

  -- Center widget
  s("center", {
    t("Center(child: "), i(1, "Text('Centered')"), t(")")
  }),

  -- ElevatedButton
  s("btn", {
    t("ElevatedButton("), t({"", "  onPressed: () {", "    "}), i(1, "// Action"), t({"", "  },", "  child: Text('"}), i(2, "Button"), t({"'),", ")"})
  }),
}