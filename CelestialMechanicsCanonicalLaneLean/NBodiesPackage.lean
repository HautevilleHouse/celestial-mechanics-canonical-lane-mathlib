import CanonicalLaneMathlib.AdmissibleClass
import CelestialAdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure NBodiesPackage where
  n : Nat
  masses : Vec ℝ n
  positions : Vec (Vec ℝ 3) n
  velocities : Vec (Vec ℝ 3) n
  potentialEnergy : Prop
  kineticEnergy : Prop
  equationsOfMotion : Prop
  conservationLaws : Prop

structure NBodiesEvidence (P : NBodiesPackage) where
  potentialEnergyClosed : P.potentialEnergy
  kineticEnergyClosed : P.kineticEnergy
  equationsOfMotionClosed : P.equationsOfMotion
  conservationLawsClosed : P.conservationLaws

def NBodiesClosed (P : NBodiesPackage) : Prop :=
  P.potentialEnergy ∧ P.kineticEnergy ∧ P.equationsOfMotion ∧ P.conservationLaws

theorem nbodies_closed_from_evidence (P : NBodiesPackage) (E : NBodiesEvidence P) :
    NBodiesClosed P := by
  exact And.intro E.potentialEnergyClosed
    (And.intro E.kineticEnergyClosed
      (And.intro E.equationsOfMotionClosed E.conservationLawsClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse