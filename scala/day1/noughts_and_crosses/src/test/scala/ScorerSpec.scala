import org.specs2.mutable._
import org.specs2.specification.Scope

class ScorerSpec extends Specification {
   "An empty board is an unfinished game" in new emptyBoard {
     scorer.finished must beFalse
   }

   "An empty board has no winner" in new emptyBoard {
     scorer.winner must_== "no-one"
   }

   "A board with a top row of Os is a finished game" in new topRowOs {
     scorer.finished must beTrue
   }

   "A board with a top row of Os is won by noughts" in new topRowOs {
     scorer.winner must_== "noughts"
   }
}

trait emptyBoard extends Scope {
  val scorer = new Scorer("---------")
}

trait topRowOs extends Scope {
  val scorer = new Scorer("OOO------")
}
