;;; exwm.el ---   -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary :

;;; Code :
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

;;; exwm.el ends here -----------------------------------------------------
