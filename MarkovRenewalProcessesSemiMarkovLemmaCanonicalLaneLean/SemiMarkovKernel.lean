import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure SemiMarkovKernelPackage (A : AdmissibleClass) where
  stateSpace : Type u
  markovRenewalKernel : stateSpace → stateSpace → ℝ → ℝ
  nonnegative : Prop
  measurableInTime : Prop
  substochastic : Prop
  nonnegativeTerm : nonnegative
  measurableInTimeTerm : measurableInTime
  substochasticTerm : substochastic

structure SemiMarkovKernelEvidence {A : AdmissibleClass} (K : SemiMarkovKernelPackage A) where
  nonnegativeClosed : K.nonnegative
  measurableInTimeClosed : K.measurableInTime
  substochasticClosed : K.substochastic

def SemiMarkovKernelClosed {A : AdmissibleClass} (K : SemiMarkovKernelPackage A) : Prop :=
  K.nonnegative ∧ K.measurableInTime ∧ K.substochastic

theorem semi_markov_kernel_closed_from_evidence {A : AdmissibleClass}
    (K : SemiMarkovKernelPackage A) (E : SemiMarkovKernelEvidence K) :
    SemiMarkovKernelClosed K := by
  exact And.intro E.nonnegativeClosed (And.intro E.measurableInTimeClosed E.substochasticClosed)

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse