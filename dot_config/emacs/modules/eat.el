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
  ;; (add-hook 'eshell-load-hook #'eat-eshell-mode)

  ;; For `eat-eshell-visual-command-mode'
  (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode))


;; (add-to-list 'display-buffer-alist
;;              '("\\*e?shell\\*"
;;                (display-buffer-in-side-window)
;;                (side . bottom)
;;                (slot . -1) ;; -1 == L  0 == Mid 1 == R
;;                (window-height . 0.33) ;; take 2/3 on bottom left
;;                (window-parameters
;;                 (no-delete-other-windows . nil))))

(provide 'moss-eat)
;;; moss-eat.el ends here -----------------------------------------------------
