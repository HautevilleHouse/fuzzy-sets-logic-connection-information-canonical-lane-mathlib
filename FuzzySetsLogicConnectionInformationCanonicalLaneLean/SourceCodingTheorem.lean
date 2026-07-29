import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzySetsLogicConnectionInformationCanonicalLaneLean.ShannonEntropy

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure SourceCoding where
  source : FiniteProbabilitySpace
  codeLength : source.outcomes → ℕ
  prefixFree : ∀ x y, x ≠ y → (codeLength x = codeLength y) ∨ (not (prefix (code x) (code y)))
  where prefix (a b : List ℕ) : Prop := a = b.take (a.length)

def expectedLength (sc : SourceCoding) : ℝ :=
  ∑ x, sc.source.probability x * (sc.codeLength x : ℝ)

theorem source_coding_theorem_lower_bound (sc : SourceCoding) :
    expectedLength sc ≥ entropy sc.source :=
  by
    -- This would require more detailed proof; here we assume it holds.
    sorry

theorem source_coding_theorem_upper_bound (sc : SourceCoding) :
    ∃ sc' : SourceCoding, sc'.source = sc.source ∧ expectedLength sc' < entropy sc.source + 1 :=
  by
    sorry

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse