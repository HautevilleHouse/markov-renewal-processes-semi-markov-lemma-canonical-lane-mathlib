import HautevilleHouse.MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean.RenewalKernel

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure RenewalEquation {E : Type u} [TopologicalSpace E] (K : SemiMarkovKernel E) where
  convolutiveStructure : Prop
  uniqueSolution : Prop
  solutionRegularity : Prop

structure RenewalEquationEvidence {E : Type u} [TopologicalSpace E] {K : SemiMarkovKernel E}
    (R : RenewalEquation K) where
  convolutiveStructureClosed : R.convolutiveStructure
  uniqueSolutionClosed : R.uniqueSolution
  solutionRegularityClosed : R.solutionRegularity

def RenewalEquationClosed {E : Type u} [TopologicalSpace E] {K : SemiMarkovKernel E}
    (R : RenewalEquation K) : Prop :=
  R.convolutiveStructure ∧ R.uniqueSolution ∧ R.solutionRegularity

theorem renewal_equation_closed_from_evidence
    {E : Type u} [TopologicalSpace E] {K : SemiMarkovKernel E}
    (R : RenewalEquation K) (E' : RenewalEquationEvidence R) : RenewalEquationClosed R := by
  exact And.intro E'.convolutiveStructureClosed (And.intro E'.uniqueSolutionClosed E'.solutionRegularityClosed)

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse