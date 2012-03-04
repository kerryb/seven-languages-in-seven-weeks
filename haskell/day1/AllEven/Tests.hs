import Test.QuickCheck
import Data.List
import AllEven.FromBook

prop_selected_all_even xs = all even (allEven xs)

prop_rejected_all_odd xs = all odd (xs \\ allEven xs)
