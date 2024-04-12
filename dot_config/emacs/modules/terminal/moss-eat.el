;;; moss-eat.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, eat  ... ")

(use-package eat
  :custom
  (eat-kill-buffer-on-exit t)
  :config
  ;; Set shell for android
  (if (eq system-type 'android)
      (setq eat-shell "/data/data/com.termux/files/usr/bin/bash"))
  ;; For `eat-eshell-mode'
  (add-hook 'eshell-load-hook #'eat-eshell-mode)

  ;; For `eat-eshell-visual-command-mode'
  (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode))

(provide 'moss-eat)
;;; moss-eat.el ends here -----------------------------------------------------
