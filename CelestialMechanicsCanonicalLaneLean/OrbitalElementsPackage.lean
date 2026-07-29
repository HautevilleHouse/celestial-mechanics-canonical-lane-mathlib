import NBodiesPackage

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure OrbitalElementsPackage {P : NBodiesPackage} where
  semiMajorAxis : ℝ
  eccentricity : ℝ
  inclination : ℝ
  raan : ℝ
  argPeriapsis : ℝ
  trueAnomaly : ℝ
  keplerianOsculating : Prop
  perturbedEvolution : Prop

structure OrbitalElementsEvidence {P : NBodiesPackage} (O : OrbitalElementsPackage P) where
  keplerianOsculatingClosed : O.keplerianOsculating
  perturbedEvolutionClosed : O.perturbedEvolution

def OrbitalElementsClosed {P : NBodiesPackage} (O : OrbitalElementsPackage P) : Prop :=
  O.keplerianOsculating ∧ O.perturbedEvolution

theorem orbital_elements_closed_from_evidence
    {P : NBodiesPackage} (O : OrbitalElementsPackage P) (E : OrbitalElementsEvidence O) :
    OrbitalElementsClosed O := by
  exact And.intro E.keplerianOsculatingClosed E.perturbedEvolutionClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse