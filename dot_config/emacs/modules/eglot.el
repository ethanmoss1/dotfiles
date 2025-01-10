;;; eglot.el --- LSP for Emacs                       -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Ethan Moss

;; Author: Ethan Moss <ethan@Ethans-MacBook-Pro.local>
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

;;; Code:

(use-package eldoc)

(use-package eglot
  :after eldoc
  :hook ((emacs-lisp-mode . eglot-ensure)
         (java-mode       . eglot-ensure)
         (python-mode     . eglot-ensure)
         (nix-mode        . eglot-ensure))
  :bind (:map eglot-mode-map
              ("C-c e r" . eglot-rename)
              ("C-c e h" . eldoc)
              ("C-c e f" . eglot-format)
              ("C-c e F" . eglot-format-buffer)))

;;; eglot.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
