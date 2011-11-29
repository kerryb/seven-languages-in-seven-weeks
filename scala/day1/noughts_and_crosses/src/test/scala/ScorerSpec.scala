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

   "A board with a top row of Xs is a finished game" in new topRowXs {
     scorer.finished must beTrue
   }

   "A board with a top row of Xs is won by crosses" in new topRowXs {
     scorer.winner must_== "crosses"
   }

   "A board with a middle row of Xs is a finished game" in new middleRowXs {
     scorer.finished must beTrue
   }

   "A board with a middle row of Xs is won by crosses" in new middleRowXs {
     scorer.winner must_== "crosses"
   }

   "A board with a bottom row of Xs is a finished game" in new bottomRowXs {
     scorer.finished must beTrue
   }

   "A board with a bottom row of Xs is won by crosses" in new bottomRowXs {
     scorer.winner must_== "crosses"
   }

   "A board with a left column of Xs is a finished game" in new leftColumnXs {
     scorer.finished must beTrue
   }

   "A board with a left column of Xs is won by crosses" in new leftColumnXs {
     scorer.winner must_== "crosses"
   }

   "A board with a middle column of Xs is a finished game" in new middleColumnXs {
     scorer.finished must beTrue
   }

   "A board with a middle column of Xs is won by crosses" in new middleColumnXs {
     scorer.winner must_== "crosses"
   }

   "A board with a right column of Xs is a finished game" in new rightColumnXs {
     scorer.finished must beTrue
   }

   "A board with a right column of Xs is won by crosses" in new rightColumnXs {
     scorer.winner must_== "crosses"
   }

   "A board with an upward diagonal of Xs is a finished game" in new upwardDiagonalXs {
     scorer.finished must beTrue
   }

   "A board with an upward diagonal of Xs is won by crosses" in new upwardDiagonalXs {
     scorer.winner must_== "crosses"
   }

   "A board with a downward diagonal of Xs is a finished game" in new downwardDiagonalXs {
     scorer.finished must beTrue
   }

   "A board with a downward diagonal of Xs is won by crosses" in new downwardDiagonalXs {
     scorer.winner must_== "crosses"
   }

   "An incomplete board with no lines is an unfinished game" in new noLinesIncomplete {
     scorer.finished must beFalse
   }

   "An incomplete board with no lines is won by no-one" in new noLinesIncomplete {
     scorer.winner must_== "no-one"
   }

   "A completed board with no lines is a finished game" in new noLinesComplete {
     scorer.finished must beTrue
   }

   "A completed board with no lines is won by no-one" in new noLinesComplete {
     scorer.winner must_== "no-one"
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

trait topRowXs extends Scope {
  val scorer = new Scorer("XXX OO- ---")
}

trait middleRowXs extends Scope {
  val scorer = new Scorer("OO- XXX ---")
}

trait bottomRowXs extends Scope {
  val scorer = new Scorer("OO- XXX ---")
}

trait leftColumnXs extends Scope {
  val scorer = new Scorer("XO- XO- X--")
}

trait middleColumnXs extends Scope {
  val scorer = new Scorer("OX- OX- -X-")
}

trait rightColumnXs extends Scope {
  val scorer = new Scorer("O-X O-X --X")
}

trait upwardDiagonalXs extends Scope {
  val scorer = new Scorer("O-X OX- X--")
}

trait downwardDiagonalXs extends Scope {
  val scorer = new Scorer("X-O -XO --X")
}

trait noLinesIncomplete extends Scope {
  val scorer = new Scorer("XXO OO- ---")
}

trait noLinesComplete extends Scope {
  val scorer = new Scorer("XXO OOX XXO")
}
