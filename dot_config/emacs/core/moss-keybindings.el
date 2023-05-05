;;; moss-keybindings.el -- Summary

;;; Commentary:

;;; Code:

(defun split-window-below-and-focus ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun split-window-right-and-focus ()
  (interactive)
  (split-window-right)
  (other-window 1))

(use-package emacs
  :elpaca nil
  :bind
  (:map global-map
        ("C-x k" . 'kill-this-buffer)   ; Kill buffer without asking which one
        ("C-x 2" . 'split-window-below-and-focus)
        ("C-x 3" . 'split-window-right-and-focus)))

(provide 'moss-keybindings)
;;; moss-keybindings.el ends here
