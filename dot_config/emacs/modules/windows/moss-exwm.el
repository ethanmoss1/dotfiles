;;; moss-exwm.el --- Summary  -*- lexical-binding: t; -*-

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, exwm  ... ")

(use-package xelb
  :elpaca
  (:host github :repo "emacs-exwm/xelb"))

(use-package exwm
  ;; currently exwm is changing repo, recipes havent been updated correctly
  :after xelb
  :elpaca
  (:host github :repo "emacs-exwm/exwm")

  :config
  ;; system tray
  (require 'exwm-systemtray)
  (exwm-systemtray-enable)

  ;; allow resizing of x applications
  (setq window-divider-default-right-width 12
        window-divider-default-places 'right-only)
  (window-divider-mode)


  :hook
  (exwm-update-class . (lambda ()
                         (exwm-workspace-rename-buffer exwm-class-name)))

  :custom
  (exwm-workspace-number 3)
  (exwm-input-global-keys
   `(([s-left] . windmove-left)
     ([s-right] . windmove-right)
     ([s-up] . windmove-up)
     ([s-down] . windmove-down)

     ;; 's-r': Reset (to line-mode).
     ;; ([s-r] . exwm-reset)

     ;; ([?\s-w] . exwm-workspace-switch)
     ([s-tab] . (lambda (command)
                    (interactive (list (read-shell-command "$ ")))
                    (start-process-shell-command command nil command)))
     ,@(mapcar (lambda (i)
                 `(,(kbd (format "s-%d" i)) .
                   (lambda ()
                     (interactive)
                     (exwm-workspace-switch-create ,i))))
               (number-sequence 0 9))))

  ;; Mimic behaviour of emacs bindings im x sessions
  (exwm-input-simulation-keys
        '(
          ;; movement
          ([?\C-b] . [left])
          ([?\M-b] . [C-left])
          ([?\C-f] . [right])
          ([?\M-f] . [C-right])
          ([?\C-p] . [up])
          ([?\C-n] . [down])
          ([?\C-a] . [home])
          ([?\C-e] . [end])
          ([?\M-v] . [prior])
          ([?\C-v] . [next])
          ([?\C-d] . [delete])
          ([?\C-k] . [S-end delete])
          ;; cut/paste.
          ([?\C-w] . [?\C-x])
          ([?\M-w] . [?\C-c])
          ([?\C-y] . [?\C-v])
          ;; search
          ([?\C-s] . [?\C-f])
          ;; save
          ([C-x C-s] . [?\C-s])
          ;; exit
          ([?\C-g] . [escape])
          )))
;; If we are using EWXM, enable the interesting stuff
(use-package exwm-modeline
  :config (exwm-modeline-mode))

(provide 'moss-exwm)
;;; moss-exwm.el ends here -----------------------------------------------------
