;;; moss-exwm.el --- Summary  -*- lexical-binding: t; -*-

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, exwm  ... ")

(use-package xelb
  :if (eq my-hostname "laptop")
  :ensure (:host github :repo "emacs-exwm/xelb"))

(use-package exwm
  :if (eq my-hostname "laptop")
  :after xelb
  :ensure (:host github :repo "emacs-exwm/exwm")
  :hook (exwm-update-class . (lambda ()
                               (exwm-workspace-rename-buffer exwm-class-name)))
  :init (exwm-init)
  :config
  ;; system tray
  (require 'exwm-systemtray)
  (exwm-systemtray-enable)

  ;; Hide the minibuffer
  ;; (setq exwm-workspace-minibuffer-position 'bottom)

  ;; allow resizing of x applications
  (setq window-divider-default-right-width 12
        window-divider-default-places 'right-only)
  (window-divider-mode)

  ;; Set up workspaces and hotkeys
  (setq exwm-workspace-number 1)
  (setq exwm-input-global-keys
   `(([s-left]  . windmove-left)
     ([s-right] . windmove-right)
     ([s-up]    . windmove-up)
     ([s-down]  . windmove-down)

     ;; 's-r': Reset (to line-mode).
     ([s-r] . exwm-reset)

     ([?\s-w] . exwm-workspace-switch)
     ([s-tab] . app-launcher-run-app)))

  ;; Mimic behaviour of emacs bindings in x sessions
  (setq exwm-input-simulation-keys
        '(;; movement
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
          ([?\C-k] . [S-end C-x])

          ;; cut/paste.
          ([?\C-w] . [?\C-x])
          ([?\M-w] . [?\C-c])
          ([?\C-y] . [?\C-v])

          ;; search
          ([?\C-s] . [?\C-f])

          ;; save
          ([C-x C-s] . [?\C-s])

          ;; exit
          ([?\C-g] . [escape]))))

(use-package app-launcher
  :if (eq my-hostname "laptop")
  :ensure (:host github :repo "SebastienWae/app-launcher"))

(provide 'moss-exwm)
;;; moss-exwm.el ends here -----------------------------------------------------
