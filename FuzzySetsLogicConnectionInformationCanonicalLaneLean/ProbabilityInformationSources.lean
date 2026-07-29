import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure ProbabilityInformationSource where
  alphabet : Type u
  sourceDistribution : alphabet → ℝ
  finiteEntropy : Prop
  satisfiesKraftInequality : Prop

structure ProbabilityInformationSourceEvidence (P : ProbabilityInformationSource) where
  sourceDistributionNonnegative : ∀ x : P.alphabet, P.sourceDistribution x ≥ 0
  totalProbabilityOne : ∑' (x : P.alphabet), P.sourceDistribution x = 1
  finiteEntropyClosed : P.finiteEntropy
  satisfiesKraftInequalityClosed : P.satisfiesKraftInequality

def ProbabilityInformationSourceClosed (P : ProbabilityInformationSource) : Prop :=
  (∀ x : P.alphabet, P.sourceDistribution x ≥ 0) ∧
  ∑' (x : P.alphabet), P.sourceDistribution x = 1 ∧
  P.finiteEntropy ∧ P.satisfiesKraftInequality

theorem probability_information_source_closed_from_evidence (P : ProbabilityInformationSource) (E : ProbabilityInformationSourceEvidence P) : ProbabilityInformationSourceClosed P := by
  exact And.intro E.sourceDistributionNonnegative (And.intro E.totalProbabilityOne (And.intro E.finiteEntropyClosed E.satisfiesKraftInequalityClosed))

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse