;;; moss-org.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, org  ... ")

(defun moss/reload-org-agenda-files ()
  "Reloads the agenda file list"
  (interactive)
  (setq org-agenda-files (directory-files-recursively "~/Nextcloud/Org" "\\.org$")))

(defun moss/load-minor-modes-for-org ()
  "Loads all the minor modes for use with Org mode"
  (flyspell-mode 1)
  (toggle-truncate-lines 1)
  (toggle-word-wrap 1))

(use-package org
  ;; Pins the release to a commit
  :elpaca (:ref "8ef6205a560cd3a92f8c5f8fe34953b80121c2cb")
  :hook (org-mode . moss/load-minor-modes-for-org)
  :bind
  (;; Keybindings for org
   ;; ("" . )
   ("C-c c" . org-capture)
   ("C-c a" . org-agenda))

  :config
  (org-babel-do-load-languages
   'org-babel-load-languages '(
                               (python . t)
                               (gnuplot . t)
                               (maxima . t)
                               ))

  ;; Org source block templates - for org doc, adding additionall
  (add-to-list 'org-structure-template-alist '("m" . "src maxima"))

  ;; LaTeX options:
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.4))

  :custom
  (org-directory "~/Nextcloud/Org/")
  (org-agenda-files (directory-files-recursively "~/Nextcloud/Org" "\\.org$"))
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
