object StringListUtils {
  def totalLength(strings: List[String]): Int = {
    strings.foldLeft(0)((sum, str) => sum + str.length)
  }
}
