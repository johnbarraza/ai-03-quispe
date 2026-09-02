import QX26AgenticDelegation.PaperInterface

/-!
# Proof Interface: Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub

This file contains exact-type proof endpoints for the transparent propositions
in `PaperInterface.lean`. It is not a human semantic-review surface: one source
claim is reviewed once, against its expanded `...Spec : Prop` declaration.
-/

namespace QX26AgenticDelegation

/--
Lean proof endpoint for `frontier_expansionSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem frontier_expansion :
  frontier_expansionSpec := by
  intro Developer Language Date _ solo copilot delegated
  dsimp
  constructor
  · intro i k t
    by_cases h : 0 ≤ max (solo i k t) (copilot i k t)
    · have h' : 0 ≤ max (max (solo i k t) (copilot i k t)) (delegated i k t) :=
        le_trans h (le_max_left _ _)
      simp [h, h']
    · simp [h]
  · intro i t
    apply Finset.sum_le_sum
    intro k _
    by_cases h : 0 ≤ max (solo i k t) (copilot i k t)
    · have h' : 0 ≤ max (max (solo i k t) (copilot i k t)) (delegated i k t) :=
        le_trans h (le_max_left _ _)
      simp [h, h']
    · simp [h]

/--
Lean proof endpoint for `activation_bandSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem activation_band :
  activation_bandSpec := by
  intro Language _ law hProbability hNoAtoms soloThreshold delegateThreshold
    augmentationGain opportunity
  dsimp
  have hCdfDiff : ∀ k a b, a ≤ b →
      (law k (Set.Ico a b)).toReal =
        (law k (Set.Iic b)).toReal - (law k (Set.Iic a)).toReal := by
    intro k a b hab
    letI := hProbability k
    letI := hNoAtoms k
    have hInterval : law k (Set.Ico a b) = law k (Set.Ioc a b) :=
      MeasureTheory.measure_congr MeasureTheory.Ico_ae_eq_Ioc
    have hUnion : Set.Iic a ∪ Set.Ioc a b = Set.Iic b := by
      ext x
      constructor
      · rintro (hx | hx)
        · exact le_trans hx hab
        · exact hx.2
      · intro hx
        by_cases hxa : x ≤ a
        · exact Or.inl hxa
        · exact Or.inr ⟨lt_of_not_ge hxa, hx⟩
    have hDisjoint : Disjoint (Set.Iic a) (Set.Ioc a b) := by
      refine Set.disjoint_left.2 ?_
      intro x hxa hxab
      exact (not_lt_of_ge hxa) hxab.1
    have hMeasure :=
      MeasureTheory.measure_union (μ := law k) hDisjoint measurableSet_Ioc
    rw [hUnion] at hMeasure
    have hToReal :
        (law k (Set.Iic b)).toReal =
          (law k (Set.Iic a)).toReal + (law k (Set.Ioc a b)).toReal := by
      rw [hMeasure, ENNReal.toReal_add (by simp) (by simp)]
    rw [hInterval]
    linarith
  have hTailDiff : ∀ k a b, a ≤ b →
      (law k (Set.Ici a)).toReal - (law k (Set.Ici b)).toReal =
        (law k (Set.Ico a b)).toReal := by
    intro k a b hab
    letI := hProbability k
    have hUnion : Set.Ico a b ∪ Set.Ici b = Set.Ici a := by
      ext x
      constructor
      · rintro (hx | hx)
        · exact hx.1
        · exact le_trans hab hx
      · intro hx
        by_cases hxb : x < b
        · exact Or.inl ⟨hx, hxb⟩
        · exact Or.inr (le_of_not_gt hxb)
    have hDisjoint : Disjoint (Set.Ico a b) (Set.Ici b) := by
      refine Set.disjoint_left.2 ?_
      intro x hxab hxb
      exact (not_lt_of_ge hxb) hxab.2
    have hMeasure :=
      MeasureTheory.measure_union (μ := law k) hDisjoint measurableSet_Ici
    rw [hUnion] at hMeasure
    have hToReal :
        (law k (Set.Ici a)).toReal =
          (law k (Set.Ico a b)).toReal + (law k (Set.Ici b)).toReal := by
      rw [hMeasure, ENNReal.toReal_add (by simp) (by simp)]
    linarith
  constructor
  · constructor
    · intro k hAug hBand
      have hThreshold : soloThreshold k - max 0 (augmentationGain k) = soloThreshold k := by
        rw [max_eq_left (by linarith)]
        ring
      have hDelegate : delegateThreshold k < soloThreshold k := by linarith
      simp only [hThreshold]
      rw [min_eq_right (le_of_lt hDelegate)]
      by_cases hD : delegateThreshold k ≤ opportunity k
      · by_cases hS : soloThreshold k ≤ opportunity k
        · simp [hD, hS, not_lt_of_ge hS]
        · simp [hD, hS, lt_of_not_ge hS]
      · have hS : ¬ soloThreshold k ≤ opportunity k := by
          intro hs
          exact hD (le_trans (le_of_lt hDelegate) hs)
        simp [hD, hS]
    · constructor
      · intro k hAug hBand
        have hDelegate : delegateThreshold k ≤ soloThreshold k := by linarith
        exact hCdfDiff k _ _ hDelegate
      · apply Finset.sum_congr rfl
        intro k _
        have hMin : min (soloThreshold k - max 0 (augmentationGain k))
            (delegateThreshold k) ≤ soloThreshold k - max 0 (augmentationGain k) :=
          min_le_left _ _
        rw [hTailDiff k _ _ hMin, hCdfDiff k _ _ hMin]
  · apply Finset.sum_nonneg
    intro k _
    have hMin : min (soloThreshold k - max 0 (augmentationGain k))
        (delegateThreshold k) ≤ soloThreshold k - max 0 (augmentationGain k) :=
      min_le_left _ _
    exact sub_nonneg.mpr (ENNReal.toReal_mono (by simp)
      (MeasureTheory.measure_mono (Set.Iic_subset_Iic.2 hMin)))

/--
Lean proof endpoint for `dynamic_cumulative_language_effectSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem dynamic_cumulative_language_effect :
  dynamic_cumulative_language_effectSpec := by
  intro Language _ unfamiliar p₁ p₂ hHazards
  dsimp
  constructor
  · intro s
    apply Finset.sum_nonneg
    intro k hk
    have hkBounds := hHazards k hk
    have hbaseNonneg : 0 ≤ 1 - p₂ k := by linarith
    have hbaseLe : 1 - p₂ k ≤ 1 - p₁ k := by linarith
    have hpow := pow_le_pow_left₀ hbaseNonneg hbaseLe (s + 1)
    linarith
  · rintro ⟨hNonempty, hClosed⟩
    constructor
    · apply strictMono_nat_of_lt_succ
      intro s
      apply Finset.sum_lt_sum_of_nonempty hNonempty
      intro k hk
      have hkClosed := hClosed k hk
      have hqPos : 0 < 1 - p₂ k := by linarith
      have hqLt : 1 - p₂ k < 1 := by linarith
      have hpow := pow_lt_pow_right_of_lt_one₀ hqPos hqLt (Nat.lt_succ_self (s + 1))
      simpa [hkClosed.1, Nat.succ_eq_add_one, add_assoc] using
        (sub_lt_sub_left hpow 1)
    · intro s
      have hGap (n : ℕ) :
          (∑ k ∈ unfamiliar,
            ((1 - p₁ k) ^ (n + 1) - (1 - p₂ k) ^ (n + 1))) =
            ∑ k ∈ unfamiliar, (1 - (1 - p₂ k) ^ (n + 1)) := by
        apply Finset.sum_congr rfl
        intro k hk
        simp [(hClosed k hk).1]
      rw [hGap (s + 2), hGap (s + 1), hGap s,
        ← Finset.sum_sub_distrib, ← Finset.sum_sub_distrib]
      apply Finset.sum_lt_sum_of_nonempty hNonempty
      intro k hk
      have hkClosed := hClosed k hk
      have hqPos : 0 < 1 - p₂ k := by linarith
      have hqLt : 1 - p₂ k < 1 := by linarith
      have hpow := pow_lt_pow_right_of_lt_one₀ hqPos hqLt (Nat.lt_succ_self (s + 1))
      have hpow' : (1 - p₂ k) ^ (s + 2) < (1 - p₂ k) ^ (s + 1) := by
        simpa [Nat.succ_eq_add_one, add_assoc] using hpow
      have hmul := mul_lt_mul_of_pos_left hpow' hkClosed.2.1
      rw [show s + 2 + 1 = (s + 1 + 1) + 1 by omega, pow_succ]
      rw [show s + 1 + 1 = (s + 1) + 1 by omega, pow_succ]
      ring_nf at hmul ⊢
      exact hmul

/--
Lean proof endpoint for `specialist_and_ability_heterogeneitySpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem specialist_and_ability_heterogeneity :
  specialist_and_ability_heterogeneitySpec := by
  intro Language _ unfamiliar activationIncrement p ability capability
    hComparable hNonnegative hAbilityMonotone
  dsimp
  have hExpansion :
      (∑ k ∈ unfamiliar, activationIncrement k) =
        (unfamiliar.card : ℝ) * p ability capability := by
    calc
      (∑ k ∈ unfamiliar, activationIncrement k) =
          ∑ k ∈ unfamiliar, p ability capability := by
            apply Finset.sum_congr rfl
            intro k hk
            exact hComparable k hk
      _ = (unfamiliar.card : ℝ) * p ability capability := by simp
  refine ⟨hExpansion, ?_, ?_, ?_⟩
  · intro u₁ u₂ hu
    exact mul_le_mul_of_nonneg_right (Nat.cast_le.mpr hu) (hNonnegative ability)
  · intro a₁ a₂ ha
    exact mul_le_mul_of_nonneg_left (hAbilityMonotone ha) (Nat.cast_nonneg _)
  · intro u a hu ha
    calc
      (u : ℝ) * p a capability ≤ (u : ℝ) * p ability capability :=
        mul_le_mul_of_nonneg_left (hAbilityMonotone ha) (Nat.cast_nonneg _)
      _ ≤ (unfamiliar.card : ℝ) * p ability capability :=
        mul_le_mul_of_nonneg_right (Nat.cast_le.mpr hu) (hNonnegative ability)

/--
Lean proof endpoint for `repository_expansionSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem repository_expansion :
  repository_expansionSpec := by
  intro Repository _ law hProbability entryCostBefore entryCostAfter hCost
  dsimp
  have hTerm : ∀ r,
      (law r (Set.Ici (entryCostBefore r))).toReal ≤
        (law r (Set.Ici (entryCostAfter r))).toReal := by
    intro r
    letI := hProbability r
    apply ENNReal.toReal_mono (by simp)
    apply MeasureTheory.measure_mono
    intro x hx
    exact le_trans (hCost r) hx
  constructor
  · apply Finset.sum_le_sum
    intro r _
    exact hTerm r
  · rintro ⟨r, hrPositive⟩
    apply Finset.sum_lt_sum
    · intro i _
      exact hTerm i
    · refine ⟨r, Finset.mem_univ r, ?_⟩
      letI := hProbability r
      have hUnion :
          Set.Ico (entryCostAfter r) (entryCostBefore r) ∪
              Set.Ici (entryCostBefore r) = Set.Ici (entryCostAfter r) := by
        ext x
        constructor
        · rintro (hx | hx)
          · exact hx.1
          · exact le_trans (hCost r) hx
        · intro hx
          by_cases hxb : x < entryCostBefore r
          · exact Or.inl ⟨hx, hxb⟩
          · exact Or.inr (le_of_not_gt hxb)
      have hDisjoint :
          Disjoint (Set.Ico (entryCostAfter r) (entryCostBefore r))
            (Set.Ici (entryCostBefore r)) := by
        refine Set.disjoint_left.2 ?_
        intro x hxIco hxIci
        exact (not_lt_of_ge hxIci) hxIco.2
      have hMeasure :=
        MeasureTheory.measure_union (μ := law r) hDisjoint measurableSet_Ici
      rw [hUnion] at hMeasure
      have hToReal :
          (law r (Set.Ici (entryCostAfter r))).toReal =
            (law r (Set.Ico (entryCostAfter r) (entryCostBefore r))).toReal +
              (law r (Set.Ici (entryCostBefore r))).toReal := by
        rw [hMeasure, ENNReal.toReal_add (by simp) (by simp)]
      linarith

end QX26AgenticDelegation
