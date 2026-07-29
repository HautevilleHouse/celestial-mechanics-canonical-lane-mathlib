import PerturbationPackage

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure StabilityPackage {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    {Q : PerturbationPackage O} where
  lyapunovStability : Prop
  kamTheoryApplicable : Prop
  invariantTori : Prop
  chaoticRegions : Prop

structure StabilityEvidence {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    {Q : PerturbationPackage O} (S : StabilityPackage Q) where
  lyapunovStabilityClosed : S.lyapunovStability
  kamTheoryApplicableClosed : S.kamTheoryApplicable
  invariantToriClosed : S.invariantTori
  chaoticRegionsClosed : S.chaoticRegions

def StabilityClosed {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    {Q : PerturbationPackage O} (S : StabilityPackage Q) : Prop :=
  S.lyapunovStability ∧ S.kamTheoryApplicable ∧ S.invariantTori ∧ S.chaoticRegions

theorem stability_closed_from_evidence
    {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    {Q : PerturbationPackage O} (S : StabilityPackage Q) (E : StabilityEvidence S) :
    StabilityClosed S := by
  exact And.intro E.lyapunovStabilityClosed
    (And.intro E.kamTheoryApplicableClosed
      (And.intro E.invariantToriClosed E.chaoticRegionsClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse