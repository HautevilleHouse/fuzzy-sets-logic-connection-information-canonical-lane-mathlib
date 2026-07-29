import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyMembershipEntropyPackage where
  universe : Type u
  membershipFunction : universe → ℝ
  entropyFunctional : universe → ℝ
  entropyFunctionalMonotonic : Prop
  entropyFunctionalConcave : Prop
  entropyFunctionalMonotonicClosed : entropyFunctionalMonotonic
  entropyFunctionalConcaveClosed : entropyFunctionalConcave

structure FuzzyMembershipEntropyEvidence (P : FuzzyMembershipEntropyPackage) where
  monotonicityClosed : P.entropyFunctionalMonotonic
  concavityClosed : P.entropyFunctionalConcave

def FuzzyMembershipEntropyClosed (P : FuzzyMembershipEntropyPackage) : Prop :=
  P.entropyFunctionalMonotonic ∧ P.entropyFunctionalConcave

theorem fuzzy_membership_entropy_closed_from_evidence
    (P : FuzzyMembershipEntropyPackage) (E : FuzzyMembershipEntropyEvidence P) :
    FuzzyMembershipEntropyClosed P := by
  exact And.intro E.monotonicityClosed E.concavityClosed

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
