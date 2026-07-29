import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzySetsLogicConnectionInformationCanonicalLaneLean.FuzzySetMembership

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyInformationMeasurePackage where
  fuzzyEntropy : (ℝ → ℝ) → ℝ
  fuzzyMutualInformation : (ℝ → ℝ) → (ℝ → ℝ) → ℝ
  fuzzyConditionalEntropy : (ℝ → ℝ) → (ℝ → ℝ) → ℝ
  entropyProperties : Prop
  mutualInformationProperties : Prop
  conditionalEntropyProperties : Prop

structure FuzzyInformationMeasureEvidence (M : FuzzyInformationMeasurePackage) where
  entropyClosed : M.entropyProperties
  mutualInformationClosed : M.mutualInformationProperties
  conditionalEntropyClosed : M.conditionalEntropyProperties

def FuzzyInformationMeasureClosed (M : FuzzyInformationMeasurePackage) : Prop :=
  M.entropyProperties ∧ M.mutualInformationProperties ∧ M.conditionalEntropyProperties

theorem fuzzy_information_measure_closed_from_evidence
    (M : FuzzyInformationMeasurePackage) (E : FuzzyInformationMeasureEvidence M) :
    FuzzyInformationMeasureClosed M := by
  exact And.intro E.entropyClosed (And.intro E.mutualInformationClosed E.conditionalEntropyClosed)

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
