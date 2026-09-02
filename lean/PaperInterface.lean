import QX26AgenticDelegation.MainTheorems
import QX26AgenticDelegation.Assumptions

/-!
# Human-Facing Paper Interface: Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub

This is the compact Lean file a human should read after formalization to check
whether the paper's definitions and named theorem statements were represented
correctly. Keep the row-level dashboard and LLM audit statements in this file
for every paper. Move implementation details, proof aliases, and bulky helper
lemmas behind imported modules such as `AuditInterface.lean`, but expose the
audited paper-facing statements directly here; do not use
`paper_interface.audit_surface_path`.

Rules for completing this file:

- Keep the paper's definitions/formatted objects first, in source order.
- Expose the actual paper formulas here; do not only point to generic library
  definitions or implementation witnesses.
- A material reusable `EconCSLib` primitive may remain a reference here only
  after `audit/library_semantic_review.json` records its exact bounded library
  declaration and an explicit byte-pinned paper-source connection. The
  dashboard and human-review packet show and source-check that declaration
  before the dependent Spec; a library name, docstring, or glossary is not a
  semantic bridge. Do not add a duplicate paper claim merely to restate it.
- If a named theorem needs a hypothesis that is not derived from earlier Lean
  declarations, declare that hypothesis in `Assumptions.lean` and list it in
  `status.json` `review_surface.assumption_names`.
- Then state the named results directly, with assumptions visible in each
  theorem signature by referencing named paper assumptions imported from
  `Assumptions.lean`.
- In the statement-first phase, write every complete source-facing statement as
  a transparent `<name>Spec : Prop` here, exactly once. Put the paired
  theorem/lemma of that exact type in `ProofInterface.lean`; its temporary
  proof body may be `by sorry` only in a private draft. This separation keeps
  the human semantic surface free of thin wrapper declarations.
- Before drafting that Lean surface, independently inventory every material
  source atom from exact pinned source quote bytes. Do not infer source atoms
  from declaration, binder, field, function, or source-map names.
- Run raw-source-to-expanded-Spec statement matching plus recursive
  premise/conclusion provenance on the skeleton. The semantic comparison uses
  only byte-pinned source quotes (and separately pinned source context) against
  the expanded transparent Spec; map summaries and proof wrappers are not
  semantic inputs. Then freeze each canonical Lean declaration-manifest digest.
- In the proof phase, replace the `ProofInterface.lean` `sorry` with a short
  proof that calls into `MainTheorems.lean` or lower proof files without
  changing the specification or theorem type. Any specification/type change
  invalidates the freeze and requires a fresh statement audit.
- At formalized closeout, complete the v11 realization receipt: Lean Meta checks
  the theorem has exactly the transparent Spec type; each source atom is bound
  to the elaborated Spec surface; closure traversal includes proof and instance
  arguments; and every material terminal has a source, approved correction or
  additional assumption, checked derivation, or version-pinned foundation
  disposition. No data, container, or identifier-based exemption is allowed.
- The transparent `...Spec` is the sole semantic-review target for its source
  claim. The paired theorem/lemma is a proof endpoint whose exact Spec type is
  verified by Lean Meta, not a duplicate source-to-Lean comparison row.
- Keep proof endpoints, exhaustive endpoint aliases, and proof-seam checks in
  `ProofInterface.lean`, implementation modules, or `ProofLedger.lean`, not
  here. Do not create new `PostPaperAudit.lean` or `AuditLedger.lean` files;
  those names are legacy.

## Named Results

Each entry has one semantic-review target (`Spec`) and one proof endpoint (the
paired theorem/lemma). The human dashboard and review packet present that pair
once rather than treating the two declarations as duplicate paper claims.

- `frontier_expansionSpec` -> `frontier_expansion`: Proposition 1 (Frontier expansion), label prop:frontier, sections/03_theory.tex:155-159.
- `activation_bandSpec` -> `activation_band`: Proposition 2 (Activation band for unfamiliar languages), label prop:band, sections/03_theory.tex:165-184.
- `dynamic_cumulative_language_effectSpec` -> `dynamic_cumulative_language_effect`: Proposition 3 (Dynamic cumulative-language effect), label prop:dynamic, sections/03_theory.tex:282-296.
- `specialist_and_ability_heterogeneitySpec` -> `specialist_and_ability_heterogeneity`: Proposition 4 (Specialist and ability heterogeneity), label prop:specialist, sections/10_appendix.tex:138-150.
- `repository_expansionSpec` -> `repository_expansion`: Proposition 5 (Repository expansion), label prop:repos, sections/10_appendix.tex:251-259.
-/

