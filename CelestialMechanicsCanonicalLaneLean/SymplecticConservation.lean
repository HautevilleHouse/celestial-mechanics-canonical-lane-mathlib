import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure SymplecticStructurePackage (M : NBodyMassParameters) where
  phaseSpace : Type u
  symplecticForm : phaseSpace → phaseSpace → ℝ
  closedNondegenerate : Prop
  canonicalCoordinates : Prop

structure PoissonBracketPackage {M : NBodyMassParameters} (S : SymplecticStructurePackage M) where
  bracketDefined : Prop
  bilinearity : Prop
  skewSymmetry : Prop
  jacobiIdentity : Prop

structure ConservationLawsPackage {M : NBodyMassParameters} {S : SymplecticStructurePackage M} (P : PoissonBracketPackage S) where
  energyConservation : Prop
  momentumConservation : Prop
  angularMomentumConservation : Prop

structure SymplecticEvidence {M : NBodyMassParameters} {S : SymplecticStructurePackage M} {P : PoissonBracketPackage S} (C : ConservationLawsPackage P) where
  energyConservationClosed : C.energyConservation
  momentumConservationClosed : C.momentumConservation
  angularMomentumConservationClosed : C.angularMomentumConservation

def SymplecticConservationClosed {M : NBodyMassParameters} {S : SymplecticStructurePackage M} {P : PoissonBracketPackage S} (C : ConservationLawsPackage P) : Prop :=
  C.energyConservation ∧ C.momentumConservation ∧ C.angularMomentumConservation

theorem symplectic_conservation_closed_from_evidence {M : NBodyMassParameters} {S : SymplecticStructurePackage M} {P : PoissonBracketPackage S} (C : ConservationLawsPackage P) (E : SymplecticEvidence C) : SymplecticConservationClosed C := by
  exact And.intro E.energyConservationClosed (And.intro E.momentumConservationClosed E.angularMomentumConservationClosed)

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse