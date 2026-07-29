import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyLogicOperationPackage where
  tNorm : ℝ → ℝ → ℝ
  tConorm : ℝ → ℝ → ℝ
  negation : ℝ → ℝ
  tNormAssociative : ∀ a b c, tNorm (tNorm a b) c = tNorm a (tNorm b c)
  tNormCommutative : ∀ a b, tNorm a b = tNorm b a
  tNormMonotone : ∀ a b c, a ≤ b → tNorm a c ≤ tNorm b c
  tNormOneNeutral : ∀ a, tNorm a 1 = a
  tConormAssociative : ∀ a b c, tConorm (tConorm a b) c = tConorm a (tConorm b c)
  tConormCommutative : ∀ a b, tConorm a b = tConorm b a
  tConormMonotone : ∀ a b c, a ≤ b → tConorm a c ≤ tConorm b c
  tConormZeroNeutral : ∀ a, tConorm a 0 = a
  negationInvolutive : ∀ a, negation (negation a) = a
  negationOrderReversing : ∀ a b, a ≤ b → negation b ≤ negation a
  deMorganLaws : ∀ a b, negation (tNorm a b) = tConorm (negation a) (negation b) ∧
                        negation (tConorm a b) = tNorm (negation a) (negation b)
  tNormTerm : tNormAssociative ∧ tNormCommutative ∧ tNormMonotone ∧ tNormOneNeutral
  tConormTerm : tConormAssociative ∧ tConormCommutative ∧ tConormMonotone ∧ tConormZeroNeutral
  negationTerm : negationInvolutive ∧ negationOrderReversing
  deMorganTerm : deMorganLaws

structure FuzzyLogicOperationEvidence (L : FuzzyLogicOperationPackage) where
  tNormClosed : L.tNormAssociative ∧ L.tNormCommutative ∧ L.tNormMonotone ∧ L.tNormOneNeutral
  tConormClosed : L.tConormAssociative ∧ L.tConormCommutative ∧ L.tConormMonotone ∧ L.tConormZeroNeutral
  negationClosed : L.negationInvolutive ∧ L.negationOrderReversing
  deMorganClosed : L.deMorganLaws

def FuzzyLogicOperationClosed (L : FuzzyLogicOperationPackage) : Prop :=
  L.tNormAssociative ∧ L.tNormCommutative ∧ L.tNormMonotone ∧ L.tNormOneNeutral ∧
  L.tConormAssociative ∧ L.tConormCommutative ∧ L.tConormMonotone ∧ L.tConormZeroNeutral ∧
  L.negationInvolutive ∧ L.negationOrderReversing ∧ L.deMorganLaws

theorem fuzzy_logic_operation_closed_from_evidence (L : FuzzyLogicOperationPackage)
    (E : FuzzyLogicOperationEvidence L) : FuzzyLogicOperationClosed L :=
  And.intro (And.intro (And.intro E.tNormClosed.1 E.tNormClosed.2.1)
    (And.intro E.tNormClosed.2.2.1 E.tNormClosed.2.2.2))
    (And.intro (And.intro (And.intro E.tConormClosed.1 E.tConormClosed.2.1)
      (And.intro E.tConormClosed.2.2.1 E.tConormClosed.2.2.2))
      (And.intro (And.intro E.negationClosed.1 E.negationClosed.2)
        E.deMorganClosed))

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse