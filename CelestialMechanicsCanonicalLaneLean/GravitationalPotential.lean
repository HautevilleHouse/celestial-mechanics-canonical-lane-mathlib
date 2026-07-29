import CelestialMechanicsCanonicalLaneLean.CelestialAdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure GravitationalPotentialPackage (A : CelestialAdmissibleClass) where
  massDistribution : Type
  potentialFunction : massDistribution → ℝ
  laplacianRelation : Prop
  boundaryConditions : Prop

structure GravitationalPotentialEvidence {A : CelestialAdmissibleClass} (P : GravitationalPotentialPackage A) where
  massDistributionClosed : P.massDistribution
  potentialFunctionClosed : P.potentialFunction
  laplacianRelationClosed : P.laplacianRelation
  boundaryConditionsClosed : P.boundaryConditions

def GravitationalPotentialClosed {A : CelestialAdmissibleClass} (P : GravitationalPotentialPackage A) : Prop :=
  P.massDistribution ∧ P.potentialFunction ∧ P.laplacianRelation ∧ P.boundaryConditions

theorem gravitational_potential_closed_from_evidence {A : CelestialAdmissibleClass} (P : GravitationalPotentialPackage A) (E : GravitationalPotentialEvidence P) : GravitationalPotentialClosed P := by
  exact And.intro E.massDistributionClosed (And.intro E.potentialFunctionClosed (And.intro E.laplacianRelationClosed E.boundaryConditionsClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse