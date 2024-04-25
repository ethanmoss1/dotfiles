;;; Moss-ispell.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, ispell  ... ")

(use-package ispell
  :ensure nil
  :init
  (setq ispell-dictionary "british"))

(provide 'moss-ispell)
;;; moss-ispell.el ends here -----------------------------------------------------
