;;; modus-themes.el ---   -*- lexical-binding: t; -*-

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
(use-package modus-themes
  :custom-face
  ;; (fringe ((t (:background "#000000"))))
  :config
  (setq modus-themes-disable-other-themes t
		modus-themes-italic-constructs t
		modus-themes-bold-constructs t
		modus-themes-org-blocks 'tinted-background)

  (load-theme 'modus-vivendi t))

;;; modus-themes.el ends here -----------------------------------------------------