namespace QX26AgenticDelegation

/--
Proposition 1 (Frontier expansion), label prop:frontier

Paper statement: For every developer, language, date, and opportunity realization, $Z^2_{ik,t}\ge Z^1_{ik,t}$, hence $N^2_{it}\ge N^1_{it}$ path by path.

Source location: sections/03_theory.tex:155-159
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def frontier_expansionSpec : Prop :=
  ∀ (Developer Language Date : Type) [Fintype Language]
      (solo : Developer → Language → Date → ℝ)
      (copilot : Developer → Language → Date → ℝ)
      (delegated : Developer → Language → Date → ℝ),
      let activeBefore := fun i k t =>
        if 0 ≤ max (solo i k t) (copilot i k t) then (1 : ℕ) else 0
      let activeAfter := fun i k t =>
        if 0 ≤ max (max (solo i k t) (copilot i k t)) (delegated i k t)
        then (1 : ℕ) else 0
      (∀ i k t, activeBefore i k t ≤ activeAfter i k t) ∧
        ∀ i t, (∑ k, activeBefore i k t) ≤ ∑ k, activeAfter i k t

/--
Proposition 2 (Activation band for unfamiliar languages), label prop:band

Paper statement: Consider an unfamiliar language satisfying Assumption \ref{ass:foothold}. If $B_{ik,t}>0$, then $Z^2_{ik,t}-Z^1_{ik,t}=\1{T^D_{ik,t}\le\omega_{ik,t}<T^S_{ik,t}}$. If the conditional opportunity CDF $F_{ik,t}$ is continuous, the probability that delegation activates the language is $F_{ik,t}(T^S_{ik,t})-F_{ik,t}(T^D_{ik,t})$, and the expected language-count expansion is $\E[N^2_{it}-N^1_{it}]=\sum_k[F_{ik,t}(T^1_{ik,t})-F_{ik,t}(T^2_{ik,t})]\ge0$.

Source location: sections/03_theory.tex:165-184
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def activation_bandSpec : Prop :=
  ∀ (Language : Type) [Fintype Language]
      (law : Language → MeasureTheory.Measure ℝ)
      (hProbability : ∀ k, MeasureTheory.IsProbabilityMeasure (law k))
      (hNoAtoms : ∀ k, MeasureTheory.NoAtoms (law k))
      (soloThreshold delegateThreshold augmentationGain opportunity : Language → ℝ),
      let generationOneThreshold := fun k =>
        soloThreshold k - max 0 (augmentationGain k)
      let generationTwoThreshold := fun k =>
        min (generationOneThreshold k) (delegateThreshold k)
      let activeBefore := fun k =>
        if generationOneThreshold k ≤ opportunity k then (1 : ℤ) else 0
      let activeAfter := fun k =>
        if generationTwoThreshold k ≤ opportunity k then (1 : ℤ) else 0
      let cdf := fun k x => (law k (Set.Iic x)).toReal
      ((∀ k, augmentationGain k ≤ 0 →
          0 < soloThreshold k - delegateThreshold k →
          activeAfter k - activeBefore k =
            if delegateThreshold k ≤ opportunity k ∧
                opportunity k < soloThreshold k then 1 else 0) ∧
        (∀ k, augmentationGain k ≤ 0 →
          0 < soloThreshold k - delegateThreshold k →
          (law k (Set.Ico (delegateThreshold k) (soloThreshold k))).toReal =
            cdf k (soloThreshold k) - cdf k (delegateThreshold k)) ∧
        (∑ k, ((law k (Set.Ici (generationTwoThreshold k))).toReal -
            (law k (Set.Ici (generationOneThreshold k))).toReal)) =
          ∑ k, (cdf k (generationOneThreshold k) -
            cdf k (generationTwoThreshold k))) ∧
        0 ≤ ∑ k, (cdf k (generationOneThreshold k) -
          cdf k (generationTwoThreshold k))

/--
Proposition 3 (Dynamic cumulative-language effect), label prop:dynamic

Paper statement: For an initially unfamiliar language, let $p^g_{ik}$ be the per-period first-use hazard under generation $g$. If $p^2_{ik}\ge p^1_{ik}$, the expected cumulative-language effect at event-time horizon $s$ is $\Delta C_i(s)=\sum_{k\in\mathcal{U}_i}[(1-p^1_{ik})^{s+1}-(1-p^2_{ik})^{s+1}]\ge0$, which in the closed-frontier benchmark $p^1_{ik}=0<p^2_{ik}$ is strictly increasing and concave over the observed horizon.

Source location: sections/03_theory.tex:282-296
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def dynamic_cumulative_language_effectSpec : Prop :=
  ∀ (Language : Type) [DecidableEq Language]
      (unfamiliar : Finset Language) (p₁ p₂ : Language → ℝ)
      (hHazards : ∀ k ∈ unfamiliar, 0 ≤ p₁ k ∧ p₁ k ≤ p₂ k ∧ p₂ k ≤ 1),
      let cumulativeGap := fun s : ℕ =>
        ∑ k ∈ unfamiliar, ((1 - p₁ k) ^ (s + 1) - (1 - p₂ k) ^ (s + 1))
      (∀ s, 0 ≤ cumulativeGap s) ∧
        (unfamiliar.Nonempty ∧
          (∀ k ∈ unfamiliar, p₁ k = 0 ∧ 0 < p₂ k ∧ p₂ k < 1) →
          StrictMono cumulativeGap ∧
            ∀ s, cumulativeGap (s + 2) - cumulativeGap (s + 1) <
              cumulativeGap (s + 1) - cumulativeGap s)

/--
Proposition 4 (Specialist and ability heterogeneity), label prop:specialist

Paper statement: Under Assumption \ref{ass:exchangeable}, expected expansion into initially unfamiliar languages is $\E[E_i\mid a_i,U_i]=U_i p_i(a_i,A)$, $E_i\equiv\sum_{k\in\mathcal{U}_i}(Z^2_{ik}-Z^1_{ik})$. It is increasing in the stock of unfamiliar-language candidates $U_i$ and in general ability $a_i$. The largest extensive-margin gains accrue to high-ability specialists.

Source location: sections/10_appendix.tex:138-150
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def specialist_and_ability_heterogeneitySpec : Prop :=
  ∀ (Language : Type) [DecidableEq Language]
      (unfamiliar : Finset Language) (activationIncrement : Language → ℝ)
      (p : ℝ → ℝ → ℝ) (ability capability : ℝ)
      (hComparable : ∀ k ∈ unfamiliar, activationIncrement k = p ability capability)
      (hNonnegative : ∀ a, 0 ≤ p a capability)
      (hAbilityMonotone : Monotone fun a => p a capability),
      let expectedExpansion := ∑ k ∈ unfamiliar, activationIncrement k
      expectedExpansion = (unfamiliar.card : ℝ) * p ability capability ∧
        (∀ u₁ u₂ : ℕ, u₁ ≤ u₂ →
          (u₁ : ℝ) * p ability capability ≤ (u₂ : ℝ) * p ability capability) ∧
        (∀ a₁ a₂ : ℝ, a₁ ≤ a₂ →
          (unfamiliar.card : ℝ) * p a₁ capability ≤
            (unfamiliar.card : ℝ) * p a₂ capability) ∧
        ∀ (u : ℕ) (a : ℝ), u ≤ unfamiliar.card → a ≤ ability →
          (u : ℝ) * p a capability ≤
            (unfamiliar.card : ℝ) * p ability capability

/--
Proposition 5 (Repository expansion), label prop:repos

Paper statement: Suppose each repository requires at least one programming language and carries an entry cost that is weakly decreasing when the developer can activate that language. If agentic delegation weakly expands the active-language set, then the expected number of repositories the developer can contribute to weakly increases. It increases strictly when some repositories require languages in the delegation activation band.

Source location: sections/10_appendix.tex:251-259
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def repository_expansionSpec : Prop :=
  ∀ (Repository : Type) [Fintype Repository]
      (law : Repository → MeasureTheory.Measure ℝ)
      (hProbability : ∀ r, MeasureTheory.IsProbabilityMeasure (law r))
      (entryCostBefore entryCostAfter : Repository → ℝ)
      (hCost : ∀ r, entryCostAfter r ≤ entryCostBefore r),
      let expectedBefore :=
        ∑ r, (law r (Set.Ici (entryCostBefore r))).toReal
      let expectedAfter :=
        ∑ r, (law r (Set.Ici (entryCostAfter r))).toReal
      expectedBefore ≤ expectedAfter ∧
        ((∃ r, 0 < (law r
            (Set.Ico (entryCostAfter r) (entryCostBefore r))).toReal) →
          expectedBefore < expectedAfter)

end QX26AgenticDelegation
