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

(defun exwm-rename-buffer-class-name ()
  "Rename the EXWM buffers with the X11 Class name"
  (if (and (string-equal exwm-class-name "firefox") exwm-title)
	  (let* ((page-title (car (split-string exwm-title "\\ +[-—]\\ +")))
			 (new-buffer-name (concat "*" exwm-class-name " - " page-title "*")))
		(exwm-workspace-rename-buffer new-buffer-name))
	(exwm-workspace-rename-buffer exwm-class-name)))

;; (defun exwm-launch-terminal ()
;;   "Launch EAT if installed otherwise launch eshell"
;;   (interactive)
;;   ;; check if eat is installed
;;   ;; otherwise use eshell
;;   (if (fboundp 'eat)
;;       (eat)
;;     (eshell)))

(defun exwm-setup-local-simulation-keys ()
  ""
  (when (and exwm-class-name
             ;; TODO: List of classes instead of just firefox
             (string= exwm-class-name "Firefox"))
    (exwm-input-set-local-simulation-keys exwm-input-simulation-keys)))

(use-package exwm
  :ensure nil  ;; supplied by nixos
  :if (string-equal my-hostname "laptop")
  :hook ((exwm-update-title . exwm-rename-buffer-class-name)
         (exwm-manage-finish . exwm-setup-local-simulation-keys)
         (elpaca-after-init . exwm-init))
  :bind ( :map desktop-environment-mode-map
		  ;; Move around the buffers and X apps
		  ("s-<left>" . windmove-left)
		  ("s-<right>" . windmove-right)
		  ("s-<up>" . windmove-up)
		  ("s-<down>" . windmove-down)

          ;; EXWM functions
		  ("s-R" . exwm-reset))
  :config
  ;; Setup the keymap to allow for keybindings in EXWM and non-EXMW buffers
  ;; https://github.com/emacs-exwm/exwm/issues/40#issuecomment-2127601569
  (set-keymap-parent exwm-mode-map desktop-environment-mode-map)
  (desktop-environment-mode t)

  ;; Dont ask to replace, if I have another WM open its probably for a reason
  (setq exwm-replace 'nil)

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

(if (string= my-hostname "laptop")
    (elpaca-wait))

;;; exwm.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
