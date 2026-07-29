import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure NBodyChaosPackage where
  n : Nat
  mutualDistances : Type u
  singularityStructure : Type v
  symplecticFormPreserved : Prop
  chaosSensitiveDependence : Prop
  kolmogorovArnoldMoserStability : Prop
  regularizationDefined : Prop

structure NBodyChaosEvidence (C : NBodyChaosPackage) where
  symplecticFormPreservedClosed : C.symplecticFormPreserved
  chaosSensitiveDependenceClosed : C.chaosSensitiveDependence
  kolmogorovArnoldMoserStabilityClosed : C.kolmogorovArnoldMoserStability
  regularizationDefinedClosed : C.regularizationDefined

def NBodyChaosClosed (C : NBodyChaosPackage) : Prop :=
  C.symplecticFormPreserved ∧ C.chaosSensitiveDependence ∧
  C.kolmogorovArnoldMoserStability ∧ C.regularizationDefined

theorem n_body_chaos_closed_from_evidence (C : NBodyChaosPackage) (E : NBodyChaosEvidence C) :
    NBodyChaosClosed C := by
  exact And.intro E.symplecticFormPreservedClosed
    (And.intro E.chaosSensitiveDependenceClosed
      (And.intro E.kolmogorovArnoldMoserStabilityClosed E.regularizationDefinedClosed))

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse
