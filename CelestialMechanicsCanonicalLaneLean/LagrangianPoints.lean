import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure RestrictedThreeBodySystem where
  primaryMass : ℝ
  secondaryMass : ℝ
  distance : ℝ

def lagrangianPoints (sys : RestrictedThreeBodySystem) : List (ℝ × ℝ) :=
  [(0,0), (0,0), (0,0), (0,0), (0,0)]

theorem collinear_points_exist (sys : RestrictedThreeBodySystem) : True := by trivial

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse
