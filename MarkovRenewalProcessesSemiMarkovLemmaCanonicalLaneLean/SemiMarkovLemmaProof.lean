import MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean.SemiMarkovEquation

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure SemiMarkovLemmaPackage {K : MarkovRenewalKernelPackage}
    (E : SemiMarkovEquationPackage K) where
  lemmaStatement : Prop
  lemmaProof : Prop
  lemmaApplication : Prop

structure SemiMarkovLemmaEvidence {K : MarkovRenewalKernelPackage}
    {E : SemiMarkovEquationPackage K} (L : SemiMarkovLemmaPackage E) where
  lemmaStatementClosed : L.lemmaStatement
  lemmaProofClosed : L.lemmaProof
  lemmaApplicationClosed : L.lemmaApplication

def SemiMarkovLemmaClosed {K : MarkovRenewalKernelPackage}
    {E : SemiMarkovEquationPackage K} (L : SemiMarkovLemmaPackage E) : Prop :=
  L.lemmaStatement ∧ L.lemmaProof ∧ L.lemmaApplication

theorem semi_markov_lemma_closed_from_evidence
    {K : MarkovRenewalKernelPackage} {E : SemiMarkovEquationPackage K}
    (L : SemiMarkovLemmaPackage E) (Ev : SemiMarkovLemmaEvidence L) :
    SemiMarkovLemmaClosed L := by
  exact And.intro Ev.lemmaStatementClosed
    (And.intro Ev.lemmaProofClosed Ev.lemmaApplicationClosed)

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse
