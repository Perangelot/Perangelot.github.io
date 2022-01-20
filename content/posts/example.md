+++
description = """
  Here is my **post summary**.

  And this can be over _multiple lines_ too!
  """
date = 2022-01-20
tags = ["emacs", "LaTeX"]
draft = false
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

<object type="image/svg+xml" data="file:///home/vitus/Schreibtisch/hugo/imgs/example_1305c7e5d25a7547d11b2c66ad2bbb9b08e42e4f.svg" class="org-svg">
Sorry, your browser does not support SVG.</object>
<object type="image/svg+xml" data="file:///home/vitus/Schreibtisch/hugo/imgs/example_bd90d936541c6d8adddf0709ed79c17ea2dc5be9.svg" class="org-svg">
Sorry, your browser does not support SVG.</object>
<object type="image/svg+xml" data="file:///home/vitus/Schreibtisch/hugo/imgs/example_fb891be1504b6682adbe8388482fcc9a420fc8a7.svg" class="org-svg">
Sorry, your browser does not support SVG.</object>
<object type="image/svg+xml" data="file:///home/vitus/Schreibtisch/hugo/imgs/example_1b8aa0e63af76143da3313712766b0df2141fdc2.svg" class="org-svg">
Sorry, your browser does not support SVG.</object>


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