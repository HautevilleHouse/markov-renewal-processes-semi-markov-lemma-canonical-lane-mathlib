import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure RenewalEquationPackage where
  kernel : SemiMarkovKernelPackage
  waitingTimeDistribution : ℝ → ℝ
  transitionProbability : stateSpace → stateSpace → ℝ → ℝ
  renewalEquation : stateSpace → stateSpace → ℝ → ℝ
  renewalEquationSatisfied : Prop
  solutionExistence : Prop
  solutionUniqueness : Prop

structure RenewalEquationEvidence (R : RenewalEquationPackage) where
  renewalEquationSatisfiedClosed : R.renewalEquationSatisfied
  solutionExistenceClosed : R.solutionExistence
  solutionUniquenessClosed : R.solutionUniqueness

def RenewalEquationClosed (R : RenewalEquationPackage) : Prop :=
  R.renewalEquationSatisfied ∧ R.solutionExistence ∧ R.solutionUniqueness

theorem renewal_equation_closed_from_evidence (R : RenewalEquationPackage)
    (E : RenewalEquationEvidence R) : RenewalEquationClosed R := by
  exact And.intro E.renewalEquationSatisfiedClosed
    (And.intro E.solutionExistenceClosed E.solutionUniquenessClosed)

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse