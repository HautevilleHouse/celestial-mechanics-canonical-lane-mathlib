import CelestialMechanicsCanonicalLaneLean.GravitationalPotential

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure KeplerOrbitPackage {A : CelestialAdmissibleClass} (P : GravitationalPotentialPackage A) where
  centralMass : ℝ
  orbitalElements : Type
  ellipticOrbit : Prop
  periodRelation : Prop

structure KeplerOrbitEvidence {A : CelestialAdmissibleClass} {P : GravitationalPotentialPackage A} (K : KeplerOrbitPackage P) where
  centralMassClosed : K.centralMass
  orbitalElementsClosed : K.orbitalElements
  ellipticOrbitClosed : K.ellipticOrbit
  periodRelationClosed : K.periodRelation

def KeplerOrbitClosed {A : CelestialAdmissibleClass} {P : GravitationalPotentialPackage A} (K : KeplerOrbitPackage P) : Prop :=
  K.centralMass ∧ K.orbitalElements ∧ K.ellipticOrbit ∧ K.periodRelation

theorem kepler_orbit_closed_from_evidence {A : CelestialAdmissibleClass} {P : GravitationalPotentialPackage A} (K : KeplerOrbitPackage P) (E : KeplerOrbitEvidence K) : KeplerOrbitClosed K := by
  exact And.intro E.centralMassClosed (And.intro E.orbitalElementsClosed (And.intro E.ellipticOrbitClosed E.periodRelationClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse