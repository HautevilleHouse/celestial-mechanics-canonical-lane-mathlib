import OrbitalElementsPackage

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure PerturbationPackage {P : NBodiesPackage} (O : OrbitalElementsPackage P) where
  perturbationSource : Prop
  resonanceAnalysis : Prop
  secularTrends : Prop
  averagingMethod : Prop
  longTermEvolution : Prop

structure PerturbationEvidence {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    (Q : PerturbationPackage O) where
  perturbationSourceClosed : Q.perturbationSource
  resonanceAnalysisClosed : Q.resonanceAnalysis
  secularTrendsClosed : Q.secularTrends
  averagingMethodClosed : Q.averagingMethod
  longTermEvolutionClosed : Q.longTermEvolution

def PerturbationClosed {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    (Q : PerturbationPackage O) : Prop :=
  Q.perturbationSource ∧ Q.resonanceAnalysis ∧ Q.secularTrends ∧
  Q.averagingMethod ∧ Q.longTermEvolution

theorem perturbation_closed_from_evidence
    {P : NBodiesPackage} {O : OrbitalElementsPackage P}
    (Q : PerturbationPackage O) (E : PerturbationEvidence Q) :
    PerturbationClosed Q := by
  exact And.intro E.perturbationSourceClosed
    (And.intro E.resonanceAnalysisClosed
      (And.intro E.secularTrendsClosed
        (And.intro E.averagingMethodClosed E.longTermEvolutionClosed)))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse