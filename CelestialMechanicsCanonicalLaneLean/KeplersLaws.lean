import HautevilleHouse.CelestialMechanicsCanonicalLaneLean.HamiltonianCelestial

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure KeplersLawsPackage {N : NBodyPackage} {H : HamiltonianPackage N} where
  twoBodyReduction : Prop
  firstLaw : Prop
  secondLaw : Prop
  thirdLaw : Prop
  orbitalElementsDetermined : Prop

structure KeplersLawsEvidence {N : NBodyPackage} {H : HamiltonianPackage N} (K : KeplersLawsPackage N H) where
  twoBodyReductionClosed : K.twoBodyReduction
  firstLawClosed : K.firstLaw
  secondLawClosed : K.secondLaw
  thirdLawClosed : K.thirdLaw
  orbitalElementsDeterminedClosed : K.orbitalElementsDetermined

def KeplersLawsClosed {N : NBodyPackage} {H : HamiltonianPackage N} (K : KeplersLawsPackage N H) : Prop :=
  K.twoBodyReduction ∧ K.firstLaw ∧ K.secondLaw ∧ K.thirdLaw ∧ K.orbitalElementsDetermined

theorem keplers_laws_closed_from_evidence {N : NBodyPackage} {H : HamiltonianPackage N} (K : KeplersLawsPackage N H) (E : KeplersLawsEvidence K) : KeplersLawsClosed K := by
  exact And.intro E.twoBodyReductionClosed (And.intro E.firstLawClosed (And.intro E.secondLawClosed (And.intro E.thirdLawClosed E.orbitalElementsDeterminedClosed)))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse