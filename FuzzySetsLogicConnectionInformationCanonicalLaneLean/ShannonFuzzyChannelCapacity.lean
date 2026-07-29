import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyChannelCapacityPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  fuzzyTransitionMatrix : inputAlphabet → outputAlphabet → ℝ
  totalProbabilityCondition : Prop
  totalProbabilityConditionClosed : totalProbabilityCondition
  capacityFunctional : Prop
  capacityFunctionalDefined : capacityFunctional

structure FuzzyChannelCapacityEvidence (P : FuzzyChannelCapacityPackage) where
  totalProbabilityConditionClosed : P.totalProbabilityCondition
  capacityFunctionalDefinedClosed : P.capacityFunctionalDefined

def FuzzyChannelCapacityClosed (P : FuzzyChannelCapacityPackage) : Prop :=
  P.totalProbabilityCondition ∧ P.capacityFunctionalDefined

theorem fuzzy_channel_capacity_closed_from_evidence
    (P : FuzzyChannelCapacityPackage) (E : FuzzyChannelCapacityEvidence P) :
    FuzzyChannelCapacityClosed P := by
  exact And.intro E.totalProbabilityConditionClosed E.capacityFunctionalDefinedClosed

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
