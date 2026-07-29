import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure KAMStabilityPackage where
  nondegeneracyCondition : Prop
  smallPerturbation : Prop
  invariantTori : Prop
  stabilityConclusion : Prop

structure KAMStabilityEvidence (K : KAMStabilityPackage) where
  nondegeneracyConditionClosed : K.nondegeneracyCondition
  smallPerturbationClosed : K.smallPerturbation
  invariantToriClosed : K.invariantTori
  stabilityConclusionClosed : K.stabilityConclusion

def KAMStabilityClosed (K : KAMStabilityPackage) : Prop :=
  K.nondegeneracyCondition ∧ K.smallPerturbation ∧ K.invariantTori ∧ K.stabilityConclusion

theorem kam_stability_closed_from_evidence (K : KAMStabilityPackage) (E : KAMStabilityEvidence K) :
    KAMStabilityClosed K := by
  exact And.intro E.nondegeneracyConditionClosed
    (And.intro E.smallPerturbationClosed
      (And.intro E.invariantToriClosed E.stabilityConclusionClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse