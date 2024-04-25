;;; dired --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, dired  ... ")

(use-package dired
  :ensure nil
  :defer t
  :bind
  (:map dired-mode-map
        ("<left>" . dired-up-directory)
        ("<right>" . dired-find-file))

  :config
  (setq dired-listing-switches "-laGvh --group-directories-first")

  :hook
  (dired-mode . moss-dired-mode-setup)

  :init
  (defun moss-dired-mode-setup ()
    (hl-line-mode +1)))

(provide 'moss-dired)
;;; moss-dired.el ends here
