;;; pdf-tools.el --- Summary

;;; Commentary:

;;; Code:
(use-package pdf-tools
  :if (string-equal my-hostname "laptop")
  :config
  (pdf-tools-install)
  (setq pdf-view-display-size 'fit-page))

;;; pdf-tools.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
