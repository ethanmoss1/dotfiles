;;; moss-keybindings.el -- Summary

;;; Commentary:

;;; Code:

(defun split-window-below-and-focus ()
  (interactive)
  (split-window-below)
  (redisplay)
  (windmove-down))

(defun split-window-right-and-focus ()
  (interactive)
  (split-window-right)
  (redisplay)
  (windmove-right))

(use-package emacs
  :ensure nil
  :bind
  (:map global-map
        ("RET" . 'newline-and-indent)
        ("C-x k" . 'kill-current-buffer)   ; Kill buffer without asking which one
        ("C-x 2" . 'split-window-below-and-focus)
        ("C-x 3" . 'split-window-right-and-focus)))

(provide 'moss-keybindings)
;;; moss-keybindings.el ends here
