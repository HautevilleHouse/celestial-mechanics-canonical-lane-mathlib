import CelestialMechanicsCanonicalLaneLean.SymplecticPhaseSpace

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

def ConstrainedCelestialClosure (A : CelestialAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_celestial_endgame (A : CelestialAdmissibleClass) :
    ConstrainedCelestialClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse