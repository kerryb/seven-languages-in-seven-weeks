import java.lang.Integer
import scala.io._
import scala.actors._
import Actor._

class PageInfo(val size: Integer)

object PageLoader {
  def getPageInfo(url : String) = {
    val page = Source.fromURL(url)
    new PageInfo(page.mkString.length)
  }
}

val urls = List("http://www.amazon.com/",
  "http://www.twitter.com/",
  "http://www.google.com/",
  "http://www.cnn.com/" )

def run() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getPageInfo(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, info: PageInfo) =>
      println("Size for " + url + ": " + info.size)
    }
  }
}

run
