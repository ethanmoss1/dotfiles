;;; moss-gruvbox.el --- My theme of choice
;;; Commentary:
;;
;;; Code:
(message "[ Moss ] Loading Module, Theme-Gruvbox ... ")

(use-package gruvbox-theme
  :straight
  (gruvbox-theme :type git :host github :repo "greduan/emacs-theme-gruvbox")
  :config
  (load-theme 'gruvbox t))

(provide 'moss-gruvbox)
;;; moss-gruvbox.el ends here
