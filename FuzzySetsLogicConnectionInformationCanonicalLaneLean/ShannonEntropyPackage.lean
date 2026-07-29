import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure ShannonEntropyPackage where
  source : ProbabilityInformationSource
  entropyFunctional : (source.alphabet → ℝ) → ℝ
  jointEntropyFunctional : (source.alphabet → source.alphabet → ℝ) → ℝ
  conditionalEntropyFunctional : (source.alphabet → source.alphabet → ℝ) → ℝ
  mutualInformationFunctional : (source.alphabet → source.alphabet → ℝ) → ℝ

def ShannonEntropyPackageClosed (S : ShannonEntropyPackage) : Prop :=
  ProbabilityInformationSourceClosed S.source ∧
  (∀ p : S.source.alphabet → ℝ, S.entropyFunctional p ≥ 0) ∧
  (∀ p : S.source.alphabet → ℝ, S.entropyFunctional p = 0 ↔ (∃ x0, p x0 = 1 ∧ ∀ x ≠ x0, p x = 0))

theorem shannon_entropy_package_closed_from_evidence (S : ShannonEntropyPackage) (hSrc : ProbabilityInformationSourceClosed S.source) (hNonneg : ∀ p : S.source.alphabet → ℝ, S.entropyFunctional p ≥ 0) (hZero : ∀ p : S.source.alphabet → ℝ, S.entropyFunctional p = 0 ↔ (∃ x0, p x0 = 1 ∧ ∀ x ≠ x0, p x = 0)) : ShannonEntropyPackageClosed S := by
  exact And.intro hSrc (And.intro hNonneg hZero)

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse