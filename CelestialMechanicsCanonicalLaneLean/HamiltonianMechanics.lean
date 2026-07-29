import celestialMechanicsCanonicalLaneLean.ThreeBodyProblem

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure HamiltonianPackage {C : CelestialSystem}
    (T : ThreeBodyPackage C) where
  phaseSpace : Type u
  symplecticForm : Type v
  hamiltonianFunction : Type w
  hamiltonianEquations : Prop
  energyConservation : Prop

structure HamiltonianEvidence {C : CelestialSystem}
    {T : ThreeBodyPackage C} (H : HamiltonianPackage T) where
  hamiltonianEquationsClosed : H.hamiltonianEquations
  energyConservationClosed : H.energyConservation

def HamiltonianClosed {C : CelestialSystem}
    {T : ThreeBodyPackage C} (H : HamiltonianPackage T) : Prop :=
  H.hamiltonianEquations ∧ H.energyConservation

theorem hamiltonian_closed_from_evidence
    {C : CelestialSystem} {T : ThreeBodyPackage C}
    (H : HamiltonianPackage T) (E : HamiltonianEvidence H) :
    HamiltonianClosed H := by
  exact And.intro E.hamiltonianEquationsClosed E.energyConservationClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse