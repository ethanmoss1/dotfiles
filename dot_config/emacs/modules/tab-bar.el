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
(defun my/tab-bar-select-tab (num)
  "Select the tab NUM in the tab bar.
If the selected tab is not created we create all the tabs up and
including to the given tab."
  (interactive)
  (tab-bar-select-tab num))

`(use-package tab-bar
   :if (string-equal my-hostname "laptop")
   :ensure nil  ;; Because tab-bar is built-in, no need to install
   :init (tab-bar-mode)
   :bind (:map desktop-environment-mode-map
		       ,@(mapcar (lambda (i)
						   `(,(format "s-%d" i) .
							 (lambda () (interactive) (my/tab-bar-select-tab i))))
						 (number-sequence 1 9)))
   :config
   ;; Set up the visuals of the tab-bar
   (setq tab-bar-tab-hints t
         tab-bar-close-button-show 'nil
	     tab-bar-separator 'nil
	     tab-bar-tab-name-function #'tab-bar-tab-name-truncated
	     tab-bar-tab-name-truncated-max 0
	     tab-bar-tab-name-ellipsis 'nil
	     tab-bar-auto-width 'nil
	     ;; tab-bar-select-tab-modifiers '(super)
	     tab-bar-format '(tab-bar-format-tabs
                          tab-bar-separator
                          tab-bar-format-align-right
                          ;; my/display-time
					      tab-bar-format-global)))

;;; tab-bar.el ends here
