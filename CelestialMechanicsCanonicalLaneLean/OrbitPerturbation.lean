import HautevilleHouse.CelestialMechanicsCanonicalLaneLean.KeplerProblem

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure PerturbationSystem (H : HamiltonianPackage) (K : KeplerSystem H) where
  perturbingPotential : H.phaseSpace → ℝ
  orbitVariation : Prop
  secularTerms : Prop
  averagingTheory : Prop

def PerturbationEvidence (H : HamiltonianPackage) (K : KeplerSystem H) (P : PerturbationSystem H K) where
  orbitVariationClosed : P.orbitVariation
  secularTermsClosed : P.secularTerms
  averagingTheoryClosed : P.averagingTheory

def PerturbationClosed (H : HamiltonianPackage) (K : KeplerSystem H) (P : PerturbationSystem H K) : Prop :=
  P.orbitVariation ∧ P.secularTerms ∧ P.averagingTheory

theorem perturbation_closed (H : HamiltonianPackage) (K : KeplerSystem H) (P : PerturbationSystem H K)
    (E : PerturbationEvidence H K P) : PerturbationClosed H K P := by
  exact And.intro E.orbitVariationClosed
    (And.intro E.secularTermsClosed E.averagingTheoryClosed)

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse