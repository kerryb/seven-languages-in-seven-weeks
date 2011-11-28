class Scorer(val board: String) {
  def finished: Boolean = board contains("O")

  def winner: String = {
    if(board contains("O")) {
      "noughts"
    } else {
      "no-one"
    }
  }
}
