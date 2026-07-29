import HautevilleHouse.CelestialMechanicsCanonicalLaneLean.KeplersLaws

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure CanonicalIntegralsPackage {N : NBodyPackage} {H : HamiltonianPackage N} {K : KeplersLawsPackage N H} where
  totalEnergy : Type
  totalAngularMomentum : Type
  laplaceRungeLenz : Type
  integralsClosed : Prop
  integrabilityConditions : Prop

structure CanonicalIntegralsEvidence {N : NBodyPackage} {H : HamiltonianPackage N} {K : KeplersLawsPackage N H} (I : CanonicalIntegralsPackage N H K) where
  integralsClosedClosed : I.integralsClosed
  integrabilityConditionsClosed : I.integrabilityConditions

def CanonicalIntegralsClosed {N : NBodyPackage} {H : HamiltonianPackage N} {K : KeplersLawsPackage N H} (I : CanonicalIntegralsPackage N H K) : Prop :=
  I.integralsClosed ∧ I.integrabilityConditions

theorem canonical_integrals_closed_from_evidence {N : NBodyPackage} {H : HamiltonianPackage N} {K : KeplersLawsPackage N H} (I : CanonicalIntegralsPackage N H K) (E : CanonicalIntegralsEvidence I) : CanonicalIntegralsClosed I := by
  exact And.intro E.integralsClosedClosed E.integrabilityConditionsClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse