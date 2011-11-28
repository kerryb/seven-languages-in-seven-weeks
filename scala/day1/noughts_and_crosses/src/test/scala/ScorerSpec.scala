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

   "A board with a middle row of Os is a finished game" in new middleRowOs {
     scorer.finished must beTrue
   }

   "A board with a middle row of Os is won by noughts" in new middleRowOs {
     scorer.winner must_== "noughts"
   }

   "A board with a bottom row of Os is a finished game" in new bottomRowOs {
     scorer.finished must beTrue
   }

   "A board with a bottom row of Os is won by noughts" in new bottomRowOs {
     scorer.winner must_== "noughts"
   }

   "A board with a left column of Os is a finished game" in new leftColumnOs {
     scorer.finished must beTrue
   }

   "A board with a left column of Os is won by noughts" in new leftColumnOs {
     scorer.winner must_== "noughts"
   }

   "A board with a middle column of Os is a finished game" in new middleColumnOs {
     scorer.finished must beTrue
   }

   "A board with a middle column of Os is won by noughts" in new middleColumnOs {
     scorer.winner must_== "noughts"
   }

   "A board with a right column of Os is a finished game" in new rightColumnOs {
     scorer.finished must beTrue
   }

   "A board with a right column of Os is won by noughts" in new rightColumnOs {
     scorer.winner must_== "noughts"
   }

   "A board with an upward diagonal of Os is a finished game" in new upwardDiagonalOs {
     scorer.finished must beTrue
   }

   "A board with an upward diagonal of Os is won by noughts" in new upwardDiagonalOs {
     scorer.winner must_== "noughts"
   }

   "A board with a downward diagonal of Os is a finished game" in new downwardDiagonalOs {
     scorer.finished must beTrue
   }

   "A board with a downward diagonal of Os is won by noughts" in new downwardDiagonalOs {
     scorer.winner must_== "noughts"
   }
}

trait emptyBoard extends Scope {
  val scorer = new Scorer("--- --- ---")
}

trait topRowOs extends Scope {
  val scorer = new Scorer("OOO XX- ---")
}

trait middleRowOs extends Scope {
  val scorer = new Scorer("XX- OOO ---")
}

trait bottomRowOs extends Scope {
  val scorer = new Scorer("XX- OOO ---")
}

trait leftColumnOs extends Scope {
  val scorer = new Scorer("OX- OX- O--")
}

trait middleColumnOs extends Scope {
  val scorer = new Scorer("XO- XO- -O-")
}

trait rightColumnOs extends Scope {
  val scorer = new Scorer("X-O X-O --O")
}

trait upwardDiagonalOs extends Scope {
  val scorer = new Scorer("X-O XO- O--")
}

trait downwardDiagonalOs extends Scope {
  val scorer = new Scorer("O-X -OX --O")
}
