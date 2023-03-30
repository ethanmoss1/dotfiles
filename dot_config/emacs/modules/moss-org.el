;;; moss-org.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, org  ... ")

(use-package org
  :custom
  (org-directory "~/Documents/Org")
  (org-agenda-files '("Tasks.org" "Finances.org"))
  (org-log-done 'time)
  (org-agenda-start-with-log-mode t)

  (org-capture-templates
        `(("t" "Tasks / Projects")
           ("tt" "Task" entry (file+olp "~/Documents/Org/Tasks.org" "Inbox")
            "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)
           ("ts" "Clocked Entry Subtask" entry (clock)
            "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

          ("j" "Journal Entries")
           ("jj" "Journal" entry
            (file+olp+datetree "~/Documents/Org/Journal.org")
            "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
            ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
            :clock-in :clock-resume
            :empty-lines 1)
           ("jm" "Meeting" entry
            (file+olp+datetree "~/Documents/Org/Journal.org")
            "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
            :clock-in :clock-resume
            :empty-lines 1)

          ("m" "Metrics Capture")
          ("mw" "Weight" table-line (file+headline "~/Documents/Org/Metrics.org" "Weight")
           "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)
          ("me" "Exercise Bike" table-line (file+headline "~/Documents/Org/Metrics.org" "Exercise Bike")
           "| %U | %^{Distance} | %^{Calories} | %^{Timer} | %^{Notes} |" :kill-buffer t)
          ("mp" "Push-ups" table-line (file+headline "~/Documents/Org/Metrics.org" "Push-ups")
           "| %U | %^{Push-ups} | %^{Sets} | %^{Notes} |" :kill-buffer t)
          ("ms" "Sit-ups" table-line (file+headline "~/Documents/Org/Metrics.org" "Sit-ups")
           "| %U | %^{Situps} | %^{Sets} | %^{Notes} |" :kill-buffer t)
          ("ml" "Plank" table-line (file+headline "~/Documents/Org/Metrics.org" "Plank")
           "| %U | %^{Time} | %^{Notes} |" :kill-buffer t))))

(provide 'moss-org)
;;; moss-org.el ends here ------------------------------------------------------
