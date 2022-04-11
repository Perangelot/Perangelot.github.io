+++
title = "Functional Completeness"
description = "In most logic courses, the connectives of classical logic are defined in terms of two primitive connectives. But why does it work, and why should one bother instead of introducing every connective as primitive? This post aims to answer these questions by explaining the concept of *functional completeness*."
date = 2022-04-08T00:00:00+02:00
tags = ["logic", "syntax"]
type = "post"
draft = false
tikzjax = false
+++

## <span class="section-num">1</span> The interdefinability of connectives {#the-interdefinability-of-connectives}

Let us first of all get familiar with one very simple idea: Some logical constants can be defined in terms of others. For example, you can define the material conditional in logic like this:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_7f5d4d77e73a0fc2e2f3ff100a22a175a5eaaf42.svg" alt="\begin{equation*}
\tag{1} \hskip -15em
\text{``}\!\mathit{A} \to \mathit{B}\,\text{''}
\text{ abbreviates }
\text{``}\lnot ( \mathit{A} \land \lnot \mathit{B})\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

In our example, we used two other connectives, "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_fd3817ab2224b2081ed6fab1c4d00c64a2b27921.svg" alt="$\lnot $" class="org-svg" />" and "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_de505b9af605717fc7c8dfdef1e1d0abff881b23.svg" alt="$\land$" class="org-svg" />", to define
"<img src="/ltximg/Functional Completeness (vom 08.04.2022)_2600a834e3347a269e293992fda08a888bfa3468.svg" alt="$\to$" class="org-svg" />". We can check that this definition is appriopriate by proving that the _definiens_ yields the same truth-values of the ones usually attributed to the _definiendum_, for example by means of a truth-table:

<div class="img-newline">

<img src="/ltximg/Functional Completeness (vom 08.04.2022)_1aa03a9d2285243243edadd091c573141d02eba2.svg" alt="$\begin{array}{|c|c|c|c|c|c|c|}
\hline
      \mathit{A}
   &amp;amp;  \mathit{B}
   &amp;amp; \lnot \mathit{A}
   &amp;amp; \lnot \mathit{B}
   &amp;amp;  \mathit{A}  \land \neg  \mathit{B}
   &amp;amp; \lnot (\mathit{A}  \land \neg  \mathit{B})
   &amp;amp;  \mathit{A}  \to  \mathit{B} \\
  \hline
  T &amp;amp; T &amp;amp; F &amp;amp; F &amp;amp; F &amp;amp; T &amp;amp; T\\ \hline
  T &amp;amp; F &amp;amp; F &amp;amp; T &amp;amp; T &amp;amp; F &amp;amp; F\\ \hline
  F &amp;amp; T &amp;amp; T &amp;amp; F &amp;amp; F &amp;amp; T &amp;amp; T\\ \hline
  F &amp;amp; F &amp;amp; T &amp;amp; T &amp;amp; F &amp;amp; T &amp;amp; T\\
  \hline
  \end{array}$" class="org-svg" />

</div>

As we can see, the truth conditions for <img src="/ltximg/Functional Completeness (vom 08.04.2022)_b9ac421dee6f6c117c76118eb2f4bf5c1af01699.svg" alt="$\lnot (\mathit{A}  \land \neg  \mathit{B})$" class="org-svg" /> are the same as those for <img src="/ltximg/Functional Completeness (vom 08.04.2022)_b9ac421dee6f6c117c76118eb2f4bf5c1af01699.svg" alt="$\lnot (\mathit{A}  \land \neg  \mathit{B})$" class="org-svg" />. We can do the same for <img src="/ltximg/Functional Completeness (vom 08.04.2022)_08f35a7ae82b64a9c20f4df2c3f377f2e4272af3.svg" alt="$\lor$" class="org-svg" /> and <img src="/ltximg/Functional Completeness (vom 08.04.2022)_73f5d4db27c48e7d00e6ab2f8b11b2dca123bcd7.svg" alt="$\leftrightarrow$" class="org-svg" />:


<div id="org6d2c426" class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_1092f5d47b8fff0d4d33c511e767869404116128.svg" alt="\begin{equation*}
\tag{2} \hskip -15em
\text{``}\!\mathit{A} \lor \mathit{B}\,\text{''}
\text{ abbreviates }
\text{``}\lnot ( \lnot \mathit{A} \land \lnot \mathit{B})\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_6d64c6b5ed3181da4056ac2c23d3292402fa3cd4.svg" alt="\begin{equation*}
\tag{3} \hskip -15em
\text{``}\!\mathit{A} \leftrightarrow \mathit{B}\,\text{''}
\text{ abbreviates }
\text{``}\lnot (\mathit{A} \land \lnot \mathit{B}) \land \lnot (\mathit{B} \land \lnot \mathit{A})\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

If we wanted to, we could also define the strong alternation like this:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_68abcd942b8a0eeee07d3070aee31317a0f23840.svg" alt="\begin{equation*}
\label{eq:4}
\tag{4} \hskip -15em
\text{``}\!\mathit{A} \nabla \mathit{B}\,\text{''}
\text{ abbreviates }
\text{``} \lnot (\lnot (\mathit{A} \land \lnot \mathit{B}) \land \lnot (\mathit{B} \land \lnot \mathit{A}))\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

As it happens, we have now used two connectives -- "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_a1b4e5ba625e4dceb0689066713fe5bfb6689673.svg" alt="$\neg$" class="org-svg" />" and "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_de505b9af605717fc7c8dfdef1e1d0abff881b23.svg" alt="$\land$" class="org-svg" />" -- to show that all other connectives can be introduced as abbreviations of them. This is not self-evident, since some pairs of connectives are not capable of defining all others, for example "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_de505b9af605717fc7c8dfdef1e1d0abff881b23.svg" alt="$\land$" class="org-svg" />" "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_08f35a7ae82b64a9c20f4df2c3f377f2e4272af3.svg" alt="$\lor$" class="org-svg" />" or "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_fd3817ab2224b2081ed6fab1c4d00c64a2b27921.svg" alt="$\lnot $" class="org-svg" />" and "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_73f5d4db27c48e7d00e6ab2f8b11b2dca123bcd7.svg" alt="$\leftrightarrow$" class="org-svg" />".


## <span class="section-num">2</span> The interdefinability of quantifiers {#the-interdefinability-of-quantifiers}

So far, we have only looked at connectives, and while this suffices for propositional logic, there are two other logical symbols in _predicate_ _logic_ we need to take into consideration: "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_589f9e37676e713c70a8a195434c62162538f8ac.svg" alt="$\forall $" class="org-svg" />" and "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_4f5f97d418d6139d0e10f2141d3f36c214cc0560.svg" alt="$\exists $" class="org-svg" />". Here, we can also define one quantifier in terms of the other using <img src="/ltximg/Functional Completeness (vom 08.04.2022)_fd3817ab2224b2081ed6fab1c4d00c64a2b27921.svg" alt="$\lnot $" class="org-svg" />. For example, we can stipulate that


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_43502a8cdea2f30d2da2d40e190c9ba66df2d491.svg" alt="\begin{equation*}
\tag{4} \hskip -15em
\text{``}\exists\mathit{x}\,\text{''}
\text{ abbreviates }
\text{``} \lnot \forall\mathit{x}\,\lnot\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

and thereby define the existential quantifier by means of "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_c6f77607c233cb62364870e7f813cca607d5304c.svg" alt="$\forall$" class="org-svg" />" and "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_a1b4e5ba625e4dceb0689066713fe5bfb6689673.svg" alt="$\neg$" class="org-svg" />". To see this is working as intended, we simply need our definition and the rule of Double Negation[^fn:1]:

One could, of course, also take "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_f9bcdade3fbe3d2634c92b4be4adcbb59aa4a3e5.svg" alt="$\exists$" class="org-svg" />" as primitive and define "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_c6f77607c233cb62364870e7f813cca607d5304c.svg" alt="$\forall$" class="org-svg" />" in terms of it. Similarly, you can define a weak modal operator like "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_f4a0cbf42ba3eecc6c43028aeb70c81efe38961c.svg" alt="$\Diamond $" class="org-svg" />" by the corresponding strong one -- "<img src="/ltximg/Functional Completeness (vom 08.04.2022)_8cf8d3ccf236eff54d9b31359608a56963089423.svg" alt="$\Box $" class="org-svg" />" in this case -- or vice versa.


## <span class="section-num">3</span> A definition of functional completeness {#a-definition-of-functional-completeness}

In the last two sections, we showed that we only need _some_ connectives and quantifiers in our syntax to express _all_ of them. We also understood that not any of logical constants is capable of doing this, so we are talking about an interesting property here -- a property usually called _functional completeness_ or _expressive completeness_. There are several definitions of this concept, but they only deviate in minor points. I suggest the following definition based on <a href="#citeproc_bib_item_1">Yaqub, 2015, p. 110</a>:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_d8e577b5ec703776c337315bc09fe33e54c49317.svg" alt="\begin{defin*}{Functional Completeness}
  \Large A \textit{logical operator} is a connective, quantifier or modal operator.  \vskip .5em
  A set S of logical operators ist \textcolor{pink}{\textit{functionally complete}} for a language L if and only if every unary and binary logical operator is expressible in L in terms of S.
\end{defin*}
" class="equation-definition" />
</span>
<span class="equation-label">
1
</span>
</div>

With the notion of functional completeness in place, we are now able to express what we discovered in sections [1](#the-interdefinability-of-connectives) and [2](#the-interdefinability-of-quantifiers) very briefly:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_40fc0a082ea7c5f90460dd2d093331a768be00f2.svg" alt="\begin{equation*} \hskip -15em
\tag{5} \text{The set $\{ \lnot, \land \}$ is functionally complete for propositional logic.}
\end{equation*}
" class="org-svg" />
</span>
</div>


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_eb8f178eba5cf33af062003845d134ed113e78d6.svg" alt="\begin{equation*} \hskip -15em
\tag{6} \text{The set $\{\lnot, \land, \forall\}$ is functionally complete for predicate logic.}
\end{equation*}
" class="org-svg" />
</span>
</div>


## <span class="section-num">4</span> Functional completeness and metalogic {#functional-completeness-and-metalogic}

It is important to understand that functional completeness of a set of connectives is different from completeness of a proof system (that is, for example, a set of axioms plus a set of deduction rules). Although both establish a connection between a syntactic and a semantic concept, there are some important differences. Whilst functional completeness is about the connection between abbreviations and functions which map to truth values, completeness of a proof system is concerned with the relationship between the set of universally valid formulas and the set of formulas which result from rule-governed sign manipulation.

| Property of  ...                      | syntactic concept           | semantic concept |
|---------------------------------------|-----------------------------|------------------|
| a set of connectives                  | abbreviations (definitions) | truth-functions  |
| the set of universally valid formulas | deduction                   | validity         |

To get a better idea of how these concepts deviate, consider a language with the same syntax as classical propositional logic and an axiom system of propositional logic, but with the following semantics, which is admittedly not all too inventive:

<span class="org-target" id="org-target--Triv"></span>


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_75ce820cadfd1fff5a42b7f6290dbdb2f57c1bcc.svg" alt="\begin{equation*} \hskip -15em
\tag{Triv}
\mathit{v\,(\!A)}=T
\end{equation*}
" class="img-newline" />
</span>
</div>

With [(Triv)](#org-target--Triv) we state that _any_ formula is true. As a direct corollary, then, any formula is universally valid as well. But since we have classical deduction rules, not every formula is deducible, so it is not the case that any universally valid formula is also deducible. In other words: Our proof system ist not complete with respect to the semantics we stated.

Nonetheless, any set of connectives is functionally complete: No matter what formula we look at, be it of the form  <img src="/ltximg/Functional Completeness (vom 08.04.2022)_e09c79a4fb92071375cfc76ce03f16a5daf73750.svg" alt="$\text{``}\!\mathit{A} \to \mathit{B}\,\text{''}$" class="org-svg" />, <img src="/ltximg/Functional Completeness (vom 08.04.2022)_f7e5e15db130e18a6814f30a79b2738871801766.svg" alt="$\text{``}\neg \mathit{A}\text{''} $" class="org-svg" /> or any other form, it is true. So any abbreviation of one connective by the other results in the same truth-values -- or, as in this case, the same truth-value.

Note that if we had chosen as proof system in which any formula is deducible, our proof system would be complete with respect to the given semantics. It is the dependency of the proof system that is the biggest difference between functional completeness and completeness of a proof system.

Any definition is stated with help of syntax, as a notational convention of abbreviation; but to say that an expression is syntactically definable is to say something more, namely that it is explicable as an abbreviation of an expression which is itself composed of just the notations of syntax.
quine, 286, math logic

## References

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Yaqub, A. M. (2015). <i>An Introduction to Metalogic</i>. Broadview Press.</div>
</div>

[^fn:1]: In intuitionistic logic, the quantifiers are not interdefinable. This is a direct consequence of the fact that intuitionists do not accept DN.