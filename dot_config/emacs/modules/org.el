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

;;; Code :

;;;; Org Related functions -----------------------------------------------------

(defun org-latex-preview-buffer ()
  "Generate the previews of all latex fragments in the buffer"
  (interactive)
  (org-latex-preview '(16)))

(defun my/reload-org-agenda-files ()
  "Reloads the agenda file list"
  (interactive)
  (setq org-agenda-files (directory-files org-directory t "\\.org$"))
  (setq org-agenda-files-and-study
        (append (directory-files org-directory t "\\.org$")
                (directory-files-recursively "~/documents/study" "\\.org$")))
  (setq org-agenda-files-all (directory-files-recursively "~/documents" "\\.org$")))

(defun my/load-minor-modes-for-org ()
  "Loads all the minor modes for use with Org mode"
  ;; (unless (fboundp 'jinx-mode)
  ;;   (flyspell-mode 1))
  (toggle-truncate-lines 0)
  (toggle-word-wrap 1)
  (adaptive-wrap-prefix-mode)
  (if (fboundp 'olivetti-mode)
      (olivetti-mode t)))

;; TODO: Make sure this is correct and runs as expected.
(defun my/org-mode-hook ()
  "My custom org-mode hook."
  (unless (and org-refile-targets
               (bound-and-true-p org-agenda-mode)
               org-agenda-files)
    ;; Your hooks here (e.g., enable specific modes, set variables, etc.)
    (message "Running my org-mode hooks.")
    (my/load-minor-modes-for-org)
    ))


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

(defun my/org-agenda-skip-tags (tags)
  "Return T if any string in the list TAGS is in the headers tags.
Otherwise will return NIL"
  ;; (org-back-to-heading t)
  (and (not (null (cl-intersection tags (org-get-tags) :test 'string=)))
       (org-entry-end-position)))

;; Emphasis words easily. pilfered from;
;; https://christiantietze.de/posts/2024/12/org-mode-emphasis-keymap-mnemonics/
(defun my/org-emphasize-below-point (&optional char)
  "Emphasise region with CHAR.

If there's no region, marks the closest s-expression, first.
Opposed to word boundaries, sexp's work with `subword-mode' enabled."
  (interactive)
  (unless (region-active-p)
    (backward-sexp)
    (mark-sexp))
  (org-emphasize char))

(defvar-keymap my/org-emphasis-map
  :doc "Keymap for quickly applying Org emphasis rules."
  :name "[b]old [i]talic [u]nderscore [v]erbatim [c]ode [s]trike-though"
  "b" (lambda () (interactive) (my/org-emphasize-below-point ?*))
  "i" (lambda () (interactive) (my/org-emphasize-below-point ?/))
  "u" (lambda () (interactive) (my/org-emphasize-below-point ?_))
  "v" (lambda () (interactive) (my/org-emphasize-below-point ?=))
  "c" (lambda () (interactive) (my/org-emphasize-below-point ?~))
  "s" (lambda () (interactive) (my/org-emphasize-below-point ?+)))

;;;; Use-package ---------------------------------------------------------------

;; Requires ‘s’ ?
(use-package s)
(use-package org
  :ensure nil
  :after s
  :hook ((org-mode . my/org-mode-hook)
         (org-agenda-mode  . hl-line-mode)
         ;; Clean tags on refile
         (org-after-refile-insert . my/org-clean-tags))
  :bind (;; Global keybindings
         ("C-c o a" . 'my/org-agenda-with-groups)
		 ("C-c o c" . 'org-capture)
         ;; Mapped keybindings
         :map org-mode-map
         ("C-c C-x C-f" . my/org-emphasis-map))
  :config
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((python . t)
                                 (emacs-lisp . t)
								 ;; (gnuplot . t)
								 ;; (maxima . t)
								 (shell . t)
								 (C . t)))
  ;; Org Visuals
  (setq org-hide-emphasis-markers nil
        org-pretty-entities nil
        org-ellipsis " ⌄")

  ;; Org Feel
  (setq org-src-fontify-natively t
	    org-src-tab-acts-natively t
        org-edit-src-content-indentation 2)

  ;;;; -- Other Org settings
  ;; Scale latex to size based on the hostname
  (pcase my-hostname
    ("laptop" (plist-put org-format-latex-options :scale 1.8))
    ("mac" (progn (setq org-format-latex-options
                        '( :foreground default
                           :background "Transparent"
                           :scale 1.4
                           :html-foreground "Black"
                           :html-background "Transparent"
                           :html-scale 1.0
                           :matchers '("begin" "$1" "$" "$$" "\\(" "\\[")))
                  (setq org-preview-latex-default-process 'dvisvgm)
                  (setq org-latex-to-mathml-convert-command
                        "latexmlmath %i --presentationmathml=%o")))
    (t (plist-put org-format-latex-options :scale 1.0)))

  ;; Org related files.
  (setq org-directory "~/documents/org/"
        org-default-notes-file (concat org-directory "notes.org")
        org-agenda-files (directory-files org-directory t "\\.org$")
        org-agenda-files-and-study (append (directory-files org-directory t "\\.org$")
                                           (directory-files-recursively "~/documents/study" "\\.org$"))
        org-agenda-files-all (directory-files-recursively "~/documents" "\\.org$"))


  ;; Org-agenda settings
  (setq org-agenda-show-future-repeats 'next
        org-agenda-include-diary nil
        org-agenda-span 10
        org-agenda-start-on-weekday nil)

  ;; Only show TODO’s that dont have a set date.
  ;; Once that date has come, show the TODO.
  (setq org-agenda-todo-ignore-deadlines 'future
        org-agenda-todo-ignore-scheduled 'future
        org-agenda-tags-todo-honor-ignore-options t)


  ;; Setting up the agenda views
  (setq org-agenda-custom-commands
        '(("n"       ; Key
           "Agenda"  ; Description
           ((agenda ""
                    ((org-agenda-remove-tags t)))
            (tags-todo "+new"
                       ((org-agenda-overriding-header "Inbox")
                        (org-agenda-prefix-format '((tags . " %i ")))
                        (org-agenda-remove-tags t)))
            (todo "NEXT"
                  ((org-agenda-overriding-header "\nNext Actions")
                   (org-agenda-block-separator nil)
                   (org-agenda-remove-tags t)
                   (org-agenda-skip-function
                    ;; Skip the heading if it has any of the tags
                    '(my/org-agenda-skip-tags '("new" "habit")))))
            (todo "TODO"
                  ((org-agenda-overriding-header "\nTODO Tasks")
                   (org-agenda-block-separator nil)
                   (org-agenda-remove-tags t)
                   (org-agenda-skip-function
                    ;; Skip the heading if it has any of the tags
                    '(my/org-agenda-skip-tags '("new" "habit"))))))
           ((org-agenda-files org-agenda-files-and-study)))

          ;; Default - show all org files in ‘~/documents’ recursively.
          ("b"
           "Agenda - All Org Files"
           ((agenda "")
            (alltodo ""))
           ((org-agenda-files org-agenda-files-all)))))


  ;; Refiling options
  (setq org-outline-path-complete-in-steps nil
        org-refile-use-outline-path 'file
        org-refile-targets '((nil :maxlevel . 2)
                             (org-agenda-files :maxlevel . 2)
                             (org-agenda-files-all :maxlevel . 1)))

  ;; Capture time entered and exited ‘NEXT’ as well as any notes for when
  ;; changing the state to ‘DONE’
  (setq org-todo-keywords '("TODO(t)" "NEXT(n!/!)" "|" "DONE(d@)" "CANCELLED(c@)")
		org-capture-templates `(("i"               ; keys
                                 "Inbox"           ; description
                                 entry             ; type
                                 (file+headline "inbox.org" "todo")  ; target
								 ,(s-join "\n"     ; template
                                          '("** TODO %?" ;; %(org-set-tags \"new\")"
	                                        ":PROPERTIES:"
											":ENTERED: %U"
											":FILE: [[%f]]"
                                            ":LINK: %a"
											":END:"))
                                 :empty-lines 1) ; properties

								("n"
                                 "Notes"
                                 entry
                                 (file+headline "inbox.org" "notes")
								 ,(s-join "\n" '("** %? %^G"
												 ":PROPERTIES:"
												 ":ENTERED: %U"
												 ":FILE: [[%f]]"
                                                 ":LINK: %a"
												 ":END:"))
                                 :empty-lines 1)
                                ("c"
                                 "Calendar"
                                 entry
                                 (file+headline "inbox.org" "todo")
                                        ;,(concat "* %?\n"
                                        ;         "SCHEDULED: <%<%Y-%m-%d %a %^{Scheduled Time: }>>")
                                 ,(s-join "\n"
                                          '("* TODO %?"
                                            "SCHEDULED: <%(org-read-date t)>"
                                            ":PROPERTIES:"
											":ENTERED: %U"
											":FILE: [[%f]]"
                                            ":LINK: %a"
											":END:"))
                                 :time-prompt t)
                                ("w"
                                 "Web site"
                                 entry
                                 (file+headline "inbox.org" "notes")
                                 ,(s-join "\n"
                                          '("* LINK %?"
                                            ":PROPERTIES:"
											":ENTERED: %U"
                                            ":LINK: %a"
											":TITLE: %:initial"
											":END:"))


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
  ;; (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)

  ;; show just the subtree I’m interested in, lowers visual clutter.
  (advice-add 'org-agenda-goto :after
              (lambda (&rest args)
                (org-narrow-to-subtree))))

;;; org.el ends here
