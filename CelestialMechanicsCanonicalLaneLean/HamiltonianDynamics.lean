import HautevilleHouse.CelestialMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure HamiltonianSystem where
  phaseSpace : Type u
  symplecticForm : Type v
  hamiltonian : phaseSpace → ℝ
  equationsOfMotion : Prop
  poissonBracket : Prop

structure HamiltonianEvidence (H : HamiltonianSystem) where
  equationsOfMotionClosed : H.equationsOfMotion
  poissonBracketClosed : H.poissonBracket

def HamiltonianClosed (H : HamiltonianSystem) : Prop :=
  H.equationsOfMotion ∧ H.poissonBracket

theorem hamiltonian_closed_from_evidence (H : HamiltonianSystem)
    (E : HamiltonianEvidence H) : HamiltonianClosed H := by
  exact And.intro E.equationsOfMotionClosed E.poissonBracketClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse