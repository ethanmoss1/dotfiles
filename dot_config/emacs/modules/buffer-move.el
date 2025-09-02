;;; buffer-move.el --- Move buffers to a window  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: buffer exwm

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
;; Move buffers to a window

;; Allows moving of buffers to another window with direction.

;;; Code:

(use-package buffer-move
  :if (string-equal my-hostname "linux")
  :bind (:map desktop-environment-mode-map
			  ("s-S-<left>" . buf-move-left)
			  ("s-S-<right>" . buf-move-right)
			  ("s-S-<up>" . buf-move-up)
			  ("s-S-<down>" . buf-move-down)))

;;; buffer-move.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
