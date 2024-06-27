;;; ui.el --- Emacs UI Customisation  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: ui

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
;; Emacs UI Customisation

;; Opinionated UI customisation, This removes a lot of clutter and startup
;; noise. It also changes some defaults so some sainer (?)

;;; Code:
;; Change startup message
(defun display-startup-echo-area-message ()
  "Display startup echo area message."
  (message (concat "Emacs initialized in "
				   (emacs-init-time) ". "
				   (emacs-version))))
(display-startup-echo-area-message)

(setq frame-title-format
      '("Emacs - " (:eval (if (buffer-file-name)
                              (abbreviate-file-name (buffer-file-name))
                            "%b")))
      use-dialog-box nil                             ; Dont want GUI popups
      widget-image-enable nil                        ; No ugly button for checkboxes
      inhibit-startup-screen t
	  inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil
	  blink-cursor-delay 0.5
      blink-cursor-interval 0.5
      mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed t               ; accelerate scrolling
      mouse-wheel-follow-mouse 't                   ; scroll window under mouse
      scroll-margin 2                               ; Scroll when x lines from window boundary.
      scroll-step 0                                 ; scroll amount
      scroll-conservatively most-positive-fixnum)   ; dont want to jumps around

(display-startup-echo-area-message)

;; Remove default additions to maximise lines
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(menu-bar-mode -1)
(tooltip-mode -1)

;; Set up font
(if window-system
    ;; Set default font based on priority list
    (let* ((families '("JetBrains Nerd Font Mono"
                       "JetBrains Mono"
                       "Roboto Nerd Font Mono"
                       "Roboto Mono"
                       "Droid Sans Mono"
                       "Roboto"))
           (family (catch 'found
                     (dolist (f families)
                       (if (member f (font-family-list))
                           (throw 'found f))))))
      (set-face-attribute 'default nil
                            :family family :height 120)
      (message (concat "Font loaded: " family))))

(provide 'ui)
;;; ui.el ends here --------------------------------------------------
