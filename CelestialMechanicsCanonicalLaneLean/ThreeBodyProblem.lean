import CelestialMechanicsCanonicalLaneLean.RiemannianCurvature

/-!
# Three-Body Problem Package
-/

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure ThreeBodyProblemPackage where
  masses : ℝ × ℝ × ℝ
  initialPositions : ℝ³ × ℝ³ × ℝ³
  initialVelocities : ℝ³ × ℝ³ × ℝ³
  lagrangePoints : Prop
  centralConfiguration : Prop

structure ThreeBodyProblemEvidence (P : ThreeBodyProblemPackage) where
  lagrangePointsClosed : P.lagrangePoints
  centralConfigurationClosed : P.centralConfiguration

def ThreeBodyProblemClosed (P : ThreeBodyProblemPackage) : Prop :=
  P.lagrangePoints ∧ P.centralConfiguration

theorem three_body_problem_closed_from_evidence
    (P : ThreeBodyProblemPackage) (E : ThreeBodyProblemEvidence P) :
    ThreeBodyProblemClosed P := by
  exact And.intro E.lagrangePointsClosed E.centralConfigurationClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse