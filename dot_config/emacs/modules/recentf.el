;;; recentf --- Summary

;;; Commentary:

;;; Code:
(use-package recentf
  :ensure nil
  :demand t
  :custom
  (recentf-save-file (concat user-emacs-directory "recentf"))
  (recentf-max-saved-items 10000)
  (recentf-max-menu-items 1000)
  (recentf-auto-cleanup 'never)
  (recentf-exclude '("\\.git.*"))
  :config
  (recentf-mode t))

(provide 'moss-recentf)
;;; moss-recentf.el ends here
