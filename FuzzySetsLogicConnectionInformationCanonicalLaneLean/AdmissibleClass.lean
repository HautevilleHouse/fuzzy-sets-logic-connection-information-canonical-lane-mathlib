import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure AdmissibleClass where
  object : FuzzyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FuzzyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
