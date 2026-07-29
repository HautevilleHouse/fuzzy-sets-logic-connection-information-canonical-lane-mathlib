import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure ChannelCapacityPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : inputAlphabet → outputAlphabet → ℝ
  capacity : ℝ
  satisfiesDataProcessingInequality : Prop
  achievesCapacity : Prop

structure ChannelCapacityEvidence (C : ChannelCapacityPackage) where
  transitionMatrixStochastic : ∀ x : C.inputAlphabet, ∑' (y : C.outputAlphabet), C.transitionMatrix x y = 1
  transitionMatrixNonnegative : ∀ x : C.inputAlphabet, ∀ y : C.outputAlphabet, C.transitionMatrix x y ≥ 0
  capacityNonnegative : C.capacity ≥ 0
  satisfiesDataProcessingInequalityClosed : C.satisfiesDataProcessingInequality
  achievesCapacityClosed : C.achievesCapacity

def ChannelCapacityPackageClosed (C : ChannelCapacityPackage) : Prop :=
  (∀ x : C.inputAlphabet, ∑' (y : C.outputAlphabet), C.transitionMatrix x y = 1) ∧
  (∀ x : C.inputAlphabet, ∀ y : C.outputAlphabet, C.transitionMatrix x y ≥ 0) ∧
  C.capacity ≥ 0 ∧ C.satisfiesDataProcessingInequality ∧ C.achievesCapacity

theorem channel_capacity_package_closed_from_evidence (C : ChannelCapacityPackage) (E : ChannelCapacityEvidence C) : ChannelCapacityPackageClosed C := by
  exact And.intro E.transitionMatrixStochastic (And.intro E.transitionMatrixNonnegative (And.intro E.capacityNonnegative (And.intro E.satisfiesDataProcessingInequalityClosed E.achievesCapacityClosed)))

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse