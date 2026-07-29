import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure SemiMarkovKernelPackage where
  stateSpace : Type u
  measurableStructure : MeasurableSpace stateSpace
  kernel : stateSpace → Set (stateSpace × ℝ) → ℝ
  kernelMeasurable : ∀ x, MeasurableSet (kernel x)
  kernelNormalization : ∀ x, kernel x Set.univ = 1
  semiMarkovProperty : Prop
  markovRenewalEmbedding : Prop

structure SemiMarkovKernelEvidence (K : SemiMarkovKernelPackage) where
  kernelMeasurableClosed : ∀ x, MeasurableSet (K.kernel x)
  kernelNormalizationClosed : ∀ x, K.kernel x Set.univ = 1
  semiMarkovPropertyClosed : K.semiMarkovProperty
  markovRenewalEmbeddingClosed : K.markovRenewalEmbedding

def SemiMarkovKernelClosed (K : SemiMarkovKernelPackage) : Prop :=
  (∀ x, MeasurableSet (K.kernel x)) ∧ (∀ x, K.kernel x Set.univ = 1) ∧
  K.semiMarkovProperty ∧ K.markovRenewalEmbedding

theorem semi_markov_kernel_closed_from_evidence (K : SemiMarkovKernelPackage)
    (E : SemiMarkovKernelEvidence K) : SemiMarkovKernelClosed K := by
  exact And.intro E.kernelMeasurableClosed
    (And.intro E.kernelNormalizationClosed
      (And.intro E.semiMarkovPropertyClosed E.markovRenewalEmbeddingClosed))

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse