;;; moss-modus-theme.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, modus-themes  ... ")

(use-package modus-themes
  :init
  (setq
   modus-themes-italic-constructs t
   modus-themes-bold-constructs t
  ;;  modus-themes-mixed-fonts t
  ;;  modus-themes-variable-pitch-ui nil
  ;;  modus-themes-custom-auto-reload t
   modus-themes-disable-other-themes t

  ;;  modus-themes-prompts '(italic bold)

  ;;  modus-themes-completions
  ;;  '((matches . (extrabold))
  ;;    (selection . (semibold italic text-also)))

   modus-themes-org-blocks 'tinted-background ; {nil,'gray-background,'tinted-background}

  ;;  modus-themes-headings
  ;;  '((1 . (variable-pitch 1.5))
  ;;    (2 . (1.3))
  ;;    (agenda-date . (1.3))
  ;;    (agenda-structure . (variable-pitch light 1.8))
  ;;    (t . (1.1)))
  )
  :config
  ;; Light
  ;; (load-theme 'modus-operandi t)
  ;; (load-theme 'modus-operandi-tinted t)

  ;; Dark
  (load-theme 'modus-vivendi t))

(provide 'moss-modus-themes)
;;; moss-modus-themes.el ends here -----------------------------------------------------
