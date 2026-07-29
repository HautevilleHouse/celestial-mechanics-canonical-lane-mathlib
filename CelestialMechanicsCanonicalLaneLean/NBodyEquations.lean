import CelestialMechanicsCanonicalLaneLean.ThreeBodyProblem

/-!
# N-Body Equations Package
-/

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure NBodyEquationsPackage where
  n : ℕ
  masses : Fin n → ℝ
  positions : Fin n → ℝ³
  velocities : Fin n → ℝ³
  inverseSquareLaw : Prop
  conservationLaws : Prop

structure NBodyEquationsEvidence (Q : NBodyEquationsPackage) where
  inverseSquareLawClosed : Q.inverseSquareLaw
  conservationLawsClosed : Q.conservationLaws

def NBodyEquationsClosed (Q : NBodyEquationsPackage) : Prop :=
  Q.inverseSquareLaw ∧ Q.conservationLaws

theorem n_body_equations_closed_from_evidence
    (Q : NBodyEquationsPackage) (E : NBodyEquationsEvidence Q) :
    NBodyEquationsClosed Q := by
  exact And.intro E.inverseSquareLawClosed E.conservationLawsClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse