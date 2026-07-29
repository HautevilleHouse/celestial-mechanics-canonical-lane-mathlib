import CelestialMechanicsCanonicalLaneLean.KeplerOrbit

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure SymplecticPhaseSpacePackage {A : CelestialAdmissibleClass} {P : GravitationalPotentialPackage A} {K : KeplerOrbitPackage P} where
  phaseSpace : Type
  symplecticForm : Type
  hamiltonianFunction : phaseSpace → ℝ
  poissonBracketWellDefined : Prop

structure SymplecticPhaseSpaceEvidence {A : CelestialAdmissibleClass} {P : GravitationalPotentialPackage A} {K : KeplerOrbitPackage P} (S : SymplecticPhaseSpacePackage A P K) where
  phaseSpaceClosed : S.phaseSpace
  symplecticFormClosed : S.symplecticForm
  hamiltonianFunctionClosed : S.hamiltonianFunction
  poissonBracketWellDefinedClosed : S.poissonBracketWellDefined

def SymplecticPhaseSpaceClosed {A : CelestialAdmissibleClass} {P : GravitationalPotentialPackage A} {K : KeplerOrbitPackage P} (S : SymplecticPhaseSpacePackage A P K) : Prop :=
  S.phaseSpace ∧ S.symplecticForm ∧ S.hamiltonianFunction ∧ S.poissonBracketWellDefined

theorem symplectic_phase_space_closed_from_evidence {A : CelestialAdmissibleClass} {P : GravitationalPotentialPackage A} {K : KeplerOrbitPackage P} (S : SymplecticPhaseSpacePackage A P K) (E : SymplecticPhaseSpaceEvidence S) : SymplecticPhaseSpaceClosed S := by
  exact And.intro E.phaseSpaceClosed (And.intro E.symplecticFormClosed (And.intro E.hamiltonianFunctionClosed E.poissonBracketWellDefinedClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse