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

;;; Code:

(defun nixos-edit-config ()
  "Edit the nixos config file"
  (interactive)
  (find-file "/sudo::/etc/nixos/configuration.nix"))

;; Run a nice buffer with the output of the nix rebuild
(defun nixos-rebuild-config ()
  "Rebuild the system nixos rebuild"
  (let* ((default-directory "/sudo::/"))
    (if (string= my-hostname "mac")
        ;; TODO: This is hard coded and needs to change
        (compile "darwin-rebuild switch --flake /Users/ethan/.config/nix-darwin")
      (compile "nixos-rebuild switch"))))


;;; Old code for nixos rebuild
;; --
;;   (let* ((default-directory "/sudo::/")
;; 		 (command "nixos-rebuild switch")
;; 		 (buffer (get-buffer-create "*nixos-rebuild*")))
;; 	(start-file-process-shell-command "nix-rebuild" buffer command)
;;     (switch-to-buffer buffer)
;;     (with-current-buffer buffer
;; 	  (setq buffer-read-only t))))
;; --

(add-to-list 'display-buffer-alist
			 '("^*comp"
               (display-buffer-reuse-window display-buffer-below-selected)
               (window-height . 0.33)
               (window-parameters
                (no-delete-other-windows . t))))

(use-package nix-mode
  :bind ( :map nix-mode-map
          ("C-c C-c" . (lambda () (interactive) (nixos-rebuild-config)))))

;;; nix.el ends here
