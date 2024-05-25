;;; moss-org.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, org  ... ")

(defun org-latex-preview-buffer ()
  "Generate the previews of all latex fragments in the buffer"
  (interactive)
  (org-latex-preview '(16)))

(defun moss/reload-org-agenda-files ()
  "Reloads the agenda file list"
  (interactive)
  (if (eq system-type 'android)
        (setq org-agenda-files (directory-files-recursively "~/nextcloud/Org" "\\.org$"))
    (setq org-agenda-files (directory-files-recursively "~/Nextcloud/Org" "\\.org$"))))

(defun moss/load-minor-modes-for-org ()
  "Loads all the minor modes for use with Org mode"
  (flyspell-mode 1)
  (toggle-truncate-lines 0)
  (toggle-word-wrap 1))

(defun moss/add-latex-block ()
  "Adds a latex block ready for input"
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (insert "\\[")
  (newline-and-indent 2)
  (insert "\\]")
  (previous-line))

(use-package org
  ;; Pins the release to a commit, this commit is for fragtog as is broken in
  ;; newer releses
  ;; :ensure (:ref "8ef6205a560cd3a92f8c5f8fe34953b80121c2cb")
  :hook (org-mode . moss/load-minor-modes-for-org)
  :bind
  (;; Global Keybindings for org
   ;; ("" . )
   ("C-c c" . org-capture)
   ("C-c a" . org-agenda)

   ;; Org mode keybindings
   :map org-mode-map
   ("C-c l" . moss/add-latex-block))

  :config
  (org-babel-do-load-languages
   'org-babel-load-languages '(
                               (python . t)
                               (gnuplot . t)
                               (maxima . t)
                               (shell . t)
                               ))

  ;; Org source block templates - for org doc, adding additionall
  (add-to-list 'org-structure-template-alist '("m" . "src maxima"))

  ;; LaTeX options:


  ;; Android specific settings
  (if (eq system-type 'android)
      (progn
        (setq org-directory "~/nextcloud/Org/")
        (setq org-agenda-files (directory-files-recursively "~/nextcloud/Org" "\\.org$"))
        (setq org-format-latex-options (plist-put org-format-latex-options :scale 1))
        (defun org--get-display-dpi ()
          "MODIFIED FOR TABLET - MOSS
Get the DPI of the display.
The function assumes that the display has the same pixel width in
the horizontal and vertical directions."
          266))
    (setq org-directory "~/Nextcloud/Org/")
    (setq org-agenda-files (directory-files-recursively "~/Nextcloud/Org" "\\.org$"))
    (setq org-format-latex-options (plist-put org-format-latex-options :scale 3)))

  :custom-face
  (org-level-1 ((t (:inherit outline-1 :height 1.75))))
  (org-level-2 ((t (:inherit outline-2 :height 1.5))))
  (org-level-3 ((t (:inherit outline-3 :height 1.25))))
  (org-level-4 ((t (:inherit outline-4 :height 1.1))))
  (org-document-title ((t (:height 2.0))))

  :custom
  (org-refile-targets
      '((nil :maxlevel . 3)
        (org-agenda-files :maxlevel . 3)))

  ;; Org capture - For agenda
  (org-capture-templates
   `(
     ("t" "TODO" entry
      (file ,(concat org-directory "/Inbox.org"))
      "* TODO %?
:PROPERTIES:
:CAPTURED_TIME: %U
:END:
%a
%i
")

     ("n" "Note" entry
      (file ,(concat org-directory "/Inbox.org"))
      "* %?
:PROPERTIES:
:CAPTURED_TIME: %U
:END:
%a
%i
")

     ("u" "URLs" entry
      (file ,(concat org-directory "/Inbox.org"))
      "* %?
:PROPERTIES:
:CAPTURED_TIME: %U
:END:
Url: %x
")

     ;; -------------------------------------------------------------------

     ("j" "Journal" entry
      (file+olp+datetree ,(concat org-directory "/Journal.org"))
      "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
      :empty-lines 1)

     ;; -------------------------------------------------------------------

     ("m" "Metrics Capture")

     ("mw" "Weight" table-line
      (file+headline ,(concat org-directory "/Health.org") "Weight")
      "| %U | %^{Weight} | %^{Notes} |"
      :kill-buffer t)

     ("me" "Exercise Bike" table-line
      (file+headline ,(concat org-directory "/Health.org") "Exercise Bike")
      "| %U | %^{Distance} | %^{Calories} | %^{Timer} | %^{Notes} |"
      :kill-buffer t)

     ("mp" "Push-ups" table-line
      (file+headline ,(concat org-directory "/Health.org") "Push-ups")
      "| %U | %^{Push-ups} | %^{Sets} | %^{Notes} |"
      :kill-buffer t)

     ("ms" "Sit-ups" table-line
      (file+headline ,(concat org-directory "/Health.org") "Sit-ups")
      "| %U | %^{Situps} | %^{Sets} | %^{Notes} |"
      :kill-buffer t)

     ("ml" "Plank" table-line
      (file+headline ,(concat org-directory "/Health.org") "Plank")
      "| %U | %^{Time} | %^{Notes} |"
      :kill-buffer t))))

(provide 'moss-org)
;;; moss-org.el ends here ------------------------------------------------------
