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

(defun moss/reload-org-agenda-files ()
  "Reloads the agenda file list"
  (interactive)
  (setq org-agenda-files (directory-files-recursively "~/documents/org" "\\.org$")))


(defun moss/load-minor-modes-for-org ()
  "Loads all the minor modes for use with Org mode"
  (flyspell-mode 1)
  (toggle-truncate-lines 0)
  (toggle-word-wrap 1))

(defun moss/add-latex-block ()
  "Adds a latex block ready for input"
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (insert "\\[")
  (newline-and-indent 2)
  (insert "\\]")
  (previous-line))


;; (defun org--get-display-dpi ()
;;   "MODIFIED FOR TABLET - MOSS
;; Get the DPI of the display.
;; The function assumes that the display has the same pixel width in
;; the horizontal and vertical directions."
;;   266)

(use-package org
  :hook (org-mode . moss/load-minor-modes-for-org)
  :bind
  ("C-c o a" . 'org-agenda)
  ("C-c o c" . 'org-capture)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages '((python . t)
                               (gnuplot . t)
                               (maxima . t)
                               (shell . t)
                               (C . t)))

  ;; :custom-face
  ;; (org-level-1 ((t (:inherit outline-1 :height 1.75))))
  ;; (org-level-2 ((t (:inherit outline-2 :height 1.5))))
  ;; (org-level-3 ((t (:inherit outline-3 :height 1.25))))
  ;; (org-level-4 ((t (:inherit outline-4 :height 1.1))))
  ;; (org-document-title ((t (:height 2.0))))

  :custom
  (org-directory "~/documents/org/")
  (org-agenda-files (directory-files-recursively "~/documents/org" "\\.org$"))
  (org-format-latex-options (plist-put org-format-latex-options :scale 1))
  (org-hide-emphasis-markers t)
  ;; (org-refile-targets
  ;;     '((nil :maxlevel . 3)
  ;;       (org-agenda-files :maxlevel . 3)))

  (org-capture-templates
   `(("i" "Inbox" entry (file "inbox.org")
      ,(s-join "\n" '("* TODO %?"
                       ":PROPERTIES:"
                       ":ENTERED: %U"
                       ":FILE: [[%F]]"
                       ":END:"))))))

;;; org.el ends here
