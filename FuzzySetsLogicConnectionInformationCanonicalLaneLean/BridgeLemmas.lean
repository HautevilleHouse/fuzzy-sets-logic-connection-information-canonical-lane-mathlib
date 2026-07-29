import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FuzzyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse
