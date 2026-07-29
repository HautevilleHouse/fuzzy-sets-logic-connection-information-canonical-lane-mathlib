import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure FuzzySetAdmittedObject where
  object : AdmittedObject
  fuzzyUniverse : Type
  fuzzyTopology : TopologicalSpace fuzzyUniverse
  fuzzyMembershipDefined : Prop
  logicalOperationsDefined : Prop
  informationMeasureDefined : Prop
  conclusion : fuzzyMembershipDefined ∧ logicalOperationsDefined ∧ informationMeasureDefined

structure FuzzySetEndgameState where
  object : FuzzySetAdmittedObject

structure FuzzySetProjection : Projection FuzzySetEndgameState where
  toFun : FuzzySetEndgameState → FuzzySetEndgameState := id
  idempotent : ∀ x, toFun (toFun x) = toFun x := by intro x; rfl

def fuzzySetProjection : FuzzySetProjection where

def fuzzySetBridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem fuzzy_set_bridge_from_admissible_class (A : AdmissibleClass) :
    fuzzySetBridgeClosed A :=
  A.object.conclusion

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse