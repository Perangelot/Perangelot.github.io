---
title: "Example Post"
author: ["Jacob Hilker"]
description: "This post is an example of org-mode syntax highlighting being exported to hugo markdown."
date: 2022-01-27T13:49:00-05:00
lastmod: 2022-01-28T14:00:00-05:00
tags: ["test", "example", "syntax highlighting"]
type: "post"
draft: false
tikzjax: true
---

## Markup {#markup}

Is this **bold**? Is this _italic_? Is this <span class="underline">underlined</span>? Is this `verbatim`? Is this `Ctrl+A`? Is this ~~struck through~~?

And now, a deterministic proof: Sed diam.  Sed bibendum.  Pellentesque tristique imperdiet tortor.

I'd also like to link to a [[/Downloads/[Linux] notes.el][file]]. [file](</Downloads/[Linux] notes.el>)


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

Examples of inline[^fn:1] math formulae: \\(\rm{ax^{2}+bx+c}\\), \\(\rm{p \  \to q \lor r}\\).

Examples of block equations:

\\(\rm{p \to q \lor r}\\)


## Table of contents {#table-of-contents}

<div class="ox-hugo-toc toc">

<div class="heading">Table of Contents</div>

- [Markup](#markup)
- [Special Blocks](#special-blocks)
    - [<span class="org-todo todo TODO">TODO</span> Details](#details)
- [Source Code](#source-code)
    - [Elisp](#elisp)
    - [Latex](#latex)
- [LaTeX Highlighting](#latex-highlighting)
- [Table of contents](#table-of-contents)
- [TikzJax Rendered SVGs](#tikzjax-rendered-svgs)
- [Citing](#citing)

</div>
<!--endtoc-->


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

A link to the[^fn:2] [circle](#org-target--circle).


## Citing {#citing}

Here are some cite commands I may want to use:

| **cite command** | **result**    |
|------------------|---------------|
| cite             | <&howard1998> |
| parencite        | <&howard1998> |
| citeauthor       | <&howard1998> |
| citeyear         | <&howard1998> |
| citetitle        | <&howard1998> |

<p>You can also create a new document by pressing <kbd><kbd class="key">Ctrl</kbd>+<kbd class="key">N</kbd></kbd>.</p>

<kbd class="key">code</kb>

<&howard1998>

<../static/blog.bib>

[^fn:1]: Footnote!
[^fn:2]: And this is another footnote.