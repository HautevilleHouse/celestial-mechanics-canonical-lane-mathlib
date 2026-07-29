import HautevilleHouse.CelestialMechanicsCanonicalLaneLean.CelestialNBody

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure HamiltonianPackage {N : NBodyPackage} where
  canonicallyConjugate : Type
  hamiltonianFunction : Type
  poissonBracket : Type
  hamiltonianEquations : Prop
  energyConservation : Prop

structure HamiltonianEvidence {N : NBodyPackage} (H : HamiltonianPackage N) where
  hamiltonianEquationsClosed : H.hamiltonianEquations
  energyConservationClosed : H.energyConservation

def HamiltonianClosed {N : NBodyPackage} (H : HamiltonianPackage N) : Prop :=
  H.hamiltonianEquations ∧ H.energyConservation

theorem hamiltonian_closed_from_evidence {N : NBodyPackage} (H : HamiltonianPackage N) (E : HamiltonianEvidence H) : HamiltonianClosed H := by
  exact And.intro E.hamiltonianEquationsClosed E.energyConservationClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse