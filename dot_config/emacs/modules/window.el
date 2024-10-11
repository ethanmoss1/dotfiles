;;; window.el --- Lisp Window commands   -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: internal emacs builtin

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
;; Lisp Window commands

;; Modifying Window function that aren't written in C.

;;; Code:

(use-package window
  :ensure nil
  :hook (elpaca-after-init . window-divider-mode)
  :config
  (setq switch-to-buffer-obey-display-actions t
		split-width-threshold 170
		split-height-threshold nil)

  ;; resizing windows
  (setq window-resize-pixelwise nil
		resize-mini-windows 'grow-only)

  ;; Window divider
  (setq window-divider-default-places t
		window-divider-default-right-width 1
		window-divider-default-bottom-width 1))

;;; window.el ends here
