import CelestialMechanicsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CelestialMechanicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CelestialSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  mass : carrier → ℝ

structure CelestialAdmittedObject where
  space : CelestialSpace
  threeBodyProblem : Prop
  periodicOrbit : Prop
  osculatingElements : Prop
  stabilityMargin : Prop
  conclusion : stabilityMargin

structure CelestialEndgameState where
  object : CelestialAdmittedObject

def CelestialWitnessClosed (O : CelestialAdmittedObject) : Prop :=
  O.stabilityMargin

end CelestialMechanicsCanonicalLaneLean
end HautevilleHouse