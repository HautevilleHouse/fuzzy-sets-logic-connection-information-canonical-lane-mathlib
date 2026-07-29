import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure SourceCodingTheoremPackage where
  source : ProbabilityInformationSource
  optimalCodeLength : ℝ
  achievesShannonBound : Prop
  averageCodeLengthCloseToEntropy : Prop

structure SourceCodingTheoremEvidence (S : SourceCodingTheoremPackage) where
  optimalCodeLengthNonnegative : S.optimalCodeLength ≥ 0
  achievesShannonBoundClosed : S.achievesShannonBound
  averageCodeLengthCloseToEntropyClosed : S.averageCodeLengthCloseToEntropy

def SourceCodingTheoremPackageClosed (S : SourceCodingTheoremPackage) : Prop :=
  S.optimalCodeLength ≥ 0 ∧ S.achievesShannonBound ∧ S.averageCodeLengthCloseToEntropy

theorem source_coding_theorem_package_closed_from_evidence (S : SourceCodingTheoremPackage) (E : SourceCodingTheoremEvidence S) : SourceCodingTheoremPackageClosed S := by
  exact And.intro E.optimalCodeLengthNonnegative (And.intro E.achievesShannonBoundClosed E.averageCodeLengthCloseToEntropyClosed)

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse