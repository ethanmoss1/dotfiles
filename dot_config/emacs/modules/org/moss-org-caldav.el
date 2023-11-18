;;; moss-org-caldav.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, org-caldav  ... ")

(use-package org-caldav
  :disabled
  :after (org)
  :custom
  (org-caldav-url "https://192.168.1.168/remote.php/dav/calendars/ethan")
  (org-caldav-calendar-id "emacs")
  (org-caldav-inbox (concat org-directory "Calendar.org"))
  ;; (org-caldav-files '(expand-file-name (concat org-directory "test.org")))
  (org-caldav-files nil)
  (org-icalendar-timezone "Europe/London")

  :config
  (add-to-list 'org-agenda-files org-caldav-inbox)
  (org-caldav-sync)
  )

(provide 'moss-org-caldav)
;;; moss-org-caldav.el ends here -----------------------------------------------------
