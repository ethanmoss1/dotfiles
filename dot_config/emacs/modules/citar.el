;;; citar.el --- Frontend for BibTeX                 -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Ethan Moss

;; Author: Ethan Moss <ethan@Ethans-MacBook-Pro.local>
;; Keywords: lisp, bib

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

;;; Code:
(use-package citar
  :config
  (setq citar-bibliography (concat org-directory "ref/references.bib"))

  ;; Prettify the UI
  (defvar citar-indicator-files-icons
    (citar-indicator-create
     :symbol (nerd-icons-faicon
              "nf-fa-file_o"
              :face 'nerd-icons-green
              :v-adjust -0.1)
     :function #'citar-has-files
     :padding "  " ; need this because the default padding is too low for these icons
     :tag "has:files"))
  (defvar citar-indicator-links-icons
    (citar-indicator-create
     :symbol (nerd-icons-faicon
              "nf-fa-link"
              :face 'nerd-icons-orange
              :v-adjust 0.01)
     :function #'citar-has-links
     :padding "  "
     :tag "has:links"))
  (defvar citar-indicator-notes-icons
    (citar-indicator-create
     :symbol (nerd-icons-codicon
              "nf-cod-note"
              :face 'nerd-icons-blue
              :v-adjust -0.3)
     :function #'citar-has-notes
     :padding "    "
     :tag "has:notes"))
  (defvar citar-indicator-cited-icons
    (citar-indicator-create
     :symbol (nerd-icons-faicon
              "nf-fa-circle_o"
              :face 'nerd-icons-green)
     :function #'citar-is-cited
     :padding "  "
     :tag "is:cited"))

  (setq citar-indicators
        (list citar-indicator-files-icons
              citar-indicator-notes-icons
              citar-indicator-links-icons
              citar-indicator-cited-icons)))

;; Org-roam integration
(use-package citar-org-roam
  :after (citar org-roam)
  :config
  (setq citar-org-roam-subdir "cite-notes")
  (add-to-list 'org-roam-capture-templates '("n" "literature note" plain
                                             "%?"
                                             :target
                                             (file+head
                                              "#+title: ${citar-citekey} (${citar-date}). ${note-title}.\n")
                                             "%(expand-file-name (or citar-org-roam-subdir \"\") org-roam-directory)/${citar-citekey}.org"
                                             :unnarrowed t))
  (setq citar-org-roam-capture-template-key "n")

  ;; Finally run the damn thing!
  (citar-org-roam-mode))

;;; citar.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
