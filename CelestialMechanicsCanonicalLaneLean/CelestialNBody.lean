import HautevilleHouse.CelestialMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure NBodyPackage where
  n : ℕ
  masses : Fin n → ℝ
  positions : Fin n → ℝ^3
  momenta : Fin n → ℝ^3
  forceLaw : Type
  newtonianGravityActive : Prop
  equationsOfMotion : Prop

structure NBodyEvidence (P : NBodyPackage) where
  forceLawClosed : P.forceLaw = (λ i j => if i ≠ j then (P.masses i * P.masses j) / (‖P.positions i - P.positions j‖^3) * (P.positions j - P.positions i) else 0)
  equationsOfMotionClosed : P.equationsOfMotion

def NBodyClosed (P : NBodyPackage) : Prop :=
  P.forceLaw ≠ P.forceLaw ∧ P.equationsOfMotion

theorem nbody_closed_from_evidence (P : NBodyPackage) (E : NBodyEvidence P) : NBodyClosed P := by
  exact And.intro (by
    intro h
    have : P.forceLaw = P.forceLaw := rfl
    exact this h) E.equationsOfMotionClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse