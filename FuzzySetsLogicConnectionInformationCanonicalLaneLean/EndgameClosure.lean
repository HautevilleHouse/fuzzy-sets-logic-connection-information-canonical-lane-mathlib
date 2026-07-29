import canonicalLaneMathlib.AdmissibleClass
import FuzzySetsLogicConnectionInformationCanonicalLaneLean.SourceCodingTheoremPackage
import FuzzySetsLogicConnectionInformationCanonicalLaneLean.ShannonEntropyPackage
import FuzzySetsLogicConnectionInformationCanonicalLaneLean.ProbabilityInformationSources
import FuzzySetsLogicConnectionInformationCanonicalLaneLean.ChannelCapacityPackage
import FuzzySetsLogicConnectionInformationCanonicalLaneLean.RateDistortionPackage

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ProbabilityInformationSourceClosed A.object ∧ ShannonEntropyPackageClosed A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact And.intro (by
    have h : ProbabilityInformationSourceClosed A.object := by
      exact A.object.conclusion
    exact h) (by
    have h : ShannonEntropyPackageClosed A.object := by
      exact A.object.conclusion
    exact h)

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedInformationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_information_endgame (A : AdmissibleClass) : ConstrainedInformationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse