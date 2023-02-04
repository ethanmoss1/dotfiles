;;; marginalia --- summary
;;; Commentary:
;;; Code:

(message "[ Moss ] Loading module, Marginalia  ... ")

(use-package marginalia
  :init (marginalia-mode +1)
  :general
  (:keymaps 'minibuffer-local-map
            "M-A" 'marginalia-cycle)
  :config
  (setq marginalia-align-offset 10
        marginalia-field-width 160
        marginalia-separator "  "))

(provide 'moss-marginalia)
;;; moss-marginalia.el ends here
