import HautevilleHouse.CelestialMechanicsCanonicalLaneLean.HamiltonianDynamics

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure NBodySystem where
  n : Nat
  masses : Vector ℝ n
  positions : Vector ℝ³ n
  velocities : Vector ℝ³ n
  potentialEnergy : Prop
  totalEnergyConservation : Prop
  centerOfMassMotion : Prop

structure NBodyEvidence (N : NBodySystem) where
  potentialEnergyClosed : N.potentialEnergy
  totalEnergyConservationClosed : N.totalEnergyConservation
  centerOfMassMotionClosed : N.centerOfMassMotion

def NBodyClosed (N : NBodySystem) : Prop :=
  N.potentialEnergy ∧ N.totalEnergyConservation ∧ N.centerOfMassMotion

theorem nbody_closed_from_evidence (N : NBodySystem) (E : NBodyEvidence N) :
    NBodyClosed N := by
  exact And.intro E.potentialEnergyClosed
    (And.intro E.totalEnergyConservationClosed E.centerOfMassMotionClosed)

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse