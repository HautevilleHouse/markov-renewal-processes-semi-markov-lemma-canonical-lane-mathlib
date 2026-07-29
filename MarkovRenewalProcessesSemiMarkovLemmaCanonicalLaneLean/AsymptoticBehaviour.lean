import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean.SemiMarkovLemma

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure AsymptoticBehaviourPackage {A : AdmissibleClass}
    {K : SemiMarkovKernelPackage A} {R : RenewalEquationPackage K}
    (L : SemiMarkovLemmaPackage R) where
  stationarity : Prop
  rateOfConvergence : Prop
  exponentialErgodicity : Prop
  stationarityTerm : stationarity
  rateOfConvergenceTerm : rateOfConvergence
  exponentialErgodicityTerm : exponentialErgodicity

structure AsymptoticBehaviourEvidence {A : AdmissibleClass}
    {K : SemiMarkovKernelPackage A} {R : RenewalEquationPackage K}
    {L : SemiMarkovLemmaPackage R} (B : AsymptoticBehaviourPackage L) where
  stationarityClosed : B.stationarity
  rateOfConvergenceClosed : B.rateOfConvergence
  exponentialErgodicityClosed : B.exponentialErgodicity

def AsymptoticBehaviourClosed {A : AdmissibleClass}
    {K : SemiMarkovKernelPackage A} {R : RenewalEquationPackage K}
    {L : SemiMarkovLemmaPackage R} (B : AsymptoticBehaviourPackage L) : Prop :=
  B.stationarity ∧ B.rateOfConvergence ∧ B.exponentialErgodicity

theorem asymptotic_behaviour_closed_from_evidence {A : AdmissibleClass}
    {K : SemiMarkovKernelPackage A} {R : RenewalEquationPackage K}
    {L : SemiMarkovLemmaPackage R} (B : AsymptoticBehaviourPackage L)
    (E : AsymptoticBehaviourEvidence B) : AsymptoticBehaviourClosed B := by
  exact And.intro E.stationarityClosed (And.intro E.rateOfConvergenceClosed E.exponentialErgodicityClosed)

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse