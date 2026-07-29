import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean

structure MarkovRenewalSpace where
  carrier : Type
  stateSpace : TopologicalSpace carrier

structure MarkovRenewalAdmittedObject where
  space : MarkovRenewalSpace
  kernel : carrier → carrier → Prop
  semiMarkovProperty : Prop
  conclusion : semiMarkovProperty

structure AdmissibleClass where
  object : MarkovRenewalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.semiMarkovProperty) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MarkovRenewalProcessesSemiMarkovLemmaCanonicalLaneLean
end HautevilleHouse