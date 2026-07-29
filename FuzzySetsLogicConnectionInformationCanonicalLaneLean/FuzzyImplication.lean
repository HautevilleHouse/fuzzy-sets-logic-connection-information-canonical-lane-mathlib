import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzySetsLogicConnectionInformationCanonicalLaneLean.FuzzyLogicOperations

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyImplication where
  carrier : Type u
  imp : carrier → carrier → carrier
  boundaryCondition : ∀ x y, imp x y ≥ 0 ∧ imp x y ≤ 1
  monotonicity : ∀ x y z, x ≤ y → imp x z ≥ imp y z
  exchangePrinciple : ∀ x y z, imp x (imp y z) = imp y (imp x z)

def fuzzyImplicationClosed (f : FuzzyImplication) : Prop :=
  f.boundaryCondition ∧ f.monotonicity ∧ f.exchangePrinciple

theorem fuzzy_implication_closed_from_properties (f : FuzzyImplication) : fuzzyImplicationClosed f :=
  And.intro f.boundaryCondition (And.intro f.monotonicity f.exchangePrinciple)

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse