;;; org.el ---   -*- lexical-binding: t; -*-

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
(defun org-latex-preview-buffer ()
  "Generate the previews of all latex fragments in the buffer"
  (interactive)
  (org-latex-preview '(16)))

(defun my/reload-org-agenda-files ()
  "Reloads the agenda file list"
  (interactive)
  (setq org-agenda-files (directory-files-recursively "~/documents" "\\.org$")))

(defun my/load-minor-modes-for-org ()
  "Loads all the minor modes for use with Org mode"
  (flyspell-mode 1)
  (toggle-truncate-lines 0)
  (toggle-word-wrap 1))

(defun my/add-latex-block ()
  "Adds a latex block ready for input"
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (insert "\\[")
  (newline-and-indent 2)
  (insert "\\]")
  (previous-line))

(defun my/org-agenda-with-groups ()
  "Open org-agenda and all TODOs"
  (interactive)
  (org-agenda nil "n"))

(use-package org
  :hook (org-mode . my/load-minor-modes-for-org)
  :bind (("C-c o a" . 'my/org-agenda-with-groups)
		 ("C-c o c" . 'org-capture))
  :config
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((python . t)
								 (gnuplot . t)
								 ;; (maxima . t)
								 (shell . t)
								 (C . t)))

  (setq org-directory "~/documents/org/"
        org-default-notes-file (concat org-directory "notes.org")
        org-agenda-files (directory-files-recursively "~/documents"
													  "\\.org$"))

  ;; Refiling options
  (setq org-outline-path-complete-in-steps nil
        org-refile-use-outline-path 'file
        org-refile-targets '((nil :maxlevel . 1)
                             (org-agenda-files :maxlevel . 1)))

  ;; Capture time entered and exited ‘NEXT’ as well as any notes for when
  ;; changing the state to ‘DONE’
  (setq org-todo-keywords '("TODO(t)" "NEXT(n!/!)" "|" "DONE(d@)")
		org-hide-emphasis-markers t
		org-capture-templates `(("i"               ; keys
                                 "Inbox"           ; description
                                 entry             ; type
                                 (file+headline "inbox.org" "todo")  ; target
								 ,(s-join "\n"     ; template
                                          '("** TODO %? %(org-set-tags \"new\")"
	                                        ":PROPERTIES:"
											":ENTERED: %U"
											":FILE: [[%F]]"
											":END:"))
                                 :empty-lines 1) ; properties

								("n" "Notes" entry (file+headline "inbox.org"
                                                                  "notes")
								 ,(s-join "\n" '("** %? %^G"
												 ":PROPERTIES:"
												 ":ENTERED: %U"
												 ":FILE: [[%F]]"
												 ":END:"))
                                 :empty-lines 1))))

;;; org.el ends here
