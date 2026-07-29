import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

def ConstrainedFuzzySetClosure (A : AdmissibleClass) : Prop :=
  fuzzySetBridgeClosed A ∧ gateClosed A

theorem constrained_fuzzy_set_endgame (A : AdmissibleClass) :
    ConstrainedFuzzySetClosure A :=
  And.intro (fuzzy_set_bridge_from_admissible_class A) (gate_from_admissible_class A)

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse