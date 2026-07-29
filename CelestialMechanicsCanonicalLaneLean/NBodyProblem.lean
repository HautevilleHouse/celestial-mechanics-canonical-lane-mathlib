import CelestialMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure NBodyProblemPackage where
  massDistribution : Prop
  initialConditions : Prop
  equationsOfMotion : Prop
  energyConservation : Prop

structure NBodyProblemEvidence (N : NBodyProblemPackage) where
  massDistributionClosed : N.massDistribution
  initialConditionsClosed : N.initialConditions
  equationsOfMotionClosed : N.equationsOfMotion
  energyConservationClosed : N.energyConservation

def NBodyProblemClosed (N : NBodyProblemPackage) : Prop :=
  N.massDistribution ∧ N.initialConditions ∧ N.equationsOfMotion ∧ N.energyConservation

theorem n_body_problem_closed_from_evidence (N : NBodyProblemPackage) (E : NBodyProblemEvidence N) :
    NBodyProblemClosed N := by
  exact And.intro E.massDistributionClosed (And.intro E.initialConditionsClosed (And.intro E.equationsOfMotionClosed E.energyConservationClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse