;;; moss-tab-bar.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, tab-bar  ... ")

(defun moss/display-time ()
  "function that return the string, for tab-bar"
  (shell-command-to-string "date"))

(use-package tab-bar
  :ensure nil
  :bind ("s-0" . 'tab-switcher)
  :config
  ;; Configure keybindings, uses the selected modifier + digit eg, s-1
  (setq tab-bar-select-tab-modifiers '(super))

  ;; Set up the visuals of the tab-bar
  (setq tab-bar-tab-hints t
        tab-bar-close-button-show 'nil
        tab-bar-format '(tab-bar-format-tabs
                         tab-bar-separator
                         tab-bar-format-align-right
                         moss/display-time
                         tab-bar-format-global))

  ;; Enable the tab-bar
  (tab-bar-mode 1))

(provide 'moss-tab-bar)
;;; moss-tab-bar.el ends here -----------------------------------------------------
