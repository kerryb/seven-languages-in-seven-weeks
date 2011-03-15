#!/usr/bin/env io

Builder := Object clone
Builder indent := 0
Builder forward := method(
  xml := "\n" asMutable appendSeq(" " repeated(indent))
  indent = indent + 2
  xml appendSeq("<", call message name, ">")
  xml appendSeq(call message arguments map(arg, doMessage(arg)) join)
  indent = indent - 2
  if(xml endsWithSeq(">"), xml appendSeq("\n", " " repeated(indent)))
  xml appendSeq("</", call message name, ">")
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
