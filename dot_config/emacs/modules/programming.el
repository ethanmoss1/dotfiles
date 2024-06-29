;;; programming.el ---

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------
(use-package emacs
  :ensure nil
  :hook (prog-mode . programming-minor-modes))

(defun programming-minor-modes ()
  "Enable minor modes for programming buffer"
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  (column-number-mode 1)
  (flyspell-prog-mode)
  (if (fboundp 'rainbow-mode)
	  (rainbow-mode 1)))

(provide 'programming)
;;; programming.el ends here -----------------------------------------------------
