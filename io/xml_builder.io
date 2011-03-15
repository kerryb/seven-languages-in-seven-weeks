#!/usr/bin/env io

Builder := Object clone
Builder forward := method(
  xml := "<#{call message name}>" interpolate asMutable
  call message arguments foreach(arg,
    content := self doMessage(arg)
    if(content type == "Sequence", xml appendSeq(content))
  )
  xml appendSeq("</", call message name, ">")
)
Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript")
) println
