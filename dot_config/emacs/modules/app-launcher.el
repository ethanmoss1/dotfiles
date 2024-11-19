;;; app-launcher.el --- Launch Desktop Applications  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: app x11 exwm

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
;; Launch Desktop Applications

;; Launch applications such as a web browser from within emacs

;;; Code:
(use-package app-launcher
  :if (string-equal my-hostname "laptop")
  :ensure ( :host github
            :protocol ssh
            :repo "ethanmoss1/app-launcher")
  :bind (:map desktop-environment-mode-map
			  ("s-<tab>" . app-launcher-run-app)))

;;; app-launcher.el ends here
