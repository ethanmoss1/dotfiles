;;; macos-config.el --- Configuration for MacOS systems  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

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
(use-package emacs
  :ensure nil
  :if (string= my-hostname "mac")
  :config
  (add-to-list 'default-frame-alist '((ns-transparent-titlebar . t)
                                      (ns-appearance . dark)))
  (setq frame-title-format nil))

;;; macos-config.el ends here
;; Local Variables:
;; eval: (if module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
