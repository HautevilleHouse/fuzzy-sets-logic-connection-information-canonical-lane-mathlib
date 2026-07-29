import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzySetsLogicConnectionInformationCanonicalLaneLean.FuzzyLogicConnective

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyRelationPackage where
  domain : Type u
  codomain : Type v
  relation : domain → codomain → ℝ
  compositionOperator : (domain → codomain → ℝ) → (codomain → domain → ℝ) → (domain → domain → ℝ)
  supMinComposition : (domain → codomain → ℝ) → (codomain → domain → ℝ) → (domain → domain → ℝ)

structure FuzzyRelationEvidence (R : FuzzyRelationPackage) where
  relationClosed : ∀ x : R.domain, ∀ y : R.codomain, R.relation x y ∈ Set.Icc (0 : ℝ) 1
  compositionClosed : ∀ (R1 : R.domain → R.codomain → ℝ) (R2 : R.codomain → R.domain → ℝ),
    (∀ x y, R1 x y ∈ Set.Icc (0 : ℝ) 1) → (∀ y z, R2 y z ∈ Set.Icc (0 : ℝ) 1) →
    (∀ x z, R.compositionOperator R1 R2 x z ∈ Set.Icc (0 : ℝ) 1)

def FuzzyRelationClosed (R : FuzzyRelationPackage) : Prop :=
  (∀ x : R.domain, ∀ y : R.codomain, R.relation x y ∈ Set.Icc (0 : ℝ) 1) ∧
  (∀ (R1 : R.domain → R.codomain → ℝ) (R2 : R.codomain → R.domain → ℝ),
    (∀ x y, R1 x y ∈ Set.Icc (0 : ℝ) 1) → (∀ y z, R2 y z ∈ Set.Icc (0 : ℝ) 1) →
    (∀ x z, R.compositionOperator R1 R2 x z ∈ Set.Icc (0 : ℝ) 1))

theorem fuzzy_relation_closed_from_evidence
    (R : FuzzyRelationPackage) (E : FuzzyRelationEvidence R) :
    FuzzyRelationClosed R := by
  exact And.intro E.relationClosed E.compositionClosed

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
