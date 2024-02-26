;;; moss-keybindings.el -- Summary

;;; Commentary:

;;; Code:

(defun split-window-below-and-focus ()
  (interactive)
  (if (string-equal major-mode "exwm-mode")
      (progn
        (split-window-below)
        (sit-for 0.1)
        (other-window 1))
    (split-window-below)
    (other-window 1)))

(defun split-window-right-and-focus ()
  (interactive)
  (if (string-equal major-mode "exwm-mode")
      (progn
        (split-window-right)
        (sit-for 0.1)
        (other-window 1))
    (split-window-right)
    (other-window 1)))

(use-package emacs
  :elpaca nil
  :bind
  (:map global-map
        ("C-x k" . 'kill-this-buffer)   ; Kill buffer without asking which one
        ("C-x 2" . 'split-window-below-and-focus)
        ("C-x 3" . 'split-window-right-and-focus)))

(provide 'moss-keybindings)
;;; moss-keybindings.el ends here
