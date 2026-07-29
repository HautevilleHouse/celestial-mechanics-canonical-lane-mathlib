import StabilityPackage

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure RestrictedThreeBodyPackage {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    {Q : PerturbationPackage O} {S : StabilityPackage Q} where
  primaryMass : ℝ
  secondaryMass : ℝ
  thirdBodyMassless : Bool
  lagrangePoints : Type
  equilibriumStability : Prop
  periodicOrbits : Prop

structure RestrictedThreeBodyEvidence {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    {Q : PerturbationPackage O} {S : StabilityPackage Q}
    (R : RestrictedThreeBodyPackage S) where
  lagrangePointsClosed : Nonempty (R.lagrangePoints)
  equilibriumStabilityClosed : R.equilibriumStability
  periodicOrbitsClosed : R.periodicOrbits

def RestrictedThreeBodyClosed {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    {Q : PerturbationPackage O} {S : StabilityPackage Q}
    (R : RestrictedThreeBodyPackage S) : Prop :=
  Nonempty (R.lagrangePoints) ∧ R.equilibriumStability ∧ R.periodicOrbits

theorem restricted_three_body_closed_from_evidence
    {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    {Q : PerturbationPackage O} {S : StabilityPackage Q}
    (R : RestrictedThreeBodyPackage S) (E : RestrictedThreeBodyEvidence R) :
    RestrictedThreeBodyClosed R := by
  exact And.intro E.lagrangePointsClosed
    (And.intro E.equilibriumStabilityClosed E.periodicOrbitsClosed)

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse