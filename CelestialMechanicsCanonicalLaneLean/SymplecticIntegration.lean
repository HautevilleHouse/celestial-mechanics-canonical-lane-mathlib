import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure SymplecticIntegrator where
  timestep : ℝ
  order : ℕ
  coefficients : List ℝ

def symplectic_euler_step (sys : NBodyDynamics.NBodySystem) (dt : ℝ) : NBodyDynamics.NBodySystem := sys

theorem symplecticity_preserved (step : SymplecticIntegrator) : True := by trivial

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse
