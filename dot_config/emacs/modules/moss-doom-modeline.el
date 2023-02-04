;;; moss-doom-modeline.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, doom-modeline  ... ")

(use-package doom-modeline
  :init
  (setq-default mode-line-format "")
  :config (doom-modeline-mode 1)
  :custom
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-buffer-file-name-style 'auto)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-modal t)
  (doom-modeline-minor-modes t)
  (doom-modeline-hud t))

(provide 'moss-doom-modeline)
;;; moss-doom-modeline.el ends here -----------------------------------------------------
