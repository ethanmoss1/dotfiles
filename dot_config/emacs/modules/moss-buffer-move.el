;;; moss-buffer-move.el --- Summary

;;; Commentary:

;; global-set-key (kbd "<C-S-up>")     'buf-move-up)
;; (global-set-key (kbd "<C-S-down>")   'buf-move-down)
;; (global-set-key (kbd "<C-S-left>")   'buf-move-left)
;; (global-set-key (kbd "<C-S-right>")  'buf-move-right)


;;; Code:

(message "[ Moss ] Loading module, buffer-move  ... ")

(use-package buffer-move
  :general
  ("M-S-<up>" 'buf-move-up)
  ("M-S-<down>" 'buf-move-down)
  ("M-S-<left>" 'buf-move-left)
  ("M-S-<right>" 'buf-move-right)
  :config
  (windmove-mode +1)
  (windmove-default-keybindings 'meta))

(provide 'moss-buffer-move)
;;; moss-buffer-move.el ends here
