import org.scalatest.Spec
import org.scalatest.matchers.ShouldMatchers

class DirtyString(val content: String) extends Censor

class CensorSpec extends Spec with ShouldMatchers {
  describe ("Censor") {
    it ("censors curse words") {
      val string = new DirtyString("Well shoot, this is a darn nuisance")
      string.clean should equal ("Well pucky, this is a beans nuisance")
    }
  }
}
