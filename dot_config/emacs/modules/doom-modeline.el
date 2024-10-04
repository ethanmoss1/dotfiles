;;; moss-doom-modeline.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(use-package doom-modeline
  :config
  (setq doom-modeline-major-mode-icon nil
        doom-modeline-buffer-file-name-style 'auto
        doom-modeline-buffer-encoding nil
        ;; doom-modeline-modal t
        doom-modeline-minor-modes t
        doom-modeline-hud t)

  (doom-modeline-mode 1))

;;; moss-doom-modeline.el ends here -----------------------------------------------------
