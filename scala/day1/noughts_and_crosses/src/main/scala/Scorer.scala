class Scorer(val board: String) {
  class Line(cells: List[Char]) {
    def allNoughts() = cells.forall(c => c == 'O')
    def allCrosses() = cells.forall(c => c == 'X')
  }

  def topRow() = new Line(List(board(0), board(1), board(2)))
  def middleRow() = new Line(List(board(4), board(5), board(6)))
  def bottomRow() = new Line(List(board(8), board(9), board(10)))

  def leftColumn() = new Line(List(board(0), board(4), board(8)))
  def middleColumn() = new Line(List(board(1), board(5), board(9)))
  def rightColumn() = new Line(List(board(2), board(6), board(10)))

  def upwardDiagonal() = new Line(List(board(8), board(5), board(2)))
  def downwardDiagonal() = new Line(List(board(0), board(5), board(10)))

  def lines() = List(topRow, middleRow, bottomRow,
                     leftColumn, middleColumn, rightColumn,
                     upwardDiagonal, downwardDiagonal)

  def finished: Boolean = board.contains("O") || board.contains("X")

  def winner: String = {
    if(lines.exists(l => l allNoughts())) {
      "noughts"
    } else if(lines.exists(l => l allCrosses())) {
      "crosses"
    } else {
      "no-one"
    }
  }
}
