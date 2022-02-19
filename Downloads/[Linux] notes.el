;;; org-protocol (erlaubt org-capture für Google Chrome und Adobe Acrobat) ;;;

(require 'org-protocol)	

(defun transform-square-brackets-to-round-ones(string-to-transform)
  "Transforms [ into ( and ] into ), other chars left unchanged."
  (concat 
  (mapcar #'(lambda (c) (if (equal c ?[) ?\( (if (equal c ?]) ?\) c))) string-to-transform)))

;;; Link-Syntax anpassen: "C|" wird durch "C:" ersetzt ;;;

(defun org-fix-colon (link)
  (replace-regexp-in-string "C|" "C:" link))

;;; capture-templates (%comments hinzugefügt) ;;;

(defvar org-notes-file (expand-file-name "notes.org" org-directory))
(with-eval-after-load 'org-protocol
  (load-library "org-capture-fix"))

(setq org-capture-templates
      `(
        ("p" "Protocol" entry (file+headline ,org-notes-file "Zitate")
         "* [[%(org-fix-colon \"%:link\")][%(transform-square-brackets-to-round-ones \"%:description\")]]\n#+BEGIN_QUOTE\n%i\nComment: %:comment\n#+END_QUOTE\n\n\n%?")
        ("t" "TODO" entry (file+headline "/media/storage/sciebo privat/org-mode/org-roam notes/todos (vom 25.12.2021).org" "Zu sortieren")
         "* TODO %?")
        ))


;;; emacs minimiert, nachdem ein org-(roam-)capture-buffer, der mit org-protocol erzeugt wurde, geschlossen wird ;;;

(defun org-capture-minimize-maybe (fun &rest args)
  (let* ((buffer (plist-get org-capture-current-plist :original-buffer))
         (serverp (and buffer
                       (string-match "\\*server\\*" (buffer-name buffer)))))
    (apply fun args)
    (when serverp
      (iconify-frame))))

(advice-add 'org-capture-finalize :around #'org-capture-minimize-maybe)

;;; org-roam ;;;

(use-package simple-httpd :ensure t)
(use-package org-roam
      :init 
(setq org-roam-v2-ack t) 
(require 'org-roam-protocol)
      :ensure t
      :init 
      :custom
      (org-roam-directory (file-truename "/media/storage/sciebo privat/org-mode/org-roam notes"))

      :bind (("C-c n b" . org-roam-buffer-toggle)
             ("C-c n f" . org-roam-node-find)
             ("C-c n i" . org-roam-node-insert)
             ("C-c n c" . org-roam-capture)
             ;; Dailies
             ("C-c n j" . org-roam-dailies-capture-today)
             ("C-c n d" . my/org-roam-capture)              ; default template
             ("C-c n r" . my/orb-find-node)                 ; wie org-roam-node-find, nur mit bibtex-templates
             ("C-c n g" . my/orb-insert-link)               ; bibtex template
)

      :config
      (setq org-roam-database-connector 'sqlite3)
      (org-roam-db-autosync-mode)
      (setq org-roam-completion-everywhere t))

;;; org-roam-buffer zeigen backlinks, reflinks und unlinked references an
    
     (setq org-roam-mode-section-functions
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            #'org-roam-unlinked-references-section))

;;; org-roam-IDs als Zeitstempel definieren ;;;

(setq org-id-method 'ts) 
(setq org-roam-prefer-id-links t)

;;; Timestamp-Eigenschaft hinzufügen: Wann ist die org-roam-Notiz erstellt worden? ;;;

(defvar org-created-property-name "CREATED"
  "The name of the org-mode property that stores the creation date of the entry")

(defun org-set-created-property (&optional active NAME)
  "Set a property on the entry giving the creation time.

By default the property is called CREATED. If given the `NAME'
argument will be used instead. If the property already exists, it
will not be modified."
  (interactive)
  (let* ((created (or NAME org-created-property-name))
         (fmt (if active "<%s>" "[%s]"))
         (now  (format fmt (format-time-string "%Y-%m-%d %a %H:%M"))))
    (unless (org-entry-get (point) created nil)
      (org-set-property created now))))
 (add-hook 'org-roam-capture-new-node-hook #'org-set-created-property)


;;; org-roam-bibtex ;;;

(use-package org-roam-bibtex
  :after (org-roam) (org-ref)
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
(require 'helm-bibtex)
(require 'orb-helm)
(setq orb-note-actions-interface 'helm)
(setq orb-process-file-keyword t)
(setq orb-file-field-extensions '("pdf"))
(setq orb-insert-interface 'helm-bibtex)
)

;;; Funktionen, um org-roam-bibtex und org-roam besser zu integrieren ;;;

(autoload 'my/org-roam-capture "org-roam-addition" nil t)
(autoload 'my/orb-insert-link "org-roam-addition" nil t)
(autoload 'my/orb-find-node "org-roam-addition" nil t)

(use-package org-ref
  :config (require 'org-ref-helm)
  :load-path "/home/vitus/.emacs.d/elpa/org-ref/")

;;; org-roam-ui - graphische Darstellung von org-roam-nodes! ;;;

(use-package websocket :after org-roam)
(use-package org-roam-ui
    :load-path "/media/storage/sciebo privat/shared emacs configuration/Besondere Pakete/org-roam-ui-main"
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;;; Deft zum Durchsuchen von Notizen ;;;

(use-package deft
  :commands deft
  :bind ("C-d" . deft)
  :init
  (setq deft-default-extension "org"
        deft-use-filename-as-title nil               						 ; de-couples filename and note title
        deft-use-filter-string-for-filename t
        deft-auto-save-interval -1.0                      				         ; disable auto-save
        deft-directory "/media/storage/sciebo privat/org-mode"
        deft-recursive t									 ; durchsucht auch Unterordner
        ;; converts the filter string into a readable file-name using kebab-case:
        deft-file-naming-rules
        '((noslash . "-")
          (nospace . "-")
          (case-fn . downcase)))
  :config
  (setq deft-extensions '("org" "tex" "el")))

;;; In emacs Konfiguration suchen ;;;
(defun deft-change () (interactive)
"Open deft in emacs config folder."
(let ((deft-directory "/media/storage/sciebo privat/shared emacs configuration")
)
  (deft)))

(with-eval-after-load 'org-roam (setq org-roam-v2-ack t))

;;; Inhalte von verlinkten org-Dateien anzeigen ;;;

(add-to-list 'load-path (expand-file-name "/media/storage/sciebo privat/shared emacs configuration/Besondere Pakete/org-transclusion-main"))
(with-eval-after-load 'org
    (require 'org-transclusion nil t)
    (setq org-transclusion-include-first-section t)
(add-hook 'org-mode-hook 'org-transclusion-mode)

;;; Lösch-Befehle löschen nicht nur transclusion, sondern auch den Transclusion-Link ;;;

(defun my/org-transclusion-remove ()
  "Remove the current transcluded text and #+transclude line."
  (interactive)
  (when (org-transclusion-remove)
    (kill-whole-line)))

(defun my/org-transclusion-remove-all ()
  "Remove all transcluded text regions and #+transclude lines."
  (interactive)
  (save-excursion
    (mapc (lambda (pos)
            (goto-char pos)
            (kill-whole-line))
          (org-transclusion-remove-all))))

(bind-key "C-x t" #'org-transclusion-mode)
(bind-key "C-x m" #'org-transclusion-make-from-link)
(bind-key "C-x r" #'my/org-transclusion-remove)
)
(with-eval-after-load 'org #'(org-transclusion-mode 1))

;;; Ausgewählten Text in pdftools in org-roam-Notiz kopieren ;;;

;;; Besondere capture-Templates auswählen ;;;

(defun my/org-roam-get-template (name)
  "Return NAME template from `org-roam-capture-templates'."
  (cl-find-if (lambda (lst)
                (equal name (car lst)))
              org-roam-capture-templates))

;;; Text formatieren (unnötige RETs und Bindestriche weg) ;;;

(defun my/format-active-region ()
  "Removes all newlines in the region and handles hyphens correctly."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "-\n" nil t) (replace-match "" nil t))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "\s" nil t))
))

;;; Ausgewählten PDF-Text in Buffer ;;;	

(defun my/org-capture-pdf-active-region ()
  "Capture the active region of the pdf-view buffer."
  (let* ((pdf-buf-name (plist-get org-capture-plist :original-buffer))
         (pdf-buf (get-buffer pdf-buf-name)))
    (if (buffer-live-p pdf-buf)
        (with-current-buffer pdf-buf
          (car (pdf-view-active-region-text))
          (my/format-copied-text))
      (user-error "Buffer %S not alive." pdf-buf-name))))

;;; Tastenkürzel für entsprechendes Template ;;;

(defun my/org-roam-PDF-notes ()
  "Capture the p-org-roam-template."
  (interactive)
  (let ((org-roam-capture-templates (list (my/org-roam-get-template "p"))))
    (org-roam-capture)))


(with-eval-after-load 'pdf-view 
		(define-key pdf-view-mode-map (kbd "C-p") 'my/org-roam-PDF-notes)
)

  (setq org-roam-capture-templates
        '(
("r" "Bibliographieeintrag" plain "%?"
:if-new
        (file+head "references/${citekey} (vom %<%d.%m.%Y>).org" "#+TITLE: ${title}:\n\n* Notizen\n:PROPERTIES:\n:NOTER_DOCUMENT: %(orb-process-file-field \"${citekey}\")\n:END:\n")
:unnarrowed t :type org-roam-bibtex)
("p" "PDF Notes" plain "%?"
     :if-new (file+head "${title} (vom %<%d.%m.%Y>).org"
                        "#+title: ${title}\n\"%(my/org-capture-pdf-active-region)\"\n\n") :unnarrowed t)
("d" "default" plain "%?"
     :if-new (file+head "${title} (vom %<%d.%m.%Y>).org"
                        "#+title: ${title}\n")
     :unnarrowed t)
("l" "Logic" plain "%?"
     :if-new (file+head "${title} (vom %<%d.%m.%Y>).org"
                        "#+title: ${title}\n\#+filetags: Logik")
     :unnarrowed t)
("h" "History of Logic" plain "%?"
     :if-new (file+head "${title} (vom %<%d.%m.%Y>).org"
                        "#+title: ${title}\n\#+filetags: Logik\n#+filetags: historisch")
     :unnarrowed t)
("o" "organisation" plain "%?"
     :if-new (file+head "${title} (vom %<%d.%m.%Y>).org"
                        "#+title: ${title}\n\#+filetags: Organisation")
     :unnarrowed t)
))


;;; Funktion, wenn man IDs in neue emacs config übernimmt ;;;

(defun my/org-id-update-org-roam-files ()
  "Update Org-ID locations for all Org-roam files."
  (interactive)
  (org-id-update-id-locations (org-roam-list-files)))
