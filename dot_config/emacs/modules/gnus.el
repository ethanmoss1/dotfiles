;;; moss-gnus.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, gnus  ... ")

(use-package gnus
  :ensure nil
  :custom
  (user-mail-address "wow.ethm@gmail.com")
  (user-full-name    "Ethan Moss")

  (smtpmail-smtp-server  "smtp.gmail.com")
  (smtpmail-smtp-service 587)
  (gnus-select-method '(nnimap "imap.gmail.com"))

  (send-mail-function 'smtpmail-send-it))

(provide 'moss-gnus)
;;; moss-TEMP.el ends here -----------------------------------------------------
