+++
title = "Example"
author = ["Jacob Hilker"]
description = """
  Here is my **post summary**.

  Hello, and welcome to OpenSource Philosophy! I am Vitus Schäfftlein, an undergraduate student with a deep-rooted passion for philosophy -- and an advocate of the idea that academia should be open source, not least because at the heart of both democratic societies and academia, there is freedom and knowledge, which are two concepts that cannot and must not be ripped apart.
  """
date = 2022-01-20
type = "post"
draft = false
+++

## Description {#description}


## Markup {#markup}

Is this **bold**?
Is this _in italics_?
Is this <span class="underline">underlined</span>?
Is this `verbatim`?
Is this `code`?
Is this ~~strike-through~~?

<mark>This sentence is marked.</mark>


## Special Blocks {#special-blocks}

Oh look some special block content.

<div class="BLOCKTAG">
  <div></div>

something

</div>

<aside>
  <aside></aside>

Some content for the `aside` block.

</aside>

<details class="code-details"
                 style ="padding: 1em;
                          background-color: #e5f5e5;
                          /* background-color: pink; */
                          border-radius: 15px;
                          color: hsl(157 75%);
                          font-size: 0.9em;
                          box-shadow: 0.05em 0.1em 5px 0.01em  #00000057;">
                  <summary>
                    <strong>
                      <font face="Courier" size="3" color="green">
                         Details
                      </font>
                    </strong>
                  </summary>

<summary>
This is summary.
</summary>

Here are the details.


</details>

<div class="tikzjax">
  <div></div>

\draw (0,0) circle (1in);

</div>

<div class="katex">
  <div></div>

E = -J &sum;\\<sub>i=1</sub>^N s\\\_i s\\<sub>i+1</sub>

</div>


## <span class="org-todo todo TODO">TODO</span> Attachments {#attachments}


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


### Elisp {#elisp}

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

```python
import os

print("Oh Hi Mark")
x = 3
x = x+2
print("What Is X?")
print("x=5")
```