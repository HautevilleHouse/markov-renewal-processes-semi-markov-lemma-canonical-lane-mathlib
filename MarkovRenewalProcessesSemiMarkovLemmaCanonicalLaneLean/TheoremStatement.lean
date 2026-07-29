import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure SemiMarkovAdmittedObject where
  stateSpace : Type
  kernel : stateSpace → stateSpace → ℝ → ℝ
  markovRenewalEquation : Prop
  conclusion : markovRenewalEquation

def SemiMarkovWitnessClosed (O : SemiMarkovAdmittedObject) : Prop :=
  O.markovRenewalEquation

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse