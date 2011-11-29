class Scorer(board: String) {
  private class Line(cells: List[Char]) {
    def allNoughts() = cells.forall(c => c == 'O')
    def allCrosses() = cells.forall(c => c == 'X')
  }

  private def topRow() = new Line(List(board(0), board(1), board(2)))
  private def middleRow() = new Line(List(board(4), board(5), board(6)))
  private def bottomRow() = new Line(List(board(8), board(9), board(10)))

  private def leftColumn() = new Line(List(board(0), board(4), board(8)))
  private def middleColumn() = new Line(List(board(1), board(5), board(9)))
  private def rightColumn() = new Line(List(board(2), board(6), board(10)))

  private def upwardDiagonal() = new Line(List(board(8), board(5), board(2)))
  private def downwardDiagonal() = new Line(List(board(0), board(5), board(10)))

  private def lines() = List(topRow, middleRow, bottomRow,
                     leftColumn, middleColumn, rightColumn,
                     upwardDiagonal, downwardDiagonal)

  private def noughtsWin() = lines.exists(l => l allNoughts)
  private def crossesWin() = lines.exists(l => l allCrosses)
  private def tie() = ! board.contains("-")

  def finished: Boolean = noughtsWin || crossesWin || tie

  def winner: String = {
    if(noughtsWin) {
      "noughts"
    } else if(crossesWin) {
      "crosses"
    } else {
      "no-one"
    }
  }
}
