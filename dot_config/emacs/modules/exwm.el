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

;; https://github.com/emacs-exwm/exwm/issues/40#issuecomment-2127601569
(define-minor-mode desktop-environment-mode
  "A global minor-mode that binds DE keys."
  :global t
  :group 'bindings
  :keymap (make-sparse-keymap))

(use-package exwm
  :if (string-equal my-hostname "laptop")
  :after xelb
  :ensure (:host github :repo "emacs-exwm/exwm")
  :init (exwm-init)
  :hook (exwm-update-class . exwm-rename-buffer-class-name)
  :bind (:map desktop-environment-mode-map
			  ;; Move around the buffers and X apps
			  ("s-<left>" . windmove-left)
			  ("s-<right>" . windmove-right)
			  ("s-<up>" . windmove-up)
			  ("s-<down>" . windmove-down)
			  ;; EXWM functions
			  ("s-R" . exwm-reset)
			  ("s-w" . exwm-workspace-switch)
			  ;; DE bindings
			  ("s-<return>" . (lambda ()
								(interactive)
								(eshell))))
  :config
  (defun exwm-rename-buffer-class-name ()
	"Rename the EXWM buffers with the X11 Class name"
	(exwm-workspace-rename-buffer exwm-class-name))

  ;; Setup the keymap to allow for keybindings in EXWM and non-EXMW buffers
  ;; https://github.com/emacs-exwm/exwm/issues/40#issuecomment-2127601569
  (set-keymap-parent exwm-mode-map desktop-environment-mode-map)
  (desktop-environment-mode)

  ;; Systemtray
  (require 'exwm-systemtray)
  (exwm-systemtray-mode 1)

  ;; Allow resizing of x applications, otherwise difficult
  (setq window-divider-default-right-width 12
        window-divider-default-places 'right-only)
  (window-divider-mode)

  (setq exwm-workspace-number 1)

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

;;; exwm.el ends here -----------------------------------------------------
