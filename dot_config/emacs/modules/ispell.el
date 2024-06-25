;;; Moss-ispell.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, ispell  ... ")

(use-package ispell
  :ensure nil
  :custom
  (ispell-dictionary "british")
  (ispell-program-name (executable-find "hunspell")))

(provide 'moss-ispell)
;;; moss-ispell.el ends here -----------------------------------------------------
