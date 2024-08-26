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
  :config
  (setq modus-themes-disable-other-themes t
		;; modus-themes-italic-constructs t
		modus-themes-bold-constructs t
		;;  modus-themes-mixed-fonts t
		;;  modus-themes-variable-pitch-ui nil
		;;  modus-themes-custom-auto-reload t


		;;  modus-themes-prompts '(italic bold)

		;;  modus-themes-completions
		;;  '((matches . (extrabold))
		;;    (selection . (semibold italic text-also)))

		modus-themes-org-blocks 'tinted-background

		;;  modus-themes-headings
		;;  '((1 . (variable-pitch 1.5))
		;;    (2 . (1.3))
		;;    (agenda-date . (1.3))
		;;    (agenda-structure . (variable-pitch light 1.8))
		;;    (t . (1.1)))
		)
  (load-theme 'modus-vivendi t))

;;; modus-themes.el ends here -----------------------------------------------------
