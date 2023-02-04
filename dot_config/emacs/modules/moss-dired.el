;;; dired --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, dired  ... ")

(use-package dired
  :straight (:type built-in)
  :defer t
  :config
  (setq dired-listing-switches "-laGvh --group-directories-first")
  :hook
  (dired-mode . moss-dired-mode-setup)
  :preface
  (defun moss-dired-mode-setup ()
    (hl-line-mode +1)))

(provide 'moss-dired)
;;; moss-dired.el ends here
