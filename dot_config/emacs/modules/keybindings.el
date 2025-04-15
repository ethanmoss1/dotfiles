;;; keybindings.el --- Personal keybindings  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: keybindings shortcuts windowsplit

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
;; Personal keybindings

;; This is my opinionated keybindings for GNU Emacs. Some default behaviours are
;; different from the original.

;;; Code:

(defun my/move-beginning-of-line ()
  "Go to beginning of line or to first non-whitespace character
depending on current position of point

https://www.reddit.com/r/emacs/comments/1i1sv9u/comment/m7o54ko/"
  (interactive)
  (let ((pos (current-column)))
    (back-to-indentation)
    (if (and (<= pos (current-column)) (not (= pos 0)))
        (move-beginning-of-line 1))))


(defun split-window-below-and-focus ()
  (interactive)
  (split-window-below)
  (redisplay)           ; for exwm bug
  (windmove-down)
  (consult-buffer))

(defun split-window-right-and-focus ()
  (interactive)
  (split-window-right)
  (redisplay)           ; for exwm bug
  (windmove-right)
  (consult-buffer))

;; Unbind suspend
(global-unset-key (kbd "C-z"))

(use-package emacs
  :ensure nil
  :bind (("RET" . 'newline-and-indent)
         ;; ("C-x k" . 'kill-current-buffer)   ; Kill buffer without asking which one
         ("C-x k" . 'kill-buffer-and-window)
		 ("C-x C-b" . 'ibuffer)
         ("C-x 2" . 'split-window-below-and-focus)
         ("C-x 3" . 'split-window-right-and-focus)
         ("<home>" . 'my/move-beginning-of-line)
         ;;("M-o" . 'other-window)
         ("C-a" . 'my/move-beginning-of-line)))

;;; keybindings.el ends here
