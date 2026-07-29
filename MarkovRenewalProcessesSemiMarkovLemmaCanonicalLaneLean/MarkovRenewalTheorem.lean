import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean.SemiMarkovEquation

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure MarkovRenewalTheoremPackage where
  limitTheorem : Prop
  asymptoticBehavior : Prop
  stationaryDistribution : Prop
  convergenceRate : Prop

structure MarkovRenewalTheoremEvidence (T : MarkovRenewalTheoremPackage) where
  limitTheoremClosed : T.limitTheorem
  asymptoticBehaviorClosed : T.asymptoticBehavior
  stationaryDistributionClosed : T.stationaryDistribution
  convergenceRateClosed : T.convergenceRate

def MarkovRenewalTheoremClosed (T : MarkovRenewalTheoremPackage) : Prop :=
  T.limitTheorem ∧ T.asymptoticBehavior ∧ T.stationaryDistribution ∧ T.convergenceRate

theorem markov_renewal_theorem_closed_from_evidence (T : MarkovRenewalTheoremPackage) (E : MarkovRenewalTheoremEvidence T) :
    MarkovRenewalTheoremClosed T := by
  exact And.intro E.limitTheoremClosed (And.intro E.asymptoticBehaviorClosed (And.intro E.stationaryDistributionClosed E.convergenceRateClosed))

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse