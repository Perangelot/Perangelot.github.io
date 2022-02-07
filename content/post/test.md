+++
title = "Example Post"
author = ["Jacob Hilker"]
description = "This post is an example of org-mode syntax highlighting being exported to hugo markdown."
date = 2022-01-27T13:49:00-05:00
lastmod = 2022-01-28T14:00:00-05:00
tags = ["test", "example", "syntax highlighting"]
type = "post"
draft = false
tikzjax = true
+++

## Markup {#markup}

Is this **bold**? Is this _italic_? Is this <span class="underline">underlined</span>? Is this `verbatim`? Is this `code`? Is this ~~struck through~~?


## Special Blocks {#special-blocks}
<mark>This is an example custom block.</mark>


### <span class="org-todo todo TODO">TODO</span> Details {#details}

Details are nice.


## Source Code {#source-code}


### Elisp {#elisp}

```elisp
(defun get-things-working ()
"Get things working!"
(and (my-custom-function) (another-function)))
```


### Latex {#latex}

```latex
\begin{document}
\titlepage
\end{document}
```


## LaTeX Highlighting {#latex-highlighting}

Examples of inline math formulae: \\(\rm{ax^{2}+bx+c}\\), \\(\rm{p \  \to q \lor r}\\).

Examples of block equations:

\\[
\rm{
p \to q \lor r
}
\\]


## TikzJax Rendered SVGs {#tikzjax-rendered-svgs}

Here's a picture of a circle.
<span class="org-target" id="org-target--circle"></span>

<figure>
<script type="text/tikz">
  \begin{tikzpicture}
\draw[red] (0,0) circle (1in);
\end{tikzpicture}
</script>
<figcaption>A cool circle.</figcaption>
</figure>

A link to the [circle](#org-target--circle).