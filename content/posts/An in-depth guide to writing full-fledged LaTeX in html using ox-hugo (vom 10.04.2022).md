+++
title = "An in-depth guide to writing full-fledged LaTeX in html using ox-hugo"
description = "LaTeX is the one and only language to typeset math- and logicrelated formulas in a way that is both exact and aesthetically pleasing. And this is just the tip of the iceberg: There are many other features LaTeX has to offer. In this post, we will have a look at how to configure emacs and ox-hugo to allow you to get any (Xe)LaTeX formula, figure or whatnot into your html file, how to style them correctly and how to refrence them in-text."
date = 2022-04-10T00:00:00+02:00
tags = ["blog-post"]
type = "post"
draft = false
tikzjax = false
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [Why the our approach is preferable](#why-the-our-approach-is-preferable)
    - <span class="section-num">1.1</span> [`svg` preview images vs `Mathjax`](#svg-preview-images-vs-mathjax)
    - <span class="section-num">1.2</span> [`svg` preview images vs `Tikzjax`](#svg-preview-images-vs-tikzjax)
- <span class="section-num">2</span> [The basic idea of our approach](#the-basic-idea-of-our-approach)
    - <span class="section-num">2.1</span> [Using `org-mode` and `LaTeX` to generate `svg` preview images](#using-org-mode-and-latex-to-generate-svg-preview-images)
    - <span class="section-num">2.2</span> [Using `ox-hugo` and `hugo` to embed the images into `html`](#using-ox-hugo-and-hugo-to-embed-the-images-into-html)
    - <span class="section-num">2.3</span> [Using `css` to change alignment and styling](#using-css-to-change-alignment-and-styling)
    - <span class="section-num">2.4</span> [Optional: Using `org-mode` to create hyperlinks to the images](#optional-using-org-mode-to-create-hyperlinks-to-the-images)
- <span class="section-num">3</span> [Getting dvisvgm to work](#getting-dvisvgm-to-work)
- <span class="section-num">4</span> [Getting the colors right](#getting-the-colors-right)
- <span class="section-num">5</span> [Linking equations with target links:](#linking-equations-with-target-links)
- <span class="section-num">6</span> [](#d41d8c)
    - <span class="section-num">6.1</span> [1 Alles, WAS in dollar signs gewarppt ist - egal ob inline oder nicht. kriegt diese syntax:](#1-alles-was-in-dollar-signs-gewarppt-ist-egal-ob-inline-oder-nicht-dot-kriegt-diese-syntax)
    - <span class="section-num">6.2</span> [2](#2)

</div>
<!--endtoc-->


## <span class="section-num">1</span> Why the our approach is preferable {#why-the-our-approach-is-preferable}


### <span class="section-num">1.1</span> `svg` preview images vs `Mathjax` {#svg-preview-images-vs-mathjax}

Before we get into _how_ we're doing things, let us first get an idea of _why_ it is preferable to do so. This is an important question since there are other (and less complicated) ways to get LaTeX formulas typeset in `html`. Speficially, there is `Mathjax` -- a javascript application which allows typesetting LaTeX formulas in html. Now don't get me wrong, `Mathjax` is a great tool, but it has severe limitations.

In comparison to the approach we are choosing, `Mathjax` is much less flexible. Specifically, there are just a few LaTeX packages out there that you can actually use with `Mathjax`. This was the most important reason for me to switch to `svg` images: I was not able to typeset my formulas upright. In philosophical logic, it is common practice to write actual formulas upright, whilst preserving italicization for scheme letters. To do that correctly, you will need the package `unicode-math` with the package option `math-style=upright`, but this simply does not work with `Mathjax`. And even if this had not been a problem, there were still some metalogical signs missing. For example, the shadow brackets <img src="/ltximg/An in-depth guide to writing full-fledged LaTeX in html using ox-hugo (vom 10.04.2022)_61e9d0854bd03d1a6aed2c700039a727e8e9811e.svg" alt="$\llbracket \ldots \rrbracket$" class="org-svg" /> and turned iota <img src="/ltximg/An in-depth guide to writing full-fledged LaTeX in html using ox-hugo (vom 10.04.2022)_ba2b917fbe0eecc3454cb1b2d04b2ce113770d2d.svg" alt="$\turnediota $" class="org-svg" />$\\,$.

Things are getting even worse if you want to typeset very specific formulas. The most obvious case for me was trying to get the formulas of Frege's _Begriffsschrift_ working. This is simply not possible in `Mathjax`, whilst with our approach, we can write things like

<div class="img-newline">

<img src="/ltximg/An in-depth guide to writing full-fledged LaTeX in html using ox-hugo (vom 10.04.2022)_23c837dec9a5c494dbe9271d04f67dc866fe06af.svg" alt="$\Fcdt[\Fa]{\F \Fcdt {\F \Fcdt{\F\mathit{a}}{\F \mathit{c}}}{\F \Fcdt{\F \mathit{b}}{\F \mathit{c}}}}{\F \Fcdt{\F\Fcdt{\F\mathit{a}}{\F \mathit{b}}}{\F \mathit{c}}}$" class="org-svg" />

</div>

which would not be possible with `Mathjax`. We can now even use a `tabular` environment to group these formulas:


<div class="equation-container">
<span class="equation">
<img src="/ltximg/An in-depth guide to writing full-fledged LaTeX in html using ox-hugo (vom 10.04.2022)_52eb137b8757a841d8acdcaf093851ba0f35db58.svg" alt="\begin{center}
  \begin{tblr}{colspec={XXX}, row{1}={c}}
    \scalebox{1.2}{$\Fcdt[\Fa]{\F\Fcdt{\F\mathit{a}}{\F \mathit{b}}}{\F \mathit{a}}$} &amp;amp;

    \scalebox{1.2}{$\Fcdt[\Fa]{\F \Fcdt {\F \Fcdt{\F\mathit{a}}{\F \mathit{c}}}{\F \Fcdt{\F \mathit{b}}{\F \mathit{c}}}}{\F \Fcdt{\F\Fcdt{\F\mathit{a}}{\F \mathit{b}}}{\F \mathit{c}}}$} &amp;amp;

    \scalebox{1.2}{$\Fcdt[\Fa]{\F \Fcdt{\F\Fcdt{\F \mathit{a}}{\F \mathit{d}}}{\F \mathit{b}}}{\F \Fcdt{\F\Fcdt{\F\mathit{a}}{\F \mathit{b}}}{\F \mathit{d}}}$} \\

\hskip 5.5em    $\mathit{a} \to (\mathit{b} \to \mathit{a})$ &amp;amp;
\hskip 5.2em     $(\mathit{c} \to (\mathit{b} \to \mathit{a})) \to $ &amp;amp;
\hskip 3.5em   $((\mathit{c} \to \mathit{b}) \to (\mathit{c} \to \mathit{a})) \to $ \\ &amp;amp;
\hskip 5.2em     $(\mathit{d} \to (\mathit{b} \to \mathit{a}))$  &amp;amp;
\hskip 3.5em    $(\mathit{b} \to (\mathit{d} \to \mathit{a}))$
  \end{tblr}
\end{center}
" class="img-newline" />
</span>
<span class="equation-label">1</span>
</div>

As you can see, our approach is _much_ more flexible, which, if you need or want to be capable of getting down everything you want, this is great.


### <span class="section-num">1.2</span> `svg` preview images vs `Tikzjax` {#svg-preview-images-vs-tikzjax}

When typesetting logic or math, especially in texts which aim at explaining a matter in-depth, it happens more than often that you need to draw diagrams -- and LaTeX offers a great solution here, too. With the help of the `pgf/tikz` package, you can describe exactly how your diagram of choice should look like, and LaTeX draws it for you.

In order to draw diagrams in html, next to `Mathjax`, there is also the javascript application `Tikzjax`, with which you can draw basic `tikz` diagrams. Problematically, though, the operative word ist _basic_. You cannot even [load tikz-libraries](https://github.com/kisonecat/tikzjax/issues/2). But what if you want to draw a modal diagram? Images like


<div class="equation-container">
<span class="equation">
<img src="/ltximg/An in-depth guide to writing full-fledged LaTeX in html using ox-hugo (vom 10.04.2022)_4df67183e96feb7fb7a3fbea300863bff53761e1.svg" alt="\begin{figure}
\centering
  \begin{subfigure}[b]{0.46\linewidth}
   	 \begin{tikzpicture}[modal] % Den modus [modal] haben wir in der Präambel definiert. Hiermit zeichnen wir die Modaldiagremme!
	\node[world] (w1)  {$a$}; % [world] gibt an, dass wir Welten zeichnen.  (w1) ist der Name für die Welt, {$w_1$) die Beschriftung.
	\node[world] (w2) [right=of w1] {$b$};
	\path[-&amp;gt;] (w1) edge[reflexive] (w1);
	\path[-&amp;gt;] (w2) edge[reflexive] (w2);
	\end{tikzpicture}
    \centering \caption{Reflexive Instances}   \label{fig:A}
  \end{subfigure}
\begin{subfigure}[b]{0.46\linewidth}
  \begin{tikzpicture}[modal]
\node[world] (w1)  {$a$}; % [world] gibt an, dass wir Welten zeichnen. (w1) ist der Name für die Welt, {$w_1$) die Beschriftung.
\node[world] (w2) [right=of w1] {$b$};
\path[-&amp;gt;] (w1) edge (w2);
\path[-&amp;gt;] (w2) edge (w1);
\end{tikzpicture}
\centering \caption{Symmetric Instances} \label{fig:B}
\end{subfigure}
\end{figure}
" class="img-newline" />
</span>
<span class="equation-label">1</span>
</div>

can't be typeset with `Tikzjax`. Neither can more complex ones as


<div class="equation-container">
<span class="equation">
<img src="/ltximg/An in-depth guide to writing full-fledged LaTeX in html using ox-hugo (vom 10.04.2022)_68bb97d683b0b5999d2d42bb98d688ee36fb25eb.svg" alt="\begin{tableau}
{to prove={\text{proof goal: }\sdtstile{PL}{} \textcolor{grau}{\forall x Fx \to \exists x Fx}}}
[\neg (\forall x Fx \to \exists x Fx), just=reductio
[\forall x Fx,  just=(1) ($\neg \text{,}\to$)
[\neg \exists x Fx, just=(1) ($\neg \text{,}\to$) % Komma muss als Text ausgegeben werden, weil prooftree sonst denkt, es käme ein weiteres Argument!
[\forall x \neg Fx,               just=(3) Swap
[Fa,               just=(2) \text{UI: a/x}
[\neg Fa,               just=(4) \text{UI: a/x}, , close={(5),(6)}
]
]
]
]
]
]
\end{tableau}
" class="org-svg" />
</span>
<span class="equation-label">1</span>
</div>

But, as you can see, this is possible with `svg` images produced by emacs.


## <span class="section-num">2</span> The basic idea of our approach {#the-basic-idea-of-our-approach}

Now that we know _why_ our approach is preferable to `Mathjax` and `Tikzjax`, let us continue with the _how_. First of all, I am going to sketch the overall idea, then we will have a look at all the details. So let's get going!


### <span class="section-num">2.1</span> Using `org-mode` and `LaTeX` to generate `svg` preview images {#using-org-mode-and-latex-to-generate-svg-preview-images}

In order to get our `LaTeX` into our =h


### <span class="section-num">2.2</span> Using `ox-hugo` and `hugo` to embed the images into `html` {#using-ox-hugo-and-hugo-to-embed-the-images-into-html}


### <span class="section-num">2.3</span> Using `css` to change alignment and styling {#using-css-to-change-alignment-and-styling}


### <span class="section-num">2.4</span> Optional: Using `org-mode` to create hyperlinks to the images {#optional-using-org-mode-to-create-hyperlinks-to-the-images}


## <span class="section-num">3</span> Getting dvisvgm to work {#getting-dvisvgm-to-work}


## <span class="section-num">4</span> Getting the colors right {#getting-the-colors-right}

```lisp
(with-eval-after-load 'org
  (plist-put org-format-latex-options :html-foreground "#AAA7B3")
  (plist-put org-format-latex-options :html-background nil))
```


## <span class="section-num">5</span> Linking equations with target links: {#linking-equations-with-target-links}

-   set target <span class="org-target" id="org-target--eq1"></span>
-   refer with link: `[[eq1][Link to eq1]]` (span class="org-target")
-   documentation of ox-hugo: <https://ox-hugo.scripter.co/doc/anchors/#target-links>


## <span class="section-num">6</span>  {#d41d8c}

Die html-attribute ändern nicht die syntax, nur die Klasse


### <span class="section-num">6.1</span> 1 Alles, WAS in dollar signs gewarppt ist - egal ob inline oder nicht. kriegt diese syntax: {#1-alles-was-in-dollar-signs-gewarppt-ist-egal-ob-inline-oder-nicht-dot-kriegt-diese-syntax}

```html
<div class="...">
<img src="..." alt="..." class="class" />
</div>
```

```css
.class img {
[css-content]
}
```


### <span class="section-num">6.2</span> 2 {#2}

Alles, was NICHT in dollar signs gewrappt ist, kriegt diese Syntax:
syntax im Markdown:

```elisp
<div class="...">
<span class="class1">
<img src="..." alt="..." class="class2" />
</span>
</div>
```

selection in CSS:

```css
.equation-container .equation img[class="equation-double"] {
  display: block       !important;
  max-width: 100%;
  margin-left: -0,1cm  !important;
  margin-right: -0,1cm !important;
  margin-bottom: 0.3cm !important;
}
```