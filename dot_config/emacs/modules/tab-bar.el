;;; tab-bar.el ---   -*- lexical-binding: t; -*-

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
(defun moss/display-time ()
  "function that return the string, for tab-bar"
  (shell-command-to-string "date"))

(use-package tab-bar
  :ensure nil
  :bind ("s-0" . 'tab-switcher)
  :config
  ;; Configure keybindings, uses the selected modifier + digit eg, s-1
  ;; (setq tab-bar-select-tab-modifiers '(super))

  ;; Set up the visuals of the tab-bar
  (setq tab-bar-tab-hints t
        tab-bar-close-button-show 'nil
        tab-bar-format '(tab-bar-format-tabs
                         tab-bar-separator
                         tab-bar-format-align-right
                         moss/display-time
                         tab-bar-format-global))

  ;; Enable the tab-bar
  (tab-bar-mode 1))

;;; tab-bar.el ends here
