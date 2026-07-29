import CelestialMechanicsCanonicalLaneLean.CelestialBridgeLemmas

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

def gateClosed (A : CelestialAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : CelestialAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse