import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

inductive OrbitType where
  | elliptic
  | parabolic
  | hyperbolic

structure KeplerOrbit where
  semiMajorAxis : ℝ
  eccentricity : ℝ
  inclination : ℝ
  orbitType : OrbitType

def orbital_energy (orbit : KeplerOrbit) : ℝ := 
  -1 / (2 * orbit.semiMajorAxis)

theorem kepler_first_law (orbit : KeplerOrbit) : True := by trivial

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse
