import CelestialMechanicsCanonicalLaneLean.TwoBodyProblem

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure HamiltonianPerturbationPackage where
  hamiltonianFunction : Prop
  perturbationParameter : Prop
  canonicalTransformation : Prop
  resonantTerms : Prop

structure HamiltonianPerturbationEvidence (H : HamiltonianPerturbationPackage) where
  hamiltonianFunctionClosed : H.hamiltonianFunction
  perturbationParameterClosed : H.perturbationParameter
  canonicalTransformationClosed : H.canonicalTransformation
  resonantTermsClosed : H.resonantTerms

def HamiltonianPerturbationClosed (H : HamiltonianPerturbationPackage) : Prop :=
  H.hamiltonianFunction ∧ H.perturbationParameter ∧ H.canonicalTransformation ∧ H.resonantTerms

theorem hamiltonian_perturbation_closed_from_evidence (H : HamiltonianPerturbationPackage) (E : HamiltonianPerturbationEvidence H) :
    HamiltonianPerturbationClosed H := by
  exact And.intro E.hamiltonianFunctionClosed (And.intro E.perturbationParameterClosed (And.intro E.canonicalTransformationClosed E.resonantTermsClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse