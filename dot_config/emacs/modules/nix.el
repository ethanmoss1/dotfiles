;;; nix.el --- Nix mode for syntax  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: emacs lisp

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

;;; Commentary:
;; Nix mode for syntax

;; Nix mode with syntax and more

;;; Code:
(defun nixos-edit-config ()
  "Edit the nixos config file"
  (interactive)
  (find-file "/sudo::/etc/nixos/configuration.nix"))

;; Run a nice buffer with the output of the nix rebuild
(defun my/nixos-rebuild ()
  "Rebuild the system nixos rebuild"
  (interactive)
  ;; (let ((rebuild-command "nixos-rebuild --switch"))
  (let* ((password (read-passwd "Enter your password: "))
		 (command (format "echo %s | sudo -S nixos-rebuild switch \n" password ))
		 (buffer (get-buffer-create "*Nixos-rebuild*")))
	(start-process-shell-command "nix-rebuild" buffer command)
	(with-current-buffer buffer
	  (setq buffer-read-only t))))

(use-package nix-mode)

;;; nix.el ends here
