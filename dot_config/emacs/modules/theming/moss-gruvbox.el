;;; moss-gruvbox.el --- My theme of choice
;;; Commentary:
;;
;;; Code:
(message "[ Moss ] Loading Module, Theme-Gruvbox ... ")

(use-package gruvbox-theme
  ;; :disabled
  ;; :straight
  ;; (gruvbox-theme :type git :host github :repo "greduan/emacs-theme-gruvbox")
  ;; (gruvbox-theme :type git :host github :repo "ethanmoss1/emacs-theme-gruvbox")
  :custom-face
  (internal-border ((t (:background nil))))
  :config
  (load-theme 'gruvbox-dark-soft t))

(provide 'moss-gruvbox)
;;; moss-gruvbox.el ends here
