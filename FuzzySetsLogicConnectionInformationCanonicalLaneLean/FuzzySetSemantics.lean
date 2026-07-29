import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyMembershipFunction where
  carrierType : Type u
  membershipDegree : carrierType → ℝ
  membershipRange : ∀ x, membershipDegree x ∈ Set.Icc (0 : ℝ) 1

def fuzzyMembershipClosed (f : FuzzyMembershipFunction) : Prop :=
  ∀ x, f.membershipDegree x ∈ Set.Icc (0 : ℝ) 1

theorem fuzzy_membership_range_holds (f : FuzzyMembershipFunction) : fuzzyMembershipClosed f :=
  f.membershipRange

structure FuzzySet where
  carrier : Type u
  membership : FuzzyMembershipFunction
  fuzzySetClosed : fuzzyMembershipClosed membership

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse