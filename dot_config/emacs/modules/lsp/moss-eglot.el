;;; eglot --- summary

(message "[ Moss ] Loading module, Eglot ... ")

(use-package eldoc)

(use-package eglot
  :after eldoc
  :hook
  ((emacs-lisp-mode . eglot-ensure)
   (java-mode       . eglot-ensure)
   (python-mode     . eglot-ensure))

  :bind
  (:map eglot-mode-map
        ("C-c e r" . eglot-rename)
        ("C-c e h" . eldoc)
        ("C-c e f" . eglot-format)
        ("C-c e F" . eglot-format-buffer)))

(use-package eglot-java
  :after eglot
  :hook (java-mode . eglot-java))

(provide 'moss-eglot)
;;; moss-eglot.el ends here
