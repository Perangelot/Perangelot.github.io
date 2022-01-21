+++
description = """
  Here is my **post summary**.

  Hello, and welcome to OpenSource Philosophy! I am Vitus Schäfftlein, an undergraduate student with a deep-rooted passion for philosophy -- and an advocate of the idea that academia should be open source, not least because at the heart of both democratic societies and academia, there is freedom and knowledge, which are two concepts that cannot and must not be ripped apart.
  """
date = 2022-01-20
tags = ["emacs", "LaTeX"]
draft = false
title = "Example!"
type = "post"
+++

## Markup {#markup}

Is this **bold**?
Is this _in italics_?
Is this <span class="underline">underlined</span>?
Is this `verbatim`?
Is this `code`?
Is this ~~strike-through~~?

<mark>This sentence is marked.</mark>


## Special Blocks {#special-blocks}

<div class="BLOCKTAG">

something

</div>

<aside>

Some content for the `aside` block.

</aside>

<details>
<summary>This is summary.</summary>
<div class="details">

Here are the details.
</div>
</details>

<script type="text/tikz">
  \begin{tikzpicture}
\draw (0,0) circle (1in);
\end{tikzpicture}
</script>

<div class="katex">

E = -J \sum\_{i=1}^N s\_i s\_{i+1}

</div>


## Attachments {#attachments}

See attached document for more information: </Hinter den Kulissen von K-AL 2.pdf>


## Linking {#linking}

Does this link to [LaTeX](#latex)?
See the [main page](http://localhost:1313/)


## Referencing {#referencing}

> This is just a random attempt at looking whether the `quote` environment works.

<&zermelo2010>


## LaTeX {#latex}


### Inline Formuals {#inline-formuals}

\\(r \lor a\\)
\\(lel\\)
\\(p \to q\\)
\\(q \to r\\)


### Source Blocks {#source-blocks}

Did anything get printed?


## Source Code {#source-code}


### elisp {#elisp}

```elisp
(defun get-things-working ()
"Get things working!"
(and (my-custom-function) (another-function)))
```


### LaTeX {#latex}

```LaTeX
\begin{document}
\titlepage
\end{document}
```


### Try {#try}

<pre>
\begin{document}
\titlepage
\end{document}
</pre>


## Tables {#tables}

Is this exported as an html table?

|  | Uhrzeit ||  | Altklausur ||  | Tutor:in |   |
|--|---------|--|------------|--|----------|---|
|  | 10-12 Uhr ||  | Altklausur 16/17 ||  | Luca, Marvin |   |
|  | 12-14 Uhr ||  | Altklausur 17/18 ||  | Tobias |   |
|  | 14-16 Uhr ||  | Altklausur 18/19 ||  | Lena |   |
|  | 16-18 Uhr ||  | Altklausur 19/20 ||  | Vitus |   |

| And  | this | table? |
|------|------|--------|
| Try  | out  | here   |
| next | line |        |


## Syntax Highlighting {#syntax-highlighting}

-   darcula
-   fruity
-   monokai