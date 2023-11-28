;;; moss-conf-mode.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, conf-mode  ... ")

(use-package conf-mode
  :elpaca nil
  :config
  (add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . conf-mode)))

(provide 'moss-conf-mode)
;;; moss-conf-mode.el ends here ------------------------------------------------
