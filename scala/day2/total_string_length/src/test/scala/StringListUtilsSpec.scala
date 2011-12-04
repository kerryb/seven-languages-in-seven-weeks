import org.scalatest.Spec
import org.scalatest.matchers.ShouldMatchers

class StringListUtilsSpec extends Spec with ShouldMatchers {
  describe("StringListUtils") {
    describe("totalLength") {
      describe("for an empty list") {
        it("is zero") {
          StringListUtils.totalLength(List()) should equal (0)
        }
      }
    }
  }
}
