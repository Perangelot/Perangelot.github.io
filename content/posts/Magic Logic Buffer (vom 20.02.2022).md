+++
title = "Magic Logic Buffer"
date = 2022-02-20T00:00:00+01:00
tags = ["blog-post"]
type = "post"
draft = false
tikzjax = true
draft = true
+++

(setq mlogb-enable-colors nil) → disable coloring

(setq mlogb-enable-pretty-symbols nil) disable pretty symbols aus

Add to mode-map:
  (with-eval-after-load 'magic-logic-buffer
  (bind-key "&lt;key&gt;" #'function  magic-logic-buffer-map))

Add to list:

(with-eval-after-load 'magic-logic-buffer
  (add-to-list 'mlogb-color-commands
	'("color" . "r,g,b")))

mlogb-enable-delete-LaTeX-macros

funktion weiteren namen geben: (defalias 'qrr 'query-replace-regexp)

```emacs-lisp
At first, you can do all these in a single ‘with-eval-after-load’
clause.  Also, ‘add-to-list’ and ‘delete’ will add/remove only one color
at a time, so you have to repeat them many times to add/remove all the
colors you need.  You can do it more efficiently and concise using
‘append’ and ‘delete-if’ like so:

(with-eval-after-load 'magic-logic-buffer
  (append
   ;; colors to add
   '(("kgrün"         "0,190,0")
	 ("dgelb"         "255,210,70")
	 ("hblau"         "0,176,240"))
   (delete-if (lambda (color-spec)
				(member (car color-spec)
						;; colors to remove
						'("green" "blue" "yellow")))
			  mlogb-color-commands))
  ;; add to mode-map (e.g. conversion function) ;;
  (bind-key "<key>" #'function  magic-logic-buffer-map))
```