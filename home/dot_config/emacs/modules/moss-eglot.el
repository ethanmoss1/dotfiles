;;; eglot --- summary

;;; Commentary:

;;; Code:
(message "[ Moss ] Loading module, Eglot ... ")

(use-package eglot
  ;; :hook
  ;; ((emacs-lisp-mode . eglot-ensure))
  :bind
  (:map eglot-mode-map
        ("C-c r" . eglot-rename)
        ("C-c h" . eldoc)
        ("C-c f" . eglot-format)
        ("C-c F" . eglot-format-buffer)))

(provide 'moss-eglot)
;;; moss-eglot.el ends here
