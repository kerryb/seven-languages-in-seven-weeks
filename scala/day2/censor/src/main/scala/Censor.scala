trait Censor {
  val replacements = Map(
    "shoot" -> "pucky",
    "darn" -> "beans"
  )

  def content : String

  def clean = {
    replacements.foldLeft(content){ case (a, (k, v)) => a.replaceAll(k, v) }
  }
}
