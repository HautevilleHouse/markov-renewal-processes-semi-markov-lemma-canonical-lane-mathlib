import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean.MarkovRenewalKernel

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure SemiMarkovEquationPackage where
  renewalEquation : Prop
  solutionExistence : Prop
  solutionUniqueness : Prop
  laplaceTransformForm : Prop

structure SemiMarkovEquationEvidence (E : SemiMarkovEquationPackage) where
  renewalEquationClosed : E.renewalEquation
  solutionExistenceClosed : E.solutionExistence
  solutionUniquenessClosed : E.solutionUniqueness
  laplaceTransformFormClosed : E.laplaceTransformForm

def SemiMarkovEquationClosed (E : SemiMarkovEquationPackage) : Prop :=
  E.renewalEquation ∧ E.solutionExistence ∧ E.solutionUniqueness ∧ E.laplaceTransformForm

theorem semi_markov_equation_closed_from_evidence (E : SemiMarkovEquationPackage) (Ev : SemiMarkovEquationEvidence E) :
    SemiMarkovEquationClosed E := by
  exact And.intro Ev.renewalEquationClosed (And.intro Ev.solutionExistenceClosed (And.intro Ev.solutionUniquenessClosed Ev.laplaceTransformFormClosed))

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse