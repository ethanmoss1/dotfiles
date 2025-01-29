;;; org-contacts.el --- Manage contactc in Org-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Ethan Moss

;; Author: Ethan Moss <ethan@Ethans-MacBook-Pro.local>
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

;;; Code:

(defun my/get-capture-filename ()
  "Get the Contacts name and create a file with that name"
  (let* ((name (read-string "Full Name: "))
         (capitalized-name (mapcar #'capitalize (split-string name)))
         (hyphenated-string (mapconcat 'identity capitalized-name "_"))
         (time-string (format-time-string "%Y%m%d%H%M%S-"))
         (file-name (concat time-string hyphenated-string ".org")))
    (expand-file-name file-name org-contacts-directory)))

(use-package org-contacts
  :after org
  :config
  (setq org-contacts-directory (concat org-directory "contacts/"))
  (setq org-contacts-files (directory-files org-contacts-directory t "\\.org$")))

  ;; (setq org-roam-capture-templates
  ;;       '(("d" "default" plain "%?" :target
  ;;          (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
  ;;                     "#+title: ${title}\n")
  ;;          :unnarrowed t)
  ;;
  ;;         ("c" "contact" plain "%?" :target
  ;;          (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
  ;;                     "* ${title}\n:PROPERTIES:\n:NUMBER: %^{Phone number: }\n:EMAIL: %^{Email: }\n:NOTE: %^{NOTE}\n:END:")
  ;;          :unnarrowed t))))

;;; org-contacts.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
