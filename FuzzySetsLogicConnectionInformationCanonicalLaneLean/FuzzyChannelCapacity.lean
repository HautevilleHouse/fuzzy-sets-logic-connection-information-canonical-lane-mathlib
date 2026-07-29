import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzySetsLogicConnectionInformationCanonicalLaneLean.FuzzyInformationMeasure

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyChannelPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  channelMatrix : inputAlphabet → outputAlphabet → ℝ
  capacity : ℝ
  capacityIsSupremumOfMutualInformation : Prop

structure FuzzyChannelEvidence (C : FuzzyChannelPackage) where
  channelMatrixClosed : ∀ x : C.inputAlphabet, ∀ y : C.outputAlphabet, C.channelMatrix x y ∈ Set.Icc (0 : ℝ) 1
  capacityClosed : C.capacityIsSupremumOfMutualInformation

def FuzzyChannelClosed (C : FuzzyChannelPackage) : Prop :=
  (∀ x : C.inputAlphabet, ∀ y : C.outputAlphabet, C.channelMatrix x y ∈ Set.Icc (0 : ℝ) 1) ∧
  C.capacityIsSupremumOfMutualInformation

theorem fuzzy_channel_closed_from_evidence
    (C : FuzzyChannelPackage) (E : FuzzyChannelEvidence C) :
    FuzzyChannelClosed C := by
  exact And.intro E.channelMatrixClosed E.capacityClosed

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
