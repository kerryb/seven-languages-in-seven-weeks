import org.specs2.mutable._

class ScorerSpec extends Specification {
   "An empty board is an unfinished game" in {
     new Scorer("---------").finished must beFalse
   }
}
