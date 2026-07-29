import CelestialMechanicsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CelestialWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse