import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure SymplecticIntegrabilityPackage where
  symplecticForm : Type
  hamiltonian : Type
  integrable : Prop
  actionAngleCoordinates : Prop

structure SymplecticIntegrabilityEvidence (S : SymplecticIntegrabilityPackage) where
  integrableClosed : S.integrable
  actionAngleCoordinatesClosed : S.actionAngleCoordinates

def SymplecticIntegrabilityClosed (S : SymplecticIntegrabilityPackage) : Prop :=
  S.integrable ∧ S.actionAngleCoordinates

theorem symplectic_integrability_closed_from_evidence (S : SymplecticIntegrabilityPackage)
    (E : SymplecticIntegrabilityEvidence S) : SymplecticIntegrabilityClosed S := by
  exact And.intro E.integrableClosed E.actionAngleCoordinatesClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse