import org.specs2.mutable._
import org.specs2.specification.Scope

class ScorerSpec extends Specification {
   "An empty board is an unfinished game" in new emptyBoard {
     scorer.finished must beFalse
   }

   "An empty board has no winner" in new emptyBoard {
     scorer.winner must_== "no-one"
   }
}

trait emptyBoard extends Scope {
  val scorer = new Scorer("---------")
}
