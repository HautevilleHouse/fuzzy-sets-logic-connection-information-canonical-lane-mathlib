import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure FuzzyAdmittedObject where
  carrierType : Type
  carrierTopology : TopologicalSpace carrierType
  fuzzySetStructure : Prop
  logicConnection : Prop
  informationContent : Prop
  conclusion : FuzzyWitnessClosed this

def FuzzyWitnessClosed (O : FuzzyAdmittedObject) : Prop :=
  O.fuzzySetStructure ∧ O.logicConnection ∧ O.informationContent

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
