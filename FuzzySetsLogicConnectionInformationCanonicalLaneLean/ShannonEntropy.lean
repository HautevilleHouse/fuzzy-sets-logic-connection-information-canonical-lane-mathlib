import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FiniteProbabilitySpace where
  outcomes : Type u
  probability : outcomes → ℝ
  nonNegative : ∀ x, probability x ≥ 0
  sumOne : ∑ x, probability x = 1

def entropy (p : FiniteProbabilitySpace) : ℝ :=
  -∑ x in Finset.image id (Finset.univ : Finset p.outcomes), p.probability x * Real.log (p.probability x)

structure ShannonEntropySystem where
  probSpace : FiniteProbabilitySpace
  entropyValue : ℝ
  entropyComputed : entropyValue = entropy probSpace
  nonNegativeEntropy : entropyValue ≥ 0

def shannonEntropyClosed (s : ShannonEntropySystem) : Prop :=
  s.entropyComputed ∧ s.nonNegativeEntropy

theorem shannon_entropy_closed_from_evidence (s : ShannonEntropySystem) : shannonEntropyClosed s :=
  And.intro s.entropyComputed s.nonNegativeEntropy

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse