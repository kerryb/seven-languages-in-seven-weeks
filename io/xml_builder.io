#!/usr/bin/env io

Builder := Object clone
Builder indent := 0
Builder forward := method(
  xml := "\n" asMutable appendSeq(" " repeated(indent))
  indent = indent + 2
  xml appendSeq("<", call message name, ">")
  call message arguments foreach(arg,
    xml appendSeq(self doMessage(arg))
  )
  indent = indent - 2
  xml appendSeq("</", call message name, ">\n")
)
Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript"),
  li("Ruby"),
  ul(
    li("MRI"),
    li("jRuby"),
    li("Rubinius")
  )
) println
