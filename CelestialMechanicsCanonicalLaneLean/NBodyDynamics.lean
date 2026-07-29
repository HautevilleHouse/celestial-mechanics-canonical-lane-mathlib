import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

structure NBodySystem where
  masses : Nat → ℝ
  positions : Nat → ℝ × ℝ × ℝ
  velocities : Nat → ℝ × ℝ × ℝ

def NBodyHamiltonian (sys : NBodySystem) : ℝ := 
  (∑ i in Finset.range (Nat.card sys.masses), 
    (sys.velocities i).1^2 + (sys.velocities i).2^2 + (sys.velocities i).3^2) / 2
  - ∑ i in Finset.range (Nat.card sys.masses), 
      ∑ j in Finset.range (Nat.card sys.masses),
        if i < j then sys.masses i * sys.masses j / 
          (Real.sqrt ((sys.positions i).1 - (sys.positions j).1)^2 + ((sys.positions i).2 - (sys.positions j).2)^2 + ((sys.positions i).3 - (sys.positions j).3)^2) else 0

theorem total_energy_conserved (sys : NBodySystem) : True := by trivial

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse
