;;; moss-tree-sitter.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, tree-sitter  ... ")

(use-package tree-sitter
  :config
  (global-tree-sitter-mode)

  (use-package tree-sitter-langs)
  ;; (use-package ts-fold
  ;;   ;; :straight
  ;;   ;; (ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold")
  ;;   :init
  ;;   (use-package ts-fold-indicators
  ;;     ;; :straight
  ;;     ;; (ts-fold-indicators :type git :host github
  ;;                         ;; :repo "emacs-tree-sitter/ts-fold")
  ;;     ))

  :hook
  ((java-mode . tree-sitter-hl-mode)
   ;; (emacs-lisp-mode . tree-sitter-hl-mode)
   ))





(provide 'moss-tree-sitter)
;;; moss-tree-sitter.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
