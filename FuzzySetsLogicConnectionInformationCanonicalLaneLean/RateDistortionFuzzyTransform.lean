import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure RateDistortionFuzzyTransformPackage where
  sourceAlphabet : Type u
  reproductionAlphabet : Type v
  fuzzyDistortionMeasure : sourceAlphabet → reproductionAlphabet → ℝ
  rateDistortionFunction : ℝ → ℝ
  rateDistortionFunctionDefined : Prop
  distortionBounded : Prop
  rateDistortionFunctionDefinedClosed : rateDistortionFunctionDefined
  distortionBoundedClosed : distortionBounded

structure RateDistortionFuzzyTransformEvidence (P : RateDistortionFuzzyTransformPackage) where
  rateDistortionFunctionDefinedClosed : P.rateDistortionFunctionDefined
  distortionBoundedClosed : P.distortionBounded

def RateDistortionFuzzyTransformClosed (P : RateDistortionFuzzyTransformPackage) : Prop :=
  P.rateDistortionFunctionDefined ∧ P.distortionBounded

theorem rate_distortion_fuzzy_transform_closed_from_evidence
    (P : RateDistortionFuzzyTransformPackage) (E : RateDistortionFuzzyTransformEvidence P) :
    RateDistortionFuzzyTransformClosed P := by
  exact And.intro E.rateDistortionFunctionDefinedClosed E.distortionBoundedClosed

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
