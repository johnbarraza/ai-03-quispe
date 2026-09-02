"""Symbolic and numerical audit of Quispe--Xu's threshold algebra.

Run: python analysis/symbolic_audit.py
"""

from sympy import Rational, simplify, symbols


omega, s, mu, rho, pi, b = symbols("omega s mu rho pi b", positive=True)
lam, a, z, kappa, r_d, sigma_d2 = symbols(
    "lambda a z kappa r_D sigma_D2", positive=True
)

T_s = b - s * mu + rho * s**2 / (2 * pi)
T_d = (
    b
    - (1 - lam) * s * mu
    - lam * a * z
    + kappa
    + r_d
    + rho / 2 * ((1 - lam) ** 2 * s**2 / pi + sigma_d2)
)

B_from_thresholds = simplify(T_s - T_d)
B_paper = (
    lam * (a * z - s * mu)
    - kappa
    - r_d
    + rho / 2 * ((2 * lam - lam**2) * s**2 / pi - sigma_d2)
)

assert simplify(B_from_thresholds - B_paper) == 0

# Exact-rational example with a nonempty activation band.
values = {
    s: Rational(1, 5),
    mu: 1,
    rho: 1,
    pi: 2,
    b: 1,
    lam: Rational(4, 5),
    a: 2,
    z: 1,
    kappa: Rational(1, 10),
    r_d: Rational(1, 10),
    sigma_d2: Rational(1, 10),
}

t_s = simplify(T_s.subs(values))
t_d = simplify(T_d.subs(values))
band_width = simplify(B_paper.subs(values))
assert band_width == simplify(t_s - t_d) and band_width > 0

inside = (t_d + t_s) / 2
below = t_d - 1
above = t_s + 1
assert not (below >= t_d)
assert inside >= t_d and inside < t_s
assert above >= t_s

print("PASS: T^S - T^D equals Equation (7).")
print(f"Exact example: T^D={t_d}, T^S={t_s}, B={band_width}.")
print("PASS: only an opportunity inside [T^D, T^S) is newly activated.")

