import org.scalatest.Spec
import org.scalatest.matchers.ShouldMatchers

class StringListUtilsSpec extends Spec with ShouldMatchers {
  describe  ("StringListUtils") {
    describe ("totalLength") {
      describe ("for an empty list") {
        it ("is zero") {
          StringListUtils.totalLength(List()) should equal (0)
        }
      }

      describe ("for an empty string") {
        it ("is zero") {
          StringListUtils.totalLength(List("")) should equal (0)
        }
      }

      describe ("for all empty strings") {
        it ("is zero") {
          StringListUtils.totalLength(List("", "", "")) should equal (0)
        }
      }

      describe ("for a single string") {
        it ("is the length of the string") {
          StringListUtils.totalLength(List("foo")) should equal (3)
        }
      }

      describe ("for multiple strings") {
        it ("is the total length of the strings") {
          StringListUtils.totalLength(List("foo", "bar", "quuz")) should equal (10)
        }
      }
    }
  }
}
