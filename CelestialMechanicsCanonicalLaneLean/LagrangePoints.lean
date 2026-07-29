import celestialMechanicsCanonicalLaneLean.KeplerProblem

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure LagrangePointsPackage {C : CelestialSystem}
    {T : ThreeBodyPackage C} {H : HamiltonianPackage T}
    {K : KeplerPackage H} where
  circularRestrictedThreeBody : Prop
  equilibriumPoints : List (ℝ × ℝ)
  stabilityAnalysis : Prop
  l1L2L3 : Prop
  l4L5 : Prop

structure LagrangePointsEvidence {C : CelestialSystem}
    {T : ThreeBodyPackage C} {H : HamiltonianPackage T}
    {K : KeplerPackage H} (L : LagrangePointsPackage K) where
  equilibriumPointsClosed : L.equilibriumPoints.length = 5
  stabilityAnalysisClosed : L.stabilityAnalysis

def LagrangePointsClosed {C : CelestialSystem}
    {T : ThreeBodyPackage C} {H : HamiltonianPackage T}
    {K : KeplerPackage H} (L : LagrangePointsPackage K) : Prop :=
  L.equilibriumPoints.length = 5 ∧ L.stabilityAnalysis

theorem lagrange_points_closed_from_evidence
    {C : CelestialSystem} {T : ThreeBodyPackage C} {H : HamiltonianPackage T}
    {K : KeplerPackage H} (L : LagrangePointsPackage K) (E : LagrangePointsEvidence L) :
    LagrangePointsClosed L := by
  exact And.intro E.equilibriumPointsClosed E.stabilityAnalysisClosed

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse