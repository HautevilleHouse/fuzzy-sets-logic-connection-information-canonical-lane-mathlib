import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyLogicInferenceBridgePackage where
  premiseSet : Type u
  conclusion : Type v
  implicationOperation : (premiseSet → Prop) → conclusion → Prop
  inferenceSoundness : Prop
  inferenceCompleteness : Prop
  inferenceSoundnessClosed : inferenceSoundness
  inferenceCompletenessClosed : inferenceCompleteness

structure FuzzyLogicInferenceEvidence (P : FuzzyLogicInferenceBridgePackage) where
  soundnessClosed : P.inferenceSoundness
  completenessClosed : P.inferenceCompleteness

def FuzzyLogicInferenceBridgeClosed (P : FuzzyLogicInferenceBridgePackage) : Prop :=
  P.inferenceSoundness ∧ P.inferenceCompleteness

theorem fuzzy_logic_inference_bridge_closed_from_evidence
    (P : FuzzyLogicInferenceBridgePackage) (E : FuzzyLogicInferenceEvidence P) :
    FuzzyLogicInferenceBridgeClosed P := by
  exact And.intro E.soundnessClosed E.completenessClosed

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
