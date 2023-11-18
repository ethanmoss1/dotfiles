;;; Moss-ispell.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, ispell  ... ")

(use-package ispell
  ;; :disabled
  :elpaca nil
  :init
  (setq ispell-dictionary "british"))

(provide 'moss-ispell)
;;; moss-ispell.el ends here -----------------------------------------------------
