import java.lang.Integer
import scala.io._
import scala.actors._
import scala.util.matching.Regex
import Actor._

class PageInfo(val size: Integer, val links: List[String])

object PageLoader {
  val LinkMatcher = """<a\s[^>]*href\s*=\s*["']([^"']*)""".r

  def getPageInfo(url : String) = {
    val page = Source.fromURL(url).mkString
    new PageInfo(page.length, getLinks(page))
  }

  private def getLinks(page: String) = {
    LinkMatcher.findAllIn(page).matchData.map (m => m.group(1)).toList
  }
}

val urls = List("http://www.amazon.com/",
  "http://www.twitter.com/",
  "http://www.google.com/",
  "http://www.cnn.com/" )

def run() = {
  val caller = self
  var messagesRemaining = urls.size

  for (url <- urls) {
    actor { caller ! (url, PageLoader.getPageInfo(url)) }
  }

  while (messagesRemaining > 0) {
    receive {
      case (url, info: PageInfo) =>
        messagesRemaining -= 1
        println("%60s size:  %d bytes".format(url, info.size))
        println("%60s links: %d".format(url, info.links.size))
    }
  }
}

run
