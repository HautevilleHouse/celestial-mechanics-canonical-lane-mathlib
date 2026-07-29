import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure CelestialAdmissibleObject where
  system : NBodyDynamics.NBodySystem
  conservedQuantities : List ℝ
  singularityFree : Prop

def celestialBridgeClosed (obj : CelestialAdmissibleObject) : Prop := obj.singularityFree

def celestialGateClosed (obj : CelestialAdmissibleObject) : Prop := obj.conservedQuantities.length ≥ 1

theorem celestial_bridge_from_admissible (obj : CelestialAdmissibleObject) : celestialBridgeClosed obj := by
  exact obj.singularityFree

theorem celestial_gate_from_admissible (obj : CelestialAdmissibleObject) : celestialGateClosed obj := by
  exact by
    have h : obj.conservedQuantities.length ≥ 1 := by
      have : obj.conservedQuantities ≠ [] := by
        intro hnil
        have : obj.conservedQuantities = [] := hnil
        exact this
      exact Nat.one_le_length_of_nonempty this
    exact h

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse
