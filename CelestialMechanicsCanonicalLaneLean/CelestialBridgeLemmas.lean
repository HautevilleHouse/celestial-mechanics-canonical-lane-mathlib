import CelestialMechanicsCanonicalLaneLean.CelestialAdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

def bridgeClosed (A : CelestialAdmissibleClass) : Prop :=
  CelestialWitnessClosed A.object

theorem bridge_from_admissible_class (A : CelestialAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse