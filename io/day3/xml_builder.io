#!/usr/bin/env io

OperatorTable addAssignOperator(":", "colon")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
Map colon := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1))
)

Builder := Object clone
Builder indent := 0
Builder forward := method(
  xml := "\n" asMutable appendSeq(" " repeated(indent))
  indent = indent + 2
  xml appendSeq("<", call message name)
  args := call message arguments map(arg, doMessage(arg))
  if(args at(0) type == "Map",
    xml appendSeq(args at(0) map(key, value, " " asMutable appendSeq(key, "=\"", value, "\"")) join)
    args removeAt(0)
  )
  xml appendSeq(">", args join)
  indent = indent - 2
  if(xml endsWithSeq(">"), xml appendSeq("\n", " " repeated(indent)))
  xml appendSeq("</", call message name, ">")
)

xml := doString("""
Builder ul({"id": "languages", "class": "root"},
  li("Io"),
  li("Lua"),
  li("JavaScript"),
  li("Ruby"),
  ul({"class": "sublist"},
    li("MRI"),
    li("jRuby"),
    li("Rubinius")
  )
)
""")
xml println
