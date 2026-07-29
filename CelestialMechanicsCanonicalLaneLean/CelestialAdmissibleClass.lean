import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure CelestialAdmittedObject where
  bodyCount : Nat
  spaceDim : Nat
  hasPotential : Prop
  potentialSmooth : Prop
  conclusion : hasPotential ∧ potentialSmooth

structure AdmissibleClass where
  object : CelestialAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse