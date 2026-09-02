<p align="center">
  <img src="assets/banner.svg" width="100%" alt="Agentic Delegation and the Language Frontier banner">
</p>

<p align="center">
  <a href="paper/quispe-xu-2026.pdf"><img alt="Paper" src="https://img.shields.io/badge/Paper-PDF-0f766e?style=for-the-badge&logo=adobeacrobatreader&logoColor=white"></a>
  <a href="https://doi.org/10.48550/arXiv.2605.25438"><img alt="DOI" src="https://img.shields.io/badge/DOI-10.48550%2FarXiv.2605.25438-2563eb?style=for-the-badge"></a>
  <a href="presentation.pdf"><img alt="Short deck" src="https://img.shields.io/badge/Short_deck-PDF-f59e0b?style=for-the-badge"></a>
  <a href="extended-presentation.pdf"><img alt="Extended deck" src="https://img.shields.io/badge/Extended_deck-PDF-d97706?style=for-the-badge"></a>
  <a href="presentation.tex"><img alt="LaTeX sources" src="https://img.shields.io/badge/LaTeX-Sources-008080?style=for-the-badge&logo=latex&logoColor=white"></a>
  <a href="analysis/symbolic_audit.py"><img alt="SymPy audit" src="https://img.shields.io/badge/SymPy-Audit-3B5526?style=for-the-badge&logo=sympy&logoColor=white"></a>
  <a href="lean/README.md"><img alt="Lean formalization" src="https://img.shields.io/badge/Lean-5%2F5_proofs-0d9488?style=for-the-badge"></a>
  <a href="LICENSE.md"><img alt="License" src="https://img.shields.io/badge/License-CC_BY_4.0-lightgrey?style=for-the-badge"></a>
</p>

<p align="center">
  <img alt="LaTeX" src="https://img.shields.io/badge/LaTeX-008080?logo=latex&logoColor=white">
  <img alt="Beamer" src="https://img.shields.io/badge/Beamer-1f4e79?logo=latex&logoColor=white">
  <img alt="Python" src="https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white">
  <img alt="SymPy" src="https://img.shields.io/badge/SymPy-3B5526?logo=sympy&logoColor=white">
  <img alt="GitHub" src="https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white">
</p>

# Agentic Delegation and the Language Frontier

> **Verified citation.** Quispe, Alexander, and Kevin Xu. 2026. “Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub.” *arXiv* preprint arXiv:2605.25438v2, July 8, 2026. <https://doi.org/10.48550/arXiv.2605.25438>.

**Status correction.** This is a preliminary, unrefereed **arXiv economics preprint**, not an NBER working paper. Version 1 was submitted May 25, 2026; version 2 was posted July 7, and the PDF is dated July 8. The earlier version circulated as *Coding Beyond Your Training: Claude Code and the Technological Frontier of Software Developers* and listed only Alexander Quispe. The current paper has two authors: **Alexander Quispe and Kevin Xu**.

**Formalization status.** The required EconCSLib run produced the complete `QX26AgenticDelegation` paper folder. All five selected theorem endpoints compile without `sorry`; `lake build QX26AgenticDelegation` passed with 8,318 jobs and the official fast contribution check passed. The honest protocol status is still **partially formalized**, because EconCSLib's independent source-fidelity audits and human dashboard sign-off have not been completed. See the [validation report](lean/FINAL_VALIDATION_REPORT.md).

## The question and the single mechanism

Does agentic AI expand the set of programming languages in which a developer can ship working code—not merely make the developer faster in languages already known?

The single mechanism is **delegation lowering a language-specific entry threshold**. Conversational assistance requires enough language-specific skill to read and integrate suggestions. An agent can instead execute from a natural-language specification while the developer specifies, decomposes, and verifies. This can make an unfamiliar-language project profitable without implying that the developer learned the language.

The model separates three production capabilities:

1. **Solo:** the developer executes using language-specific skill.
2. **Augmentation:** a conversational assistant adds suggestions proportional to existing skill.
3. **Delegation:** an agent executes a share of the task, using the developer’s general specification-and-verification ability.

## The developer’s problem

For developer (i), language (k), and month (t), the developer observes opportunity value (omega_{ikt}) and chooses the best available mode. Before agentic adoption the menu is (M^1=\{S,C\}); afterward it is (M^2=\{S,C,D\}):

```math
V^g_{ikt}=\max_{m\in M^g}V^m_{ikt},\qquad
Z^g_{ikt}=\mathbf 1\{V^g_{ikt}\ge 0\}.
```

The language is used only if its best certainty-equivalent surplus is nonnegative. Payoffs combine opportunity value, activation cost, language-specific skill and uncertain match quality, general ability, AI competence, verification/compute costs, and risk. **There is no continuous effort choice in the paper’s core model.** Calling this an “effort problem” would import a different model; the choice here is discrete mode selection and entry.

## Main theoretical results

For an unfamiliar language, Assumption 1 says conversational augmentation does not improve the entry margin, so (T^1=T^S). Delegation has threshold (T^D), and its advantage is (B=T^S-T^D).

**Proposition 1 — weak frontier expansion.** Adding delegation cannot remove an option:

```math
M^1\subset M^2 \quad\Longrightarrow\quad Z^2_{ikt}\ge Z^1_{ikt},\qquad N^2_{it}\ge N^1_{it}.
```

**Proposition 2 — activation band.** If the language is unfamiliar, augmentation requires a foothold, and delegation strictly lowers its threshold ((B>0)), then:

```math
Z^2_{ikt}-Z^1_{ikt}=\mathbf 1\{T^D_{ikt}\le\omega_{ikt}<T^1_{ikt}\}.
```

Thus the agent activates opportunities in the middle: too weak for solo/conversational production, but strong enough under delegation. With a continuous conditional CDF (F), the per-language activation probability is (F(T^1)-F(T^D)).

**Proposition 3 — stock-flow implication.** If the per-period first-use hazard is weakly higher under delegation, (p^2_{ik}\ge p^1_{ik}), the expected cumulative-language effect is nonnegative. In the closed-frontier benchmark (p^1_{ik}=0<p^2_{ik}), it grows strictly and concavely over the observed horizon. Hence first uses may spike and revert while cumulative breadth continues rising.

The longer threshold algebra, dynamic formula, assumptions, and endpoint caveat are in [`extensions.md`](extensions.md).

## Data and empirical design

The balanced panel spans **January 2024–April 2026 (28 months)**. The initial panel has 5,825 developers; after requiring pre-adoption activity and excluding detectable prior users of competing agents, the estimation sample has:

| Object | Size |
|---|---:|
| Developers | **5,346** |
| Treated / not-yet-treated controls | **2,813 / 2,533** |
| Developer-month observations | **149,688** |
| Reconstructed commits | **3.2 million** |
| Developer–repository pairs | **133,000** |
| Changed files classified with GitHub Linguist | **57 million** |
| Claude-coauthored commits in treatment-detection universe | **7.8 million** |

Adoption is the first commit with a machine-readable Claude co-author trailer. The paper estimates doubly robust Callaway–Sant’Anna staggered-adoption event studies, using not-yet-treated developers, one month of anticipation, varying base periods, and 1,000 developer-clustered multiplier-bootstrap iterations.

## Main empirical results

At adoption ((e=0)):

| Outcome | Estimate | Bootstrap SE | Reference point |
|---|---:|---:|---|
| Active programming languages | **+2.528** | 0.063 | pre-adoption mean 0.90 |
| Newly used languages | **+1.193** | 0.051 | pre-adoption monthly flow 0.31 |
| Language entropy | **+0.382** | 0.009 | pre-adoption mean 0.15 |
| Cumulative languages | **+1.604** | 0.054 | rises to 1.892 at (e=1), 2.072 at (e=2) |
| Repositories | **+1.494** | 0.058 | activity diagnostic |
| Monthly commits | **+35.080** | 2.085 | activity diagnostic |

Active languages remain higher at (e=1) (**+1.227**, SE 0.064) and (e=2) (**+0.693**, SE 0.067). Newly used languages fall to **+0.126** (SE 0.034) at (e=1) and are statistically indistinguishable from zero at (e=2), matching the predicted flow-versus-stock pattern. Among high-ability developers, specialists add **0.981** new languages at adoption versus **0.301** for generalists; among low-ability developers the comparison is **2.388** versus **1.015**.

The results survive removing the first-Claude language, excluding every Claude-coauthored commit, conditioning on activity, stricter activity filters, and screening competing agents. The cumulative outcome has significant pre-trends, so the authors correctly treat it as descriptive rather than headline causal evidence.

## Economic conclusion and identification limit

The evidence is consistent with agentic AI expanding a developer’s **production frontier**: general specification-and-verification ability can be deployed across languages even when language-specific execution skill is low. The comparative advantage of generalists in reasoning may therefore become usable in domains previously blocked by specialized implementation costs.

This is **not** evidence that developers acquire language skill, and it is not a definitive causal effect. Adoption is voluntary and can coincide with an unfamiliar-language project shock. The estimates are event-time associations whose specialist pattern and robustness checks support—but do not identify—the delegation mechanism.

## Repository map

```text
ai-03-quispe/
├── README.md
├── assets/banner.svg
├── analysis/symbolic_audit.py
├── extensions.md
├── hand/README.md
├── lean/                         # full QX26AgenticDelegation EconCSLib output (5/5 proofs)
├── paper/quispe-xu-2026.pdf
├── presentation.tex/.pdf        # short deck
├── extended-presentation.tex/.pdf
├── prompts.md
└── LICENSE.md
```

The student must later add **their own handwritten photo** under `hand/`; no generated substitute counts.
