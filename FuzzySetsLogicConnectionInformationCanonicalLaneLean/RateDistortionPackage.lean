import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure RateDistortionPackage where
  sourceAlphabet : Type u
  reproductionAlphabet : Type v
  distortionMeasure : sourceAlphabet → reproductionAlphabet → ℝ
  rateDistortionFunction : ℝ → ℝ
  achievesOptimal : Prop

structure RateDistortionEvidence (R : RateDistortionPackage) where
  distortionMeasureNonnegative : ∀ x : R.sourceAlphabet, ∀ y : R.reproductionAlphabet, R.distortionMeasure x y ≥ 0
  rateDistortionFunctionNondecreasing : ∀ r1 r2 : ℝ, r1 ≤ r2 → R.rateDistortionFunction r1 ≥ R.rateDistortionFunction r2
  achievesOptimalClosed : R.achievesOptimal

def RateDistortionPackageClosed (R : RateDistortionPackage) : Prop :=
  (∀ x : R.sourceAlphabet, ∀ y : R.reproductionAlphabet, R.distortionMeasure x y ≥ 0) ∧
  (∀ r1 r2 : ℝ, r1 ≤ r2 → R.rateDistortionFunction r1 ≥ R.rateDistortionFunction r2) ∧
  R.achievesOptimal

theorem rate_distortion_package_closed_from_evidence (R : RateDistortionPackage) (E : RateDistortionEvidence R) : RateDistortionPackageClosed R := by
  exact And.intro E.distortionMeasureNonnegative (And.intro E.rateDistortionFunctionNondecreasing E.achievesOptimalClosed)

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse