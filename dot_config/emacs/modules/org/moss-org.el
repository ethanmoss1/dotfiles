;;; moss-org.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, org  ... ")

(defun moss/reload-org-agenda-files ()
  "Reloads the agenda file list"
  (interactive)
  (setq org-agenda-files (directory-files-recursively "~/Nextcloud/Org" "\\.org$")))

(use-package org
  :disabled
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
                               ))

  ;; Org source block templates - for org doc, adding additionall
  (add-to-list 'org-structure-template-alist '("m" . "src maxima"))


  :custom
  (org-directory "~/Nextcloud/Org/")
  ;; (org-agenda-files '("Inbox.org"
                      ;; "Tasks.org"
                      ;; "Backburner.org"
                      ;; "Projects.org"
                      ;; ))
  (org-agenda-files (directory-files-recursively "~/Nextcloud/Org" "\\.org$"))
  (org-refile-targets
      '((nil :maxlevel . 3)
        (org-agenda-files :maxlevel . 3)))

  ;; (org-log-done 'time)
  ;; (org-agenda-start-with-log-mode t)

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

     ;; ("p" "Projects")
     ;; ("pp" "New Project" entry
     ;;  (file+olp ,(concat org-directory "/calendar.org"))
     ;;  "* %^{Event Title}\n:PROPERTIES:\n:ID:"
     ;;  :empty-lines 1)

     ;; -------------------------------------------------------------------

     ;; ("a" "Appointment" entry
     ;;   (file, (concat org-directory "/Calendar.org"))
     ;;   "* %?\n:PROPERTIES:\n:SCHEDULED:%^T\n:END:\n"
     ;;   :empty-lines 1)

     ;; ("c" "Calendar" entry
     ;;  (file ,(concat org-directory "/calendar.org"))
     ;;  "* %^{Event Title}\n:PROPERTIES:\n:ID:"
     ;;  :empty-lines 1)

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
