trait Censor {
  val lines = io.Source.fromFile("replacements.txt").getLines.toList
  val pairs = lines.map(l => l.split(" "))
  val replacements = Map() ++ (pairs map (p => (p.head, p.last)))

  def content : String

  def clean = {
    replacements.foldLeft(content){ case (a, (k, v)) => a.replaceAll(k, v) }
  }
}
