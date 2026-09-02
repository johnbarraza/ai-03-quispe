# Extensions and audit notes

This file keeps derivations and qualification details out of the one-page conceptual README.

## 1. Certainty-equivalent payoffs

Suppressing developer, language, and time subscripts, the three mode surpluses are

$$
V^S=\omega+s\mu-\frac{\rho s^2}{2\pi}-b,
$$

$$
V^C=V^S+\gamma s-r_C,
$$

and

$$
V^D=\omega+(1-\lambda)s\mu+\lambda a z(A)-\kappa(a,s)-r_D-b
-\frac{\rho}{2}\left[\frac{(1-\lambda)^2s^2}{\pi}+\sigma_D^2(a,s,A)\right].
$$

These are certainty equivalents under CARA utility and Normal match uncertainty. Here (s\in[0,1]) is language-specific execution skill, (a\ge0) is general specification-and-verification ability, (A) is agent capability, (\lambda\in(0,1]) is the delegated execution share, and (\pi) is belief precision.

## 2. Threshold derivation

Solo entry requires

$$
\omega\ge T^S=b-s\mu+\frac{\rho s^2}{2\pi}.
$$

Conversational entry requires (\omega\ge T^C=T^S-(\gamma s-r_C)), so

$$
T^1=\min\{T^S,T^C\}=T^S-\max\{0,\gamma s-r_C\}.
$$

Assumption 1 imposes (\gamma s-r_C\le0) for an unfamiliar language, hence (T^1=T^S). Delegation requires

$$
T^D=b-(1-\lambda)s\mu-\lambda az(A)+\kappa(a,s)+r_D
+\frac{\rho}{2}\left[\frac{(1-\lambda)^2s^2}{\pi}+\sigma_D^2(a,s,A)\right].
$$

The delegation advantage for an unfamiliar language is

$$
B=T^S-T^D
=\lambda[az(A)-s\mu]-\kappa(a,s)-r_D
+\frac{\rho}{2}\left[\frac{(2\lambda-\lambda^2)s^2}{\pi}-\sigma_D^2(a,s,A)\right].
$$

If (B>0), then (T^D<T^1=T^S) and the activation band is ([T^D,T^1)).

## 3. Conditions behind the propositions

- Proposition 1 uses only menu inclusion, (M^1\subset M^2), and the same activation rule under both menus. It is weak: delegation may never be selected.
- Proposition 2 additionally requires an unfamiliar language satisfying Assumption 1 and (B>0). Continuity of the opportunity CDF is required for the stated probability (F(T^1)-F(T^D)), not for the pathwise indicator identity.
- Assumption 2 says verification costs and residual error weakly fall with developer ability, language familiarity, and agent capability. This supports comparative statics but does not itself guarantee (B>0).
- Proposition 4’s specialist prediction needs Assumption 3: conditional on developer characteristics, unfamiliar candidates share a common per-language activation increment (p_i(a_i,A)). A smaller familiar set then mechanically creates more candidates.

## 4. Dynamic proposition and endpoint check

For an initially unfamiliar language with constant per-period first-use hazard (p^g_{ik}), the probability of at least one use by horizon (h) is (1-(1-p^g_{ik})^{h+1}). Therefore

$$
\Delta C_i(h)=\sum_{k\in U_i}
\left[(1-p^1_{ik})^{h+1}-(1-p^2_{ik})^{h+1}\right].
$$

If (p^2_{ik}\ge p^1_{ik}), every summand is nonnegative. But monotonic growth of the gap is not automatic for arbitrary positive (p^1): it additionally requires the paper’s no-catch-up condition

$$
\sum_{k\in U_i}\left[p^2_{ik}(1-p^2_{ik})^{h+1}
-p^1_{ik}(1-p^1_{ik})^{h+1}\right]\ge0.
$$

The clean strictly increasing and concave statement is for the closed-frontier benchmark (p^1_{ik}=0<p^2_{ik}). This is the endpoint/domain qualification most worth emphasizing orally.

## 5. Empirical interpretation audit

The treatment date is also an outcome-relevant event: a developer may install Claude Code because a new project uses an unfamiliar language. That violates conditional parallel trends if the project shock independently changes the language portfolio. Excluding the treatment-defining language and all Claude-coauthored commits weakens a purely mechanical explanation, but cannot eliminate time-varying selection. The correct conclusion is therefore association consistent with frontier expansion, not identified causality.

## 6. Why the requested variance result is excluded

The cross-sectional continuation-value variance, continuous tool-quality comparative static, condition (30), and turning-point-at-one qualification belong to Agrawal, Gans, and Goldfarb’s *The Economics of Bicycles for the Mind* (week 2). They do not appear in Quispe and Xu. Mixing them into this repository would create a false citation and a false theoretical summary.

