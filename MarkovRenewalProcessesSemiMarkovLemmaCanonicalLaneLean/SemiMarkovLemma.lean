import HautevilleHouse.MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean.RenewalEquation

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure SemiMarkovLemmaPackage {E : Type u} [TopologicalSpace E]
    (K : SemiMarkovKernel E) (R : RenewalEquation K) where
  limitTheorem : Prop
  asymptoticBehavior : Prop
  markovRenewalProperty : Prop

structure SemiMarkovLemmaEvidence {E : Type u} [TopologicalSpace E]
    {K : SemiMarkovKernel E} {R : RenewalEquation K}
    (S : SemiMarkovLemmaPackage K R) where
  limitTheoremClosed : S.limitTheorem
  asymptoticBehaviorClosed : S.asymptoticBehavior
  markovRenewalPropertyClosed : S.markovRenewalProperty

def SemiMarkovLemmaClosed {E : Type u} [TopologicalSpace E]
    {K : SemiMarkovKernel E} {R : RenewalEquation K}
    (S : SemiMarkovLemmaPackage K R) : Prop :=
  S.limitTheorem ∧ S.asymptoticBehavior ∧ S.markovRenewalProperty

theorem semi_markov_lemma_closed_from_evidence
    {E : Type u} [TopologicalSpace E] {K : SemiMarkovKernel E} {R : RenewalEquation K}
    (S : SemiMarkovLemmaPackage K R) (E' : SemiMarkovLemmaEvidence S) :
    SemiMarkovLemmaClosed S := by
  exact And.intro E'.limitTheoremClosed (And.intro E'.asymptoticBehaviorClosed E'.markovRenewalPropertyClosed)

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse