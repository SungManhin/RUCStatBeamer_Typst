// Author: Song Wenxuan 
// 2025.02.03

#import "@preview/touying:0.5.5": *
#import themes.stargazer: *

#import "@preview/numbly:0.1.0": numbly

#show: stargazer-theme.with(
  aspect-ratio: "4-3",
  config-info(
    title: [RUCStatBeamer—Typst Template],
    subtitle: [Make your slides with Typst],
    author: [Sung Manhin],
    date: datetime.today(),
    institution: [Renmin University of China],
    logo: image("figures/RUC_stat_logo.png", width: 8mm),
  ),
  config-colors(
  primary: rgb("#2182BF"),
  primary-dark: rgb("#0367A6"),
  secondary: rgb("#ffffff"),
  tertiary: rgb("#2182BF"),
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#01588e"),
  
)
)

// used when presenting the paper in sequential chapter order
//#set heading(numbering: numbly("{1}.", default: "1.1"))

// default math numbering
#set math.equation(numbering: "(1)")

// use nonum for numnumbering formula
#let nonum(eq) = math.equation(block: true, numbering: none, eq)

// use colmath for colorful display of formula
#let colmath(x, col) = text(fill: col)[#x]


#title-slide()

#outline-slide()

= Section A

== How to choose a threshold?

- Control Per-Comparison Type I Error (*PCER*)
  1. a.k.a. "_uncorrected testing_", many type I errors
  2. Gives #colmath($bb(P){"FD"_i>0} lt.eq.slant alpha$,purple) marginally for all $1 lt.eq.slant i lt.eq.slant m$ 

- Control Familywise Type I Error (*FWER*)
  1. e.g. Bonferroni method, or using per-comparison significance level $alpha/m$
  2. Guarantees #colmath($bb(P){"FD">0}lt.eq.slant alpha$, purple)

- Control False Discovery Rate (*FDR*)
  1. First defined by Benjamini & Hochberg @benjamini1995controlling
  2. Guarantees #colmath($"FDR" eq.triple bb(E)(frac("FD", D))lt.eq.slant alpha$, blue)

== BH Procedure

#tblock(title: [Theorem 1])[
  The Benjamini–Hochberg procedure (BH step-up procedure) controls the FDR at level $alpha$ for independent multiple tests.
]


== Visualization and Algorithm

// #set page(columns: 2)
#align(center + horizon, 
  figure(
    image(width: 80%, "figures/bh.png"),
    caption:[BH Procedure]
  )
)

#pagebreak()
1. For a given $alpha$, find the largest $k$ such that $P_((k)) lt.eq.slant cancel(display(k/m)) k/m alpha$.

2. Reject the null hypothesis (i.e., declare discoveries) for all $H_((i))$ for $i=1,dots,k$.

= Section B

== R Code

#columns(2, gutter: 15pt)[
   #set par(justify: true)
```R
bh <- function() {
    UseMethod("bh")
}

bh.func <- function(pv, alpha = 0.05) {
    m <- length(pv)
    i <- 1:m
    sorted_pv <- sort(pv)
    if (sorted_pv[1] > alpha / m) {
        return(rep(0, m))
    }
    k <- max(i[sorted_pv <= i / m * alpha])
    criterion <- sorted_pv[k]
    return(1 * (pv <= criterion))
}
```
#colbreak()
#lorem(30)\
#lorem(30)\
/ $P$: P-value, or realization of a P-variable.
/ $E$: E-value, or realization of a E-variable.
/ $Q$: Q-value, or realization of a Q-variable.
]



== Subsection B.2

You can use `#pause` to pause display some proof. 🤔️//or face.think
#pause

*_Proof:_* Let $alpha_r=alpha r \/ K$ for $r in cal(K)$. We can write
$ bb(E)[frac(F_(cal(D)), R_(cal(D)))]=bb(E)[frac(sum_(k in cal(N))bb(1)_({P_k lt.eq.slant alpha_(R_(cal(D)))}), R_(cal(D)))]=sum_(k in cal(N))sum_(r=1)^K 1/r bb(E)[bb(1)_({P_k lt.eq.slant alpha_r}) bb(1)_({R_(cal(D))=r})]. $ <fdr>
#pause
For $k in cal(N)$, let $R_k$ be the number of rejection from the BH procedure if it is applied to $bold(upright(P))$ with $P_k$ replaced by 0. Note that ${P_k lt.eq.slant alpha_r,R_(cal(D))=r}={P_k lt.eq.slant alpha_r, R_k=r}$ for each $k,r$. Hence, we have

$ bb(E)[bb(1)_({P_k lt.eq.slant alpha_r}) bb(1)_({R_(cal(D))=r})]=bb(E)[bb(1)_({P_k lt.eq.slant alpha_r}) bb(1)_({R_k=r})]. $
#pause
Putting this into @fdr, we get

#nonum($ bb(E)[F_(cal(D))/R_(cal(D))]=alpha/K sum_(k in cal(N))sum_(r=1)^K bb(P)(R_k=r)=(K_0alpha)/K, $)

#meanwhile and this completes the proof. #h(1fr) $square.stroked.medium$



#show: appendix

= Appendix

== Appendix

// full: true for display all references
// title: `References` title display, which we dont need
// style: detailed in https://typst.app/docs/reference/model/bibliography/#parameters-style
#bibliography("references.bib", title: none, style: "taylor-and-francis-national-library-of-medicine", full: true)