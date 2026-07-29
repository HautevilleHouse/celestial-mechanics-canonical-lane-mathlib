import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

def ConstrainedCelestialMechanicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_celestial_mechanics_endgame (A : AdmissibleClass) :
    ConstrainedCelestialMechanicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse
