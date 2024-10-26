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
  (setq org-agenda-files (directory-files org-directory t "\\.org$")))

(defun my/reload-org-agenda-files-all ()
  "Reloads the agenda file list"
  (interactive)
  (setq org-agenda-files-all (directory-files-recursively "~/documents" "\\.org$")))

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

;; (defun my/org-remove-inherited-tag-strings ()
;;   "Removes inherited tags from the headline-at-point's tag string.
;; Note this does not change the inherited tags for a headline,
;; just the tag string."
;;   (interactive)
;;   (org-set-tags (seq-remove (lambda (tag)
;;                               (get-text-property 0 'inherited tag))
;;                             (org-get-tags))))

(defun my/org-clean-tags ()
  "Visit last refiled headline and remove inherited tags from tag string.

Inspiration from:
https://www.reddit.com/r/orgmode/comments/ae2ak0/orgmode_clean_tag_string_on_refile/"
  (save-window-excursion
    (org-refile-goto-last-stored)
    (org-set-tags "")))

(use-package org
  :hook ((org-mode . my/load-minor-modes-for-org)
         (org-agenda-mode  . hl-line-mode)
         ;; Clean tags on refile
         (org-after-refile-insert . my/org-clean-tags))
  :bind (("C-c o a" . 'my/org-agenda-with-groups)
		 ("C-c o c" . 'org-capture))
  :config
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((python . t)
								 (gnuplot . t)
								 ;; (maxima . t)
								 (shell . t)
								 (C . t)))

  ;; Org related files.
  (setq org-directory "~/documents/org/"
        org-default-notes-file (concat org-directory "notes.org")
        org-agenda-files (directory-files org-directory t "\\.org$")
        org-agenda-files-all (directory-files-recursively "~/documents" "\\.org$"))

  ;; Org-agenda settings
  (setq org-agenda-show-future-repeats t)
  (setq org-agenda-include-diary nil)
  (setq org-agenda-custom-commands  ;; Setting up the agenda views
        '(("n"       ; Key
           "Agenda"  ; Description
           ((agenda "")
            (tags-todo "+new"
                       ((org-agenda-overriding-header "Inbox")
                        (org-agenda-prefix-format '((tags . " %i ")))
                        (org-agenda-remove-tags t)))
            (tags-todo "-habit-new"
                       ((org-agenda-overriding-header "Tasks and Next actions")
                        (org-agenda-block-separator nil)
                        (org-agenda-remove-tags t)))))

          ;; Default - show all org files in ‘~/documents’ recursively.
          ("b"
           "Agenda - All Org Files"
           ((agenda "")
            (alltodo ""))
           ((org-agenda-files org-agenda-files-all)))))


  ;; Scale latex to size based on the hostname
  (if (string-equal my-hostname "laptop")
      (plist-put org-format-latex-options :scale 1.8)
    (plist-put org-format-latex-options :scale 1))

  ;; Refiling options
  (setq org-outline-path-complete-in-steps nil
        org-refile-use-outline-path 'file
        org-refile-targets '((nil :maxlevel . 2)
                             (org-agenda-files :maxlevel . 2)
                             (org-agenda-files-all :maxlevel . 1)))

  ;; Capture time entered and exited ‘NEXT’ as well as any notes for when
  ;; changing the state to ‘DONE’
  (require 's)
  (setq org-todo-keywords '("TODO(t)" "NEXT(n!/!)" "|" "DONE(d@)" "CANCELLED(c@)")
		org-hide-emphasis-markers t
		org-capture-templates `(("i"               ; keys
                                 "Inbox"           ; description
                                 entry             ; type
                                 (file+headline "inbox.org" "todo")  ; target
								 ,(s-join "\n"     ; template
                                          '("** TODO %?" ;; %(org-set-tags \"new\")"
	                                        ":PROPERTIES:"
											":ENTERED: %U"
											":FILE: [[%F]]"
											":END:"))
                                 :empty-lines 1) ; properties

								("n"
                                 "Notes"
                                 entry
                                 (file+headline "inbox.org" "notes")
								 ,(s-join "\n" '("** %? %^G"
												 ":PROPERTIES:"
												 ":ENTERED: %U"
												 ":FILE: [[%F]]"
												 ":END:"))
                                 :empty-lines 1)))

  ;; Set up org buffer views:
  (add-to-list 'display-buffer-alist
               ;; If the buffer is one of the following; (case insensitive)
               ;; *Org Note*
               ;; *Org Select*
               ;; CAPTURE-...
               '("^\\(*org \\(note\\|select\\)\\*\\|capture\\)"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (slot . 0)
                 (window-height . 0.33)
                 (window-parameters
                  (no-delete-other-windows . t))))

  ;; Follow links in the same window, not the other window.
  (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)

  ;; show just the subtree I’m interested in, lowers visual clutter.
   (advice-add 'org-agenda-goto :after
               (lambda (&rest args)
                 (org-narrow-to-subtree)))

  )

;;; org.el ends here
