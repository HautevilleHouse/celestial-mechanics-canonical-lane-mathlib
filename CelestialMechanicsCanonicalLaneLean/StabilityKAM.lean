import CelestialMechanicsCanonicalLaneLean.HamiltonianPerturbation

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure StabilityKAMPackage where
  nondegeneracyCondition : Prop
  diophantineCondition : Prop
  invariantTori : Prop
  measureEstimate : Prop

structure StabilityKAMEvidence (S : StabilityKAMPackage) where
  nondegeneracyConditionClosed : S.nondegeneracyCondition
  diophantineConditionClosed : S.diophantineCondition
  invariantToriClosed : S.invariantTori
  measureEstimateClosed : S.measureEstimate

def StabilityKAMClosed (S : StabilityKAMPackage) : Prop :=
  S.nondegeneracyCondition ∧ S.diophantineCondition ∧ S.invariantTori ∧ S.measureEstimate

theorem stability_kam_closed_from_evidence (S : StabilityKAMPackage) (E : StabilityKAMEvidence S) :
    StabilityKAMClosed S := by
  exact And.intro E.nondegeneracyConditionClosed (And.intro E.diophantineConditionClosed (And.intro E.invariantToriClosed E.measureEstimateClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse