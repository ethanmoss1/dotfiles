;;; moss-evil.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, evil  ... ")

(defconst moss/leader "SPC")

(use-package general)

(use-package evil
  :config
  (evil-mode 1)
  (general-define-key
   :prefix "SPC"
   :states 'normal
   "SPC" 'execute-extended-command

   ;; Help
   "h h" 'helpful-at-point
   "h f" 'helpful-callable
   "h v" 'helpful-variable
   "h k" 'helpful-key
   "h b" 'general-describe-keybindings
   "h m" 'describe-mode
   "h n" 'describe-minor-mode

   "f f" 'find-file
   ;; Windows
   ;; "w "

   ;; Buffers
   "b b" 'consult-buffer
   "b k" 'kill-this-buffer
   "b s" 'save-buffer ))

(provide 'moss-evil)


;;; moss-evil.el ends here -----------------------------------------------------
