;;; moss-vertico.el --- Summary
;;; Commentary
;;; Code:
(message "[ Moss ] Loading module, Vertico  ... ")

(use-package vertico
  :init (vertico-mode 1)
  :config
  (setq vertico-count 7))

(provide 'moss-vertico)
;; moss-vertico.el ends here
