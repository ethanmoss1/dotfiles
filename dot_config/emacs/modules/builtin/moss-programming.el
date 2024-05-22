;;; moss-programming.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, programming  ... ")

(use-package emacs
  :ensure nil
  :hook (prog-mode . moss/programming-minor-modes)
  :custom
  (ispell-program-name (executable-find "hunspell")))

(defun moss/programming-minor-modes ()
  "Enabe minor modes for programming buffer"
  (display-line-numbers-mode)
  (hl-line-mode)
  (column-number-mode)
  ;; (flyspell-prog-mode)
  (rainbow-mode))

(provide 'moss-programming)
;;; moss-programming.el ends here -----------------------------------------------------
