import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzySetsLogicConnectionInformationCanonicalLaneLean.FuzzySetMembership

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyLogicConnectivePackage where
  tNorm : ℝ → ℝ → ℝ
  tConorm : ℝ → ℝ → ℝ
  negation : ℝ → ℝ
  implication : ℝ → ℝ → ℝ
  tNormProperties : Prop
  tConormProperties : Prop
  negationProperties : Prop
  implicationProperties : Prop

structure FuzzyLogicConnectiveEvidence (C : FuzzyLogicConnectivePackage) where
  tNormClosed : C.tNormProperties
  tConormClosed : C.tConormProperties
  negationClosed : C.negationProperties
  implicationClosed : C.implicationProperties

def FuzzyLogicConnectiveClosed (C : FuzzyLogicConnectivePackage) : Prop :=
  C.tNormProperties ∧ C.tConormProperties ∧ C.negationProperties ∧ C.implicationProperties

theorem fuzzy_logic_connective_closed_from_evidence
    (C : FuzzyLogicConnectivePackage) (E : FuzzyLogicConnectiveEvidence C) :
    FuzzyLogicConnectiveClosed C := by
  exact And.intro E.tNormClosed (And.intro E.tConormClosed (And.intro E.negationClosed E.implicationClosed))

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
