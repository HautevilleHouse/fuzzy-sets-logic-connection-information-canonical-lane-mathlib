import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzySetMembershipPackage where
  universe : Type u
  membershipFunction : universe → ℝ
  rangeInUnitInterval : ∀ x, membershipFunction x ∈ Set.Icc (0 : ℝ) 1
  fuzzySetDefined : Prop
  fuzzySetDefinedTerm : fuzzySetDefined

structure FuzzySetMembershipEvidence (M : FuzzySetMembershipPackage) where
  fuzzySetDefinedClosed : M.fuzzySetDefined

def FuzzySetMembershipClosed (M : FuzzySetMembershipPackage) : Prop :=
  M.fuzzySetDefined

theorem fuzzy_set_membership_closed_from_evidence (M : FuzzySetMembershipPackage)
    (E : FuzzySetMembershipEvidence M) : FuzzySetMembershipClosed M :=
  E.fuzzySetDefinedClosed

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse