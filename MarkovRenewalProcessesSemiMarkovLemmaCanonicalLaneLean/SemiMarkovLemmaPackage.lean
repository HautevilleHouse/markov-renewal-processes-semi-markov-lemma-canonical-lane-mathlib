import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure SemiMarkovLemmaPackage where
  kernel : SemiMarkovKernelPackage
  renewalEquation : RenewalEquationPackage
  limitTheorem : Prop
  stationaryDistribution : Prop
  lawOfLargeNumbers : Prop
  centralLimitTheorem : Prop

structure SemiMarkovLemmaEvidence (L : SemiMarkovLemmaPackage) where
  limitTheoremClosed : L.limitTheorem
  stationaryDistributionClosed : L.stationaryDistribution
  lawOfLargeNumbersClosed : L.lawOfLargeNumbers
  centralLimitTheoremClosed : L.centralLimitTheorem

def SemiMarkovLemmaClosed (L : SemiMarkovLemmaPackage) : Prop :=
  L.limitTheorem ∧ L.stationaryDistribution ∧ L.lawOfLargeNumbers ∧ L.centralLimitTheorem

theorem semi_markov_lemma_closed_from_evidence (L : SemiMarkovLemmaPackage)
    (E : SemiMarkovLemmaEvidence L) : SemiMarkovLemmaClosed L := by
  exact And.intro E.limitTheoremClosed
    (And.intro E.stationaryDistributionClosed
      (And.intro E.lawOfLargeNumbersClosed E.centralLimitTheoremClosed))

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse