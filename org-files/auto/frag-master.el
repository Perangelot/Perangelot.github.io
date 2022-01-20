(TeX-add-style-hook
 "frag-master"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("color" "usenames") ("unicode-math" "math-style=upright")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "color"
    "amssymb"
    "turnstile"
    "centernot"
    "mathpartir"
    "unicode-math"))
 :latex)

