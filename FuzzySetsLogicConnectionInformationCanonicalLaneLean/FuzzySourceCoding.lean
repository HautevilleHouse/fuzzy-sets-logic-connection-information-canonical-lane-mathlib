import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzySourceCodingPackage where
  sourceAlphabet : Type u
  fuzzyDistribution : sourceAlphabet → ℝ
  codewordLength : sourceAlphabet → ℕ
  prefixCondition : Prop
  expectedLengthFinite : Prop
  prefixConditionClosed : prefixCondition
  expectedLengthFiniteClosed : expectedLengthFinite

structure FuzzySourceCodingEvidence (P : FuzzySourceCodingPackage) where
  prefixConditionClosed : P.prefixCondition
  expectedLengthFiniteClosed : P.expectedLengthFinite

def FuzzySourceCodingClosed (P : FuzzySourceCodingPackage) : Prop :=
  P.prefixCondition ∧ P.expectedLengthFinite

theorem fuzzy_source_coding_closed_from_evidence
    (P : FuzzySourceCodingPackage) (E : FuzzySourceCodingEvidence P) :
    FuzzySourceCodingClosed P := by
  exact And.intro E.prefixConditionClosed E.expectedLengthFiniteClosed

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
