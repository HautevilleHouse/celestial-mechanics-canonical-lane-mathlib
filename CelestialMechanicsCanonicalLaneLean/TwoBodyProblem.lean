import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure TwoBodyPackage where
  centralPotential : Type u
  reducedMass : Type v
  angularMomentum : Type w
  totalEnergy : Type x
  effectivePotentialDefined : Prop
  orbitEquationIntegrated : Prop
  keplerLawsDerived : Prop
  boundedOrbitClassified : Prop

structure TwoBodyEvidence (T : TwoBodyPackage) where
  effectivePotentialDefinedClosed : T.effectivePotentialDefined
  orbitEquationIntegratedClosed : T.orbitEquationIntegrated
  keplerLawsDerivedClosed : T.keplerLawsDerived
  boundedOrbitClassifiedClosed : T.boundedOrbitClassified

def TwoBodyClosed (T : TwoBodyPackage) : Prop :=
  T.effectivePotentialDefined ∧ T.orbitEquationIntegrated ∧
  T.keplerLawsDerived ∧ T.boundedOrbitClassified

theorem two_body_closed_from_evidence (T : TwoBodyPackage) (E : TwoBodyEvidence T) :
    TwoBodyClosed T := by
  exact And.intro E.effectivePotentialDefinedClosed
    (And.intro E.orbitEquationIntegratedClosed
      (And.intro E.keplerLawsDerivedClosed E.boundedOrbitClassifiedClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse
