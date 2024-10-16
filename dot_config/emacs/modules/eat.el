;;; moss-eat.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, eat  ... ")

(use-package eat
  :config
  ;; Eat settings
  (setq eat-kill-buffer-on-exit t)
  ;; Set shell for android
  (if (string-equal my-hostname "tablet")
      (setq eat-shell "/data/data/com.termux/files/usr/bin/bash"))
  ;; For `eat-eshell-mode'
  (add-hook 'eshell-load-hook #'eat-eshell-mode)

  ;; For `eat-eshell-visual-command-mode'
  (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)

  ;; Set up the popup shell
  (add-to-list 'display-buffer-alist
               '("\\*e?shell\\*"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (slot . -1) ;; -1 == L  0 == Mid 1 == R
                 (window-height . 0.33) ;; take 2/3 on bottom left
                 (window-parameters
                  (no-delete-other-windows . nil)))))

(provide 'moss-eat)
;;; moss-eat.el ends here -----------------------------------------------------
