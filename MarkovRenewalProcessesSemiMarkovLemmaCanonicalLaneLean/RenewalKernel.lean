import Mathlib.MeasureTheory.Integral

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure SemiMarkovKernel (E : Type u) [TopologicalSpace E] where
  Q : E → Set (ℝ × E)
  measurability : ∀ x, MeasurableSet (Q x)
  nonnegativity : ∀ x (s : ℝ) (y : E), (s ≥ 0) → 0 ≤ (Q x (s, y))
  renewalProperty : ∀ x, (∫ s in Ioi 0, ∫ y in Set.univ, Q x (s, y) ∂(volume : Measure ℝ) ∂(volume : Measure E)) = 1

structure RenewalKernelEvidence {E : Type u} [TopologicalSpace E] (K : SemiMarkovKernel E) where
  measurabilityClosed : K.measurability
  nonnegativityClosed : K.nonnegativity
  renewalPropertyClosed : K.renewalProperty

def SemiMarkovKernelClosed {E : Type u} [TopologicalSpace E] (K : SemiMarkovKernel E) : Prop :=
  K.measurability ∧ K.nonnegativity ∧ K.renewalProperty

theorem semi_markov_kernel_closed_from_evidence
    {E : Type u} [TopologicalSpace E] (K : SemiMarkovKernel E)
    (E' : RenewalKernelEvidence K) : SemiMarkovKernelClosed K := by
  exact And.intro E'.measurabilityClosed (And.intro E'.nonnegativityClosed E'.renewalPropertyClosed)

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse