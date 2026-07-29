import celestialMechanicsCanonicalLaneLean.HamiltonianMechanics

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure KeplerPackage {C : CelestialSystem}
    {T : ThreeBodyPackage C} {H : HamiltonianPackage T} where
  reducedTwoBody : Prop
  effectivePotential : Type u
  orbitEquation : Prop
  conicSectionClassification : Prop
  keplerLaws : Prop

structure KeplerEvidence {C : CelestialSystem}
    {T : ThreeBodyPackage C} {H : HamiltonianPackage T}
    (K : KeplerPackage H) where
  orbitEquationClosed : K.orbitEquation
  keplerLawsClosed : K.keplerLaws

def KeplerClosed {C : CelestialSystem}
    {T : ThreeBodyPackage C} {H : HamiltonianPackage T}
    (K : KeplerPackage H) : Prop :=
  K.orbitEquation ∧ K.keplerLaws

theorem kepler_closed_from_evidence
    {C : CelestialSystem} {T : ThreeBodyPackage C} {H : HamiltonianPackage T}
    (K : KeplerPackage H) (E : KeplerEvidence K) :
    KeplerClosed K := by
  exact And.intro E.orbitEquationClosed E.keplerLawsClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse