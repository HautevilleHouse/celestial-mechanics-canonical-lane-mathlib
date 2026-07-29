import CelestialMechanicsCanonicalLaneLean.NBodyEquations

/-!
# Perturbation Theory Package
-/

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure PerturbationTheoryPackage where
  baseSolution : Prop
  smallParameter : ℝ
  seriesExpansion : Prop
  convergenceRadius : Prop

structure PerturbationTheoryEvidence (R : PerturbationTheoryPackage) where
  baseSolutionClosed : R.baseSolution
  seriesExpansionClosed : R.seriesExpansion
  convergenceRadiusClosed : R.convergenceRadius

def PerturbationTheoryClosed (R : PerturbationTheoryPackage) : Prop :=
  R.baseSolution ∧ R.seriesExpansion ∧ R.convergenceRadius

theorem perturbation_theory_closed_from_evidence
    (R : PerturbationTheoryPackage) (E : PerturbationTheoryEvidence R) :
    PerturbationTheoryClosed R := by
  exact And.intro E.baseSolutionClosed (And.intro E.seriesExpansionClosed E.convergenceRadiusClosed)

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse