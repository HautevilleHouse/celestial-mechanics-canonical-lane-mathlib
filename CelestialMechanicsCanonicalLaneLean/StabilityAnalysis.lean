import HautevilleHouse.CelestialMechanicsCanonicalLaneLean.LagrangePoints

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure StabilitySystem (N : NBodySystem) (T : ThreeBodySystem N) (L : LagrangePointSystem N T) where
  lyapunovStability : Prop
  kolmogorovArnoldMoser : Prop
  ArnoldDiffusion : Prop

def StabilityEvidence (N : NBodySystem) (T : ThreeBodySystem N) (L : LagrangePointSystem N T) (S : StabilitySystem N T L) where
  lyapunovStabilityClosed : S.lyapunovStability
  kolmogorovArnoldMoserClosed : S.kolmogorovArnoldMoser
  ArnoldDiffusionClosed : S.ArnoldDiffusion

def StabilityClosed (N : NBodySystem) (T : ThreeBodySystem N) (L : LagrangePointSystem N T) (S : StabilitySystem N T L) : Prop :=
  S.lyapunovStability ∧ S.kolmogorovArnoldMoser ∧ S.ArnoldDiffusion

theorem stability_closed (N : NBodySystem) (T : ThreeBodySystem N) (L : LagrangePointSystem N T) (S : StabilitySystem N T L)
    (E : StabilityEvidence N T L S) : StabilityClosed N T L S := by
  exact And.intro E.lyapunovStabilityClosed
    (And.intro E.kolmogorovArnoldMoserClosed E.ArnoldDiffusionClosed)

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse