import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure MarkovRenewalKernelPackage where
  stateSpace : Type u
  kernelFunction : Type v
  semiMarkovProperty : Prop
  transitionLaw : Prop
  markovRenewalEquation : Prop

structure MarkovRenewalKernelEvidence (K : MarkovRenewalKernelPackage) where
  semiMarkovPropertyClosed : K.semiMarkovProperty
  transitionLawClosed : K.transitionLaw
  markovRenewalEquationClosed : K.markovRenewalEquation

def MarkovRenewalKernelClosed (K : MarkovRenewalKernelPackage) : Prop :=
  K.semiMarkovProperty ∧ K.transitionLaw ∧ K.markovRenewalEquation

theorem markov_renewal_kernel_closed_from_evidence (K : MarkovRenewalKernelPackage) (E : MarkovRenewalKernelEvidence K) :
    MarkovRenewalKernelClosed K := by
  exact And.intro E.semiMarkovPropertyClosed (And.intro E.transitionLawClosed E.markovRenewalEquationClosed)

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse