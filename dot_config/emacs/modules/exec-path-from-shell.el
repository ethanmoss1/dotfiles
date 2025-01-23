;;; exec-path-from-shell.el --- Get envrionment variables from user shell  -*- lexical-binding: t; -*-

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

;;; Commentary:
;; Mac has an issue importing env vars, this package fixes is.

;;; Code:

(use-package exec-path-from-shell
  :if (string= my-hostname "mac")
  :config
  (exec-path-from-shell-initialize))

;;; exec-path-from-shell.el ends here
;; Local Variables:
;; eval: (if module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
