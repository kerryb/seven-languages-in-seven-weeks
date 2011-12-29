import java.lang.Integer
import scala.io._
import scala.actors._
import Actor._

case class GetInfo(url: String)
case class PageSize(url: String, size: Integer)
case class LinkCount(url: String, count: Integer)
case object NoMoreRequests

object PageLoader {
  def getPage(url : String) = Source.fromURL(url).mkString
}

val urls = List(
  "http://www.amazon.com/",
  "http://www.twitter.com/",
  "http://www.google.com/",
  "http://www.cnn.com/"
)

def getLinkCount(page: String) = {
  "<a ".r findAllIn(page) size
}

def getPageInfo() = {
  val caller = self

  for(url <- urls) {
    caller ! new GetInfo(url)
  }
  caller ! NoMoreRequests

  var resultsOutstanding = 0
  var requestsAllReceived = false

  while (!requestsAllReceived || resultsOutstanding > 0) {
    receive {
      case GetInfo(url) =>
        resultsOutstanding += 2
        val page = PageLoader.getPage(url)
        actor { caller ! new PageSize(url, page.size) }
        actor { caller ! new LinkCount(url, getLinkCount(page)) }
      case PageSize(url, size) =>
        println(url + " is " + size + " bytes")
        resultsOutstanding -= 1
      case LinkCount(url, count) =>
        println(url + " has " + count + " links")
        resultsOutstanding -= 1
      case NoMoreRequests =>
        requestsAllReceived = true
    }
  }
}

getPageInfo
