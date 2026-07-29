import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzySetInformationPackage where
  fuzzyEntropy : (ℝ → ℝ) → ℝ
  entropyNonnegative : ∀ μ, fuzzyEntropy μ ≥ 0
  entropyZeroForCrisp : ∀ μ, (∀ x, μ x ∈ {0,1}) → fuzzyEntropy μ = 0
  entropyMaximized : ∃ μ, fuzzyEntropy μ = 1
  entropySubadditive : ∀ μ ν, fuzzyEntropy (λ x => max (μ x) (ν x)) ≤ fuzzyEntropy μ + fuzzyEntropy ν
  entropyTerm : entropyNonnegative ∧ entropyZeroForCrisp ∧ entropyMaximized ∧ entropySubadditive

structure FuzzySetInformationEvidence (I : FuzzySetInformationPackage) where
  entropyNonnegativeClosed : I.entropyNonnegative
  entropyZeroForCrispClosed : I.entropyZeroForCrisp
  entropyMaximizedClosed : I.entropyMaximized
  entropySubadditiveClosed : I.entropySubadditive

def FuzzySetInformationClosed (I : FuzzySetInformationPackage) : Prop :=
  I.entropyNonnegative ∧ I.entropyZeroForCrisp ∧ I.entropyMaximized ∧ I.entropySubadditive

theorem fuzzy_set_information_closed_from_evidence (I : FuzzySetInformationPackage)
    (E : FuzzySetInformationEvidence I) : FuzzySetInformationClosed I :=
  And.intro E.entropyNonnegativeClosed
    (And.intro E.entropyZeroForCrispClosed
      (And.intro E.entropyMaximizedClosed E.entropySubadditiveClosed))

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse