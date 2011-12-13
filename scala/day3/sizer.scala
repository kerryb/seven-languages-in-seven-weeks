import scala.io._
import scala.actors._
import Actor._

case class PageSize(url: String, size: Double)

object PageLoader {
  def getPage(url : String) = Source.fromURL(url).mkString
}

val urls = List("http://www.amazon.com/",
  "http://www.twitter.com/",
  "http://www.google.com/",
  "http://www.cnn.com/" )

def getPageInfo() = {
  val caller = self

  for(url <- urls) {
    val page = PageLoader.getPage(url)
    actor { caller ! new PageSize(url, page.size) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case PageSize(url, size) =>
      println("Size for " + url + ": " + size)
    }
  }
}

getPageInfo
