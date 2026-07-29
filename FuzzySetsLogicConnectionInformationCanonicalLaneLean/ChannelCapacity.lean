import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzySetsLogicConnectionInformationCanonicalLaneLean.ShannonEntropy

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure DiscreteChannel where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transition : inputAlphabet → outputAlphabet → ℝ
  transitionProb : ∀ i, (∑ o, transition i o) = 1 ∧ ∀ o, transition i o ≥ 0
  transitionNonNeg : ∀ i o, transition i o ≥ 0 := by
    intro i o; exact (transitionProb i).2 o

def mutualInformation (p : inputAlphabet → ℝ) (channel : DiscreteChannel) : ℝ :=
  ∑ i, p i * ∑ o, channel.transition i o * Real.log (channel.transition i o / (∑ j, p j * channel.transition j o))

structure ChannelCapacity where
  channel : DiscreteChannel
  capacity : ℝ
  capacityUpperBound : ∀ (p : channel.inputAlphabet → ℝ), (∑ i, p i = 1 ∧ ∀ i, p i ≥ 0) → mutualInformation p channel ≤ capacity
  capacityAchievable : ∃ (p : channel.inputAlphabet → ℝ), (∑ i, p i = 1 ∧ ∀ i, p i ≥ 0) ∧ mutualInformation p channel = capacity

def channelCapacityClosed (c : ChannelCapacity) : Prop :=
  c.capacityUpperBound ∧ c.capacityAchievable

theorem channel_capacity_closed_from_evidence (c : ChannelCapacity) : channelCapacityClosed c :=
  And.intro c.capacityUpperBound c.capacityAchievable

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse