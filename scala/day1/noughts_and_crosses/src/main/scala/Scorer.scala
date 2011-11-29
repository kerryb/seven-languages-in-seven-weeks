class Scorer(val board: String) {
  class Line(val first: Char, val second: Char, val third: Char) {
    def allNoughts() = first == 'O' && second == 'O' && third == 'O'
    def allCrosses() = first == 'X' && second == 'X' && third == 'X'
  }

  def topRow() = new Line(board(0), board(1), board(2))
  def middleRow() = new Line(board(4), board(5), board(6))
  def bottomRow() = new Line(board(8), board(9), board(10))

  def rows() = List(topRow, middleRow, bottomRow)

  def finished: Boolean = board.contains("O") || board.contains("X")

  def winner: String = {
    if(board contains("O")) {
      "noughts"
    } else {
      "no-one"
    }
  }
}
