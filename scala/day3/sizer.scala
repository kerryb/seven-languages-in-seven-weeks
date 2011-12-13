import scala.io._
import scala.actors._
import Actor._

case class PageSize(url: String, size: java.lang.Integer)
case class LinkCount(url: String, count: java.lang.Integer)

object PageLoader {
  def getPage(url : String) = Source.fromURL(url).mkString
}

val urls = List("http://www.amazon.com/",
  "http://www.twitter.com/",
  "http://www.google.com/",
  "http://www.cnn.com/" )

def getLinkCount(page: String) = {
  "<a ".r findAllIn(page) size
}

def getPageInfo() = {
  val caller = self

  for(url <- urls) {
    val page = PageLoader.getPage(url)
    actor { caller ! new PageSize(url, page.size) }
    actor { caller ! new LinkCount(url, getLinkCount(page)) }
  }

  for(i <- 1 to urls.size * 2) {
    receive {
      case PageSize(url, size) =>
        println(url + " is " + size + " bytes")
      case LinkCount(url, count) =>
        println(url + " has " + count + " links")
    }
  }
}

getPageInfo
