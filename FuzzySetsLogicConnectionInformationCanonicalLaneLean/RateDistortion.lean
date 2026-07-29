import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure DistortionMeasure (X Y : Type u) where
  d : X → Y → ℝ
  nonnegative : ∀ x y, d x y ≥ 0

structure RateDistortionFunction (X : DiscreteProbabilitySpace Ω) (D : DistortionMeasure Ω Ω') where
  R : ℝ → ℝ
  formula : ∀ Δ, R Δ = min_{p(y|x) : E[d(X,Y)] ≤ Δ} I(X;Y)

structure RateDistortionEvidence (X : DiscreteProbabilitySpace Ω) (D : DistortionMeasure Ω Ω') (RDF : RateDistortionFunction X D) where
  formulaClosed : RDF.formula

def RateDistortionClosed (X : DiscreteProbabilitySpace Ω) (D : DistortionMeasure Ω Ω') (RDF : RateDistortionFunction X D) : Prop :=
  RDF.formula

theorem rate_distortion_closed_from_evidence
    (X : DiscreteProbabilitySpace Ω) (D : DistortionMeasure Ω Ω') (RDF : RateDistortionFunction X D) (Ev : RateDistortionEvidence X D RDF) :
    RateDistortionClosed X D RDF := by
  exact Ev.formulaClosed

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse