+++
title = "Functional Completeness"
description = "In most definitions of classical logic, some connectives are introduced as abbreviations of other, so-called primitive connectives. But why does it work, and why should one bother instead of just introducing every connective as primitive? In this post, I am going to tackle these questions by explaining what functional completeness is and how it is used."
date = 2022-04-08T00:00:00+02:00
tags = ["logic", "syntax"]
type = "post"
draft = false
tikzjax = false
+++

## <span class="section-num">1</span> The Interdefinability of Connectives {#the-interdefinability-of-connectives}

As a first approximation, let us get familiar with one very simple idea: Some logical constants can be understood as abbreviations of others. For example, you can introduce the material conditional by stipulating that


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_df2ba737c7cb97ed542482493abdd9c5daf02e9e.svg" alt="\begin{equation*}
\tag{1} \hskip -15em
\text{``}\!\mathit{A} \to \mathit{B}\,\text{''}
\text{ abbreviates }
\text{``}\lnot ( \mathit{A} \land \lnot \mathit{B})\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

In our example, we used two connectives, <img src="/ltximg/Functional Completeness (vom 08.04.2022)_ae23b716af236c4778cbb088e81187ba44b382bf.svg" alt="$\text{``}\lnot \text{''}$" class="org-svg" /> and <img src="/ltximg/Functional Completeness (vom 08.04.2022)_a3fc6cde78e8ab226576619ca7419e6e02010a9e.svg" alt="$\text{``}\land\text{''}$" class="org-svg" />, to define another one --  <img src="/ltximg/Functional Completeness (vom 08.04.2022)_0ccb9e39cf24d75fd407d1c3ff44cb604e2c1896.svg" alt="$\text{``}\to\text{''}$" class="org-svg" />. Note that this is a strict _syntactical definition_ in the following sense: Nothing is claimed about the meaning of <img src="/ltximg/Functional Completeness (vom 08.04.2022)_fb8beb9a1ff574a687d6f46cc360b4b2fc9a451e.svg" alt="$\text{``}\!\mathit{A} \to \mathit{B}\,\text{''}$" class="org-svg" /> or <img src="/ltximg/Functional Completeness (vom 08.04.2022)_7951921c2ccbc01b443fa164f3055cf5fb4c88ae.svg" alt="$\text{``}\lnot ( \mathit{A} \land \lnot \mathit{B})\text{''}$" class="org-svg" />. Instead, something is claimed about the arrangement of (sequences of) symbols, namely that the sequence of a well-formed-formula followed by an arrow-sign and another well-formed formula in this order may always replace the sequence of a hook-sign, a left parenthesis, a well-formed-formula, a hat-sign, a hook-sign and a well-formed formula in that order.

Nonetheless, we of course have a semantic interpretation in mind: We want the _definiens_ to yield the same truth-values of the ones usually attributed to the _definiendum_. In short: <img src="/ltximg/Functional Completeness (vom 08.04.2022)_7951921c2ccbc01b443fa164f3055cf5fb4c88ae.svg" alt="$\text{``}\lnot ( \mathit{A} \land \lnot \mathit{B})\text{''}$" class="org-svg" /> should have the same truth-conditions as the ones <img src="/ltximg/Functional Completeness (vom 08.04.2022)_fb8beb9a1ff574a687d6f46cc360b4b2fc9a451e.svg" alt="$\text{``}\!\mathit{A} \to \mathit{B}\,\text{''}$" class="org-svg" /> would have if it was not introduced as an abbreviation. That this is the case for our definition can easily be shown by constructing a truth-table:

<div class="img-newline">

<img src="/ltximg/Functional Completeness (vom 08.04.2022)_01e304211f9291170b9cb009906497dd18d3dc1b.svg" alt="$\begin{array}{|c|c|c|c|c|c|c|}
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

As we can see, the truth-conditions for <img src="/ltximg/Functional Completeness (vom 08.04.2022)_04aff03552e99aa68de407b6324dbbcc096b8a1b.svg" alt="$\lnot (\mathit{A}  \land \neg  \mathit{B})$" class="org-svg" /> are the same as those <img src="/ltximg/Functional Completeness (vom 08.04.2022)_21697171f84a2915a611377c2c5c5ee495f6eb6c.svg" alt="$p \to q$" class="org-svg" /> has in a classical system of logic. Thus, we do not need to introduce a new symbol to our alphabet and define its truth-conditions; it suffices to read <img src="/ltximg/Functional Completeness (vom 08.04.2022)_d2072bf6807e2b705d30af2e08f1bdf1ff5611fb.svg" alt="$\text{``}\lnot (\mathit{A} \land \lnot \mathit{B})\text{''}$" class="org-svg" /> as "If A, then B".

Following the same procedure, we can also define
 <img src="/ltximg/Functional Completeness (vom 08.04.2022)_21562815b5f9ada70d101a282b3bb029dc3a970c.svg" alt="$\text{``}\lor\text{''}$" class="org-svg" /> and <img src="/ltximg/Functional Completeness (vom 08.04.2022)_972540aa9370f19c1bd1fb027631b5fe9352f106.svg" alt="$\text{``}\leftrightarrow\text{''}$" class="org-svg" /> in terms of  <img src="/ltximg/Functional Completeness (vom 08.04.2022)_ae23b716af236c4778cbb088e81187ba44b382bf.svg" alt="$\text{``}\lnot \text{''}$" class="org-svg" />  and <img src="/ltximg/Functional Completeness (vom 08.04.2022)_a3fc6cde78e8ab226576619ca7419e6e02010a9e.svg" alt="$\text{``}\land\text{''}$" class="org-svg" />:
<span class="org-target" id="org-target--2"></span>


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_9f8431c2fadb9d76432e70e01f6bc16c7289c372.svg" alt="\begin{equation*}
\tag{2} \hskip -15em
\text{``}\!\mathit{A} \lor \mathit{B}\,\text{''}
\text{ abbreviates }
\text{``}\lnot ( \lnot \mathit{A} \land \lnot \mathit{B})\text{''}
\end{equation*}
" class="equation-double" />
</span>
</div>

<span class="org-target" id="org-target--3"></span>


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_04e9fda1b0ab591e9e90ddc776e02b47c9a18f16.svg" alt="\begin{equation*}
\tag{3} \hskip -15em
\text{``}\!\mathit{A} \leftrightarrow \mathit{B}\,\text{''}
\text{ abbreviates }
\text{``}\lnot (\mathit{A} \land \lnot \mathit{B}) \land \lnot (\mathit{B} \land \lnot \mathit{A})\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

With a natural language interpretation, we can interpret [(2)](#org-target--2) as stipulating that "or" abbreviates "not both are false" and [(3)](#org-target--3) as stipulating that "if and only if" abbreviates "not just one is true or false". If we wanted to, we could also define the strong alternation like this:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_b5e6ee8b3ed6407b94102df10650ae5f9c5a4877.svg" alt="\begin{equation*}
\label{eq:4}
\tag{4} \hskip -15em
\text{``}\!\mathit{A} \nabla \mathit{B}\,\text{''}
\text{ abbreviates }
\text{``} \lnot (\lnot (\mathit{A} \land \lnot \mathit{B}) \land \lnot (\mathit{B} \land \lnot \mathit{A}))\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

<span class="org-target" id="org-target--4"></span>
As it happens, we have now used two connectives -- <img src="/ltximg/Functional Completeness (vom 08.04.2022)_026c4145363ba042235eb8e0a671f5ed47473cb2.svg" alt="$\text{``}\neg\text{''}$" class="org-svg" /> and <img src="/ltximg/Functional Completeness (vom 08.04.2022)_a3fc6cde78e8ab226576619ca7419e6e02010a9e.svg" alt="$\text{``}\land\text{''}$" class="org-svg" /> -- to show that all other connectives can be introduced as abbreviations of them, in the sense that the definitions yield the same truth-values as the connectives if they were introduced as primitive symbols.

This is not self-evident, since some pairs of connectives are not capable of defining all others; for example <img src="/ltximg/Functional Completeness (vom 08.04.2022)_a3fc6cde78e8ab226576619ca7419e6e02010a9e.svg" alt="$\text{``}\land\text{''}$" class="org-svg" /> and <img src="/ltximg/Functional Completeness (vom 08.04.2022)_21562815b5f9ada70d101a282b3bb029dc3a970c.svg" alt="$\text{``}\lor\text{''}$" class="org-svg" /> cannot because there is no way to get to <img src="/ltximg/Functional Completeness (vom 08.04.2022)_78c847a2234edec9723ba22083ceb1f346ddffa7.svg" alt="$\text{``}\lnot A\text{''}$" class="org-svg" />, <img src="/ltximg/Functional Completeness (vom 08.04.2022)_ae23b716af236c4778cbb088e81187ba44b382bf.svg" alt="$\text{``}\lnot \text{''}$" class="org-svg" /> or <img src="/ltximg/Functional Completeness (vom 08.04.2022)_972540aa9370f19c1bd1fb027631b5fe9352f106.svg" alt="$\text{``}\leftrightarrow\text{''}$" class="org-svg" />.


## <span class="section-num">2</span> The Interdefinability of Quantifiers {#the-interdefinability-of-quantifiers}

Now we know that under certain conditions, we only need a smaller set of connectives to define the whole set of connectives. While this suffices for propositional logic, there are two more logical symbols[^fn:1] in _predicate_ _logic_ we need to take into consideration: <img src="/ltximg/Functional Completeness (vom 08.04.2022)_9a1cfd28289a55b399295d3e13be0d0b28344594.svg" alt="$\text{``}\forall \text{''}$" class="org-svg" /> and <img src="/ltximg/Functional Completeness (vom 08.04.2022)_fae65399c5dd1f4ffd0a7a0e7d98f933bcd04851.svg" alt="$\text{``}\exists \text{''}$" class="org-svg" />. Here, we can also define one quantifier in terms of the other using <img src="/ltximg/Functional Completeness (vom 08.04.2022)_ae23b716af236c4778cbb088e81187ba44b382bf.svg" alt="$\text{``}\lnot \text{''}$" class="org-svg" />. For example, we can stipulate that


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_ba72270880b3662846dcba4647b879015aebb07c.svg" alt="\begin{equation*}
\tag{5} \hskip -15em
\text{``}\exists\mathit{x}\,\text{''}
\text{ abbreviates }
\text{``} \lnot \forall\mathit{x}\,\lnot\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

and thereby define the existential quantifier by means of <img src="/ltximg/Functional Completeness (vom 08.04.2022)_d23c9253807458be09b5e99de7f05e3a06735499.svg" alt="$\text{``}\forall\text{''}$" class="org-svg" /> and <img src="/ltximg/Functional Completeness (vom 08.04.2022)_026c4145363ba042235eb8e0a671f5ed47473cb2.svg" alt="$\text{``}\neg\text{''}$" class="org-svg" />. To see this is working as intended, we simply need our definition and the rule of Double Negation (both introduction and eliminiation)[^fn:2]:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_c43d808ef10ec13c556134f486be77d413618e37.svg" alt="\begin{chain}
    \neg \forall \mathit{x} \mathit{A}   &amp;amp;&amp;amp; \kgrün{\neg \forall \mathit{x}\, \lnot }\lnot \mathit{A} \hphantom{\lnot\lnot } &amp;amp; DN \\
    &amp;amp;&amp;amp; \exists \mathit{x} \, \lnot \mathit{A}   &amp;amp; Def_\exists
\end{chain} \vskip 1em
\begin{chain}
  \forall \mathit{x} \mathit{A} \hphantom{\lnot }  &amp;amp;&amp;amp; \lnot \kgrün{\lnot \forall \mathit{x} \, \lnot}\lnot \mathit{A} \hphantom{\lnot} &amp;amp;  DN  \\
         &amp;amp;&amp;amp;  \lnot \exists \mathit{x} \, \lnot \mathit{A}   &amp;amp; Def_\exists
\end{chain} \vskip 1em
\begin{chain}
    \forall \mathit{x}\,\lnot  \mathit{A}   &amp;amp;&amp;amp; \lnot \kgrün{\neg \forall \mathit{x} \,  \lnot } \mathit{A} \hphantom{\lnot\lnot }&amp;amp; DN \\
    &amp;amp;&amp;amp; \lnot \dgelb{\exists \mathit{x}} \mathit{A}   &amp;amp; Def_\exists
\end{chain}
" class="center" />
</span>
</div>

One could, of course, also take <img src="/ltximg/Functional Completeness (vom 08.04.2022)_51248199793e41b70ac4adddf8299e2a7e8f9d9a.svg" alt="$\text{``}\exists\text{''}$" class="org-svg" /> as primitive and define <img src="/ltximg/Functional Completeness (vom 08.04.2022)_d23c9253807458be09b5e99de7f05e3a06735499.svg" alt="$\text{``}\forall\text{''}$" class="org-svg" /> in terms of it. Similarly, you can define a weak modal operator like <img src="/ltximg/Functional Completeness (vom 08.04.2022)_2375c94b4c5bff62dc87434316c1e878dadf4982.svg" alt="$\text{``}\Diamond \text{''}$" class="org-svg" /> by the corresponding strong one -- <img src="/ltximg/Functional Completeness (vom 08.04.2022)_51d0e65b310a974dbc5a64d9de8ec076d210b817.svg" alt="$\text{``}\Box \text{''}$" class="org-svg" /> in this case -- and vice versa.


## <span class="section-num">3</span> A Definition of Functional Completeness {#a-definition-of-functional-completeness}

In the last two sections, we have shown that we only need _some_ connectives and quantifiers in our syntax to express _all_ of them. We also made plausible that not every set of logical constants is capable of doing this, so we are talking about an interesting property here -- a property usually called _functional completeness_ or _expressive completeness_. Now we have an idea of what it is, so let us consider a formal definition. As it happens, there are several definitions of this concept, but they only deviate in minor points. I suggest the following definition, which is based on <a href="#citeproc_bib_item_1">Yaqub, 2015, p. 110</a>:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_bb09b2570ce2264113a854dd3c6b474c6b04257a.svg" alt="\begin{Large}
\begin{defin}{Functional Completeness}{}
 A \textit{logical operator} is a connective, quantifier or modal operator.  \vskip .5em
  A set S of logical operators is \textcolor{pink}{\textit{functionally complete}} for a language L if and only if every unary and binary logical operator is expressible in L in terms of S.
\end{defin}
\end{Large}
" class="org-svg" />
</span>
</div>

The basic idea of this definition is that if you have _some_ connectives -- represented by the set <img src="/ltximg/Functional Completeness (vom 08.04.2022)_1d2f48e1baf9fe09cd879648829e1e97662ed41a.svg" alt="$S$" class="org-svg" />, you have _all_ connectives. With the notion of functional completeness in place, we are now able to express what we discovered in sections [1](#the-interdefinability-of-connectives) and [2](#the-interdefinability-of-quantifiers) very briefly:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_587654c8fc720fa70c8923b0d3880b8211bca186.svg" alt="\begin{equation*} \hskip -15em
\tag{6} \text{The set $\{ \lnot, \land \}$ is functionally complete for propositional logic.}
\end{equation*}
" class="equation-double" />
</span>
</div>


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_d69fe94b1e85ab5cff901e690a6208e5aad66f2a.svg" alt="\begin{equation*} \hskip -15em
\tag{7} \text{The set $\{\lnot, \land, \forall\}$ is functionally complete for predicate logic.}
\end{equation*}
" class="org-svg" />
</span>
</div>

Note that these are far from all sets of connectives that are functionally complete for propositional or predicate logic. For example, <img src="/ltximg/Functional Completeness (vom 08.04.2022)_5fa474c4d3f330cbeb3c503603fc6e8e6bb36dc3.svg" alt="$\{ \lnot ,\lor,\exists  \}$" class="org-svg" /> is functionally complete, too, as well as <img src="/ltximg/Functional Completeness (vom 08.04.2022)_ac58ccac3e76c9fef4397158b7572d4ab4bccabe.svg" alt="$\{ \bot,\to\}$" class="org-svg" />.


## <span class="section-num">4</span> The Sheffer Stroke and Peirce's Arrow {#the-sheffer-stroke-and-peirce-s-arrow}

Incidentally, you can even get all connectives defined by a _single_ sign, the Sheffer stroke <img src="/ltximg/Functional Completeness (vom 08.04.2022)_2746bde52ac83964d8cbdbd141e36122b3dc975e.svg" alt="$\text{``}\downarrow\text{''}$" class="org-svg" />. Its semantics are defined like this:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_5d51b41b8c45d4bb2908c82e8476a9caae93a47c.svg" alt="\begin{equation*} \hskip -15em
\tag{8} \mathit{v}(\!\mathit{A} \downarrow \mathit{B}) = 1 \text{ iff } \mathit{v}(\!\mathit{A})=0 \text{ and } \mathit{v}(\!\mathit{B})=0
\end{equation*}
" class="org-svg" />
</span>
</div>

The Sheffer stroke can be read as "neither A nor B". As a limiting case, then, imagine that A and B are the same proposition. Then we can stipulate:

<span class="org-target" id="org-target--eq8"></span>


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_53678088f871ecd58fbdef5560f06bae6cc8980b.svg" alt="\begin{equation*} \hskip -15em
\tag{9} \text{``}\neg\mathit{A}\text{'' abbreviates } \text{``}(\mathit{A}\downarrow\mathit{A})\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

This also makes sense from a natural-language standpoint: "neither A nor A" is just a peculiar way of saying "not A". The rest of the connectives is now easily defined on the basis of <img src="/ltximg/Functional Completeness (vom 08.04.2022)_026c4145363ba042235eb8e0a671f5ed47473cb2.svg" alt="$\text{``}\neg\text{''}$" class="org-svg" /> and <img src="/ltximg/Functional Completeness (vom 08.04.2022)_2746bde52ac83964d8cbdbd141e36122b3dc975e.svg" alt="$\text{``}\downarrow\text{''}$" class="org-svg" />.

Similarly, we can define all connectives as abbreviations of _Peirce's Arrow_, whose truth-conditions are defined this way:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_121e2819b66f90980aaa6fcfc0cb8cca45430f84.svg" alt="\begin{equation*} \hskip -15em
\tag{10} \mathit{v}(\!\mathit{A} \uparrow \mathit{B}) = 1 \text{ iff } \mathit{v}(\!\mathit{A})=0 \text{ or } \mathit{v}(\!\mathit{B})=0
\end{equation*}
" class="org-svg" />
</span>
</div>

In a similar, fashion, Peirce's arrow can be read as "not both A and B". This allows the following definition:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_d6a53b1c1bd67185c3b247b2cd5c0a8520c506f1.svg" alt="\begin{equation*} \hskip -15em
\tag{11} \text{``}\neg\mathit{A}\text{'' abbreviates } \text{``}(\mathit{A}\uparrow\mathit{A})\text{''}
\end{equation*}
" class="org-svg" />
</span>
</div>

"Not both A and A", again, simply means the same as "not A". As a side note for computer scientists: The Sheffer stroke corresponds to the `NAND` operator, Peirce's arrow to the `NOR` operator. Peirce's arrow is sometimes also called "Quine's dagger".


## <span class="section-num">5</span> The Use of Functional Completeness {#the-use-of-functional-completeness}

Now that we know what functional completeness is, the question arises why it would matter to talk about it. After all, no matter whether you introduce all connectives as primitive symbols or some of them as abbreviations, all formulas have the same truth-values and proof theory stays the same anyway.

What seems to be a reason against introducing small functionally complete sets of operators in the first place turns out to be just the reason for doing so. On the one hand, thinking about it makes clear which relations the connectives hold to each other, which is a value in itself. It also helps compare different logics. For example, in intuitionistic logic, the quantifiers are not interdefinable, and in three-valued logic, the sets of functionally complete connectives are much more limited.

On the other hand, and most importantly, if you intend to prove something not in, but _about_ a logical language, you will most often find yourself in a situation which requires you to use proof by induction on the complexity of formulae[^fn:3]. This, in effect, means, that you need to show _for all possible combinations of well-formed formulae_ that the proposition you claim holds. By making use of functionally complete sets, you can reduce the number of those possible combinations, which makes the proofs much smaller. Logicians are humans, after all, and humans are lazy.


## <span class="section-num">6</span> Functional vs. Deductive Completeness {#functional-vs-dot-deductive-completeness}

As a last point, it is important to keep two notions of completeness apart: Functional completeness of a set of connectives is not the same as completeness of a proof system (that is, for example, a set of axioms plus a set of deduction rules); although both establish a connection between a syntactic and a semantic concept, there are some important differences.

Whilst functional completeness is about the connection between abbreviations and functions which map to truth values, completeness of a proof system is concerned with the relationship between the set of universally valid formulae and the set of formulae which result from rule-governed sign manipulation.

| Property of  ...                      | syntactic concept           | semantic concept |
|---------------------------------------|-----------------------------|------------------|
| a set of connectives                  | abbreviations (definitions) | truth-functions  |
| the set of universally valid formulae | deduction                   | validity         |

To get a better idea of how these concepts deviate, consider a language with the same syntax as classical propositional logic and an axiom system of propositional logic, but with the following semantics, which is admittedly not all too inventive:

<span class="org-target" id="org-target--Triv"></span>


<div class="equation-container">
<span class="equation">
<img src="/ltximg/Functional Completeness (vom 08.04.2022)_32936ca44938ec9f5a6ed7a6cda9c50865c6bb7b.svg" alt="\begin{equation*} \hskip -15em
\tag{Triv}
\mathit{v\,(\!A)}=T
\end{equation*}
" class="img-newline" />
</span>
</div>

With [(Triv)](#org-target--Triv) we state that _any_ formula is true. As a direct corollary, then, any formula is universally valid as well, so also every formula whose main connective is one of  <img src="/ltximg/Functional Completeness (vom 08.04.2022)_a3fc6cde78e8ab226576619ca7419e6e02010a9e.svg" alt="$\text{``}\land\text{''}$" class="org-svg" />, <img src="/ltximg/Functional Completeness (vom 08.04.2022)_21562815b5f9ada70d101a282b3bb029dc3a970c.svg" alt="$\text{``}\lor\text{''}$" class="org-svg" />, <img src="/ltximg/Functional Completeness (vom 08.04.2022)_0ccb9e39cf24d75fd407d1c3ff44cb604e2c1896.svg" alt="$\text{``}\to\text{''}$" class="org-svg" /> <img src="/ltximg/Functional Completeness (vom 08.04.2022)_ae23b716af236c4778cbb088e81187ba44b382bf.svg" alt="$\text{``}\lnot \text{''}$" class="org-svg" /> or <img src="/ltximg/Functional Completeness (vom 08.04.2022)_972540aa9370f19c1bd1fb027631b5fe9352f106.svg" alt="$\text{``}\leftrightarrow\text{''}$" class="org-svg" /> is.  But since we constructed our system to have a classical set of deducible formulae, some valid formulae are not provable. In other words: Our proof system ist not complete with respect to the semantics we stated.

Nonetheless, any set of connectives is functionally complete in our system: No matter what formula we look at, be it of the form  <img src="/ltximg/Functional Completeness (vom 08.04.2022)_fb8beb9a1ff574a687d6f46cc360b4b2fc9a451e.svg" alt="$\text{``}\!\mathit{A} \to \mathit{B}\,\text{''}$" class="org-svg" />, <img src="/ltximg/Functional Completeness (vom 08.04.2022)_c7d19d8bf531ca3ba29a4fc6efd420288231ea74.svg" alt="$\text{``}\neg \mathit{A}\text{''} $" class="org-svg" /> or any other form, it is true. So any abbreviation of one connective by the other results in the same truth-values -- or, as in this case, in the same truth-value.

Note that if we had chosen a proof system in which any formula is deducible, our proof system would be complete with respect to the given semantics. The functional completeness of our system would not have changed, though. This is the biggest difference between functional completeness and completeness of a proof system: While the former is dependent on a system of deduction, the latter is not.

Was this article of any help to you? If so, consider leaving a comment or supporting me by [buying me a coffee](https://www.buymeacoffee.com/vitus)!


## Literature {#literature}

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Yaqub, A. M. (2015). <i>An Introduction to Metalogic</i>. Broadview Press.</div>
</div>

[^fn:1]: To be exact, there are three logical symbols in predicate logic. Next to the quantifiers, there also is the identity sign <img src="/ltximg/Functional Completeness (vom 08.04.2022)_e8f31e97046cee798a38ebdebd996772bddad2af.svg" alt="$\text{``}=\text{''}$" class="org-svg" />. Since, as will become clear, functional completeness is about _connectives_, and the identity sign is a predicate symbol, it is not relevant to what we are up to. Nonetheless, it is interesting to note that identity cannot be defined in classical first-order logic, but _has_ to be added as a primitive symbol. In mereology, set theory and second-order logic, identity can be defined, though.
[^fn:2]: In intuitionistic logic, the quantifiers are not interdefinable. This is a direct consequence of the fact that intuitionists do not accept DN.
[^fn:3]: A nerdy side note: Proof by induction on the complexity of formulae or length of proofs can be reduced to the principle of mathematical induction, which itself is a theorem of set theory. A very accessible introduction to the PMI can be found in <a href="#citeproc_bib_item_1">Yaqub, 2015, pp. 90–94</a>.