import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzySetsLogicConnectionInformationCanonicalLaneLean.FuzzySetSemantics

namespace HautevilleHouse
namespace FuzzySetsLogicConnectionInformationCanonicalLaneLean

structure TNorm where
  carrier : Type u
  op : carrier → carrier → carrier
  commutativity : ∀ x y, op x y = op y x
  associativity : ∀ x y z, op (op x y) z = op x (op y z)
  monotonicity : ∀ x y z, x ≤ y → op x z ≤ op y z
  identityElement : carrier
  identityLeft : ∀ x, op identityElement x = x
  identityRight : ∀ x, op x identityElement = x

def tNormClosed (t : TNorm) : Prop :=
  t.commutativity ∧ t.associativity ∧ t.monotonicity ∧ t.identityLeft ∧ t.identityRight

theorem t_norm_closed_from_properties (t : TNorm) : tNormClosed t :=
  And.intro t.commutativity (And.intro t.associativity (And.intro t.monotonicity (And.intro t.identityLeft t.identityRight)))

structure SConorm where
  carrier : Type u
  op : carrier → carrier → carrier
  commutativity : ∀ x y, op x y = op y x
  associativity : ∀ x y z, op (op x y) z = op x (op y z)
  monotonicity : ∀ x y z, x ≤ y → op x z ≤ op y z
  nullElement : carrier
  nullLeft : ∀ x, op nullElement x = x
  nullRight : ∀ x, op x nullElement = x

def sConormClosed (s : SConorm) : Prop :=
  s.commutativity ∧ s.associativity ∧ s.monotonicity ∧ s.nullLeft ∧ s.nullRight

theorem s_conorm_closed_from_properties (s : SConorm) : sConormClosed s :=
  And.intro s.commutativity (And.intro s.associativity (And.intro s.monotonicity (And.intro s.nullLeft s.nullRight)))

end FuzzySetsLogicConnectionInformationCanonicalLaneLean
end HautevilleHouse