;;; startup.el --- Settings and functions regarding emacs starting.  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: startup commandline cli startscreen

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
;; Settings and functions regarding emacs starting.

;; The settings and function that effect the startup of emacs.

;;; Code:
(defun display-startup-echo-area-message ()
  "Display startup echo area message."
  (message (concat "Emacs initialized in "
				   (emacs-init-time) ". "
				   (emacs-version))))

(use-package emacs
  :ensure nil
  :config
  (setq inhibit-startup-screen t
        inhibit-startup-message t
        inhibit-startup-echo-area-message t
        initial-scratch-message nil))

(provide 'startup)
;;; startup.el ends here
