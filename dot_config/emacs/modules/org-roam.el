;;; orgroam.el --- Networked Notes                   -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <ethan@nixos>
;; Keywords: lisp, bib, tools

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
(defun org-roam-node-grep ()
  "Find in files in org roam directory"
  (interactive)
  (consult-grep org-roam-directory))

(use-package org-roam
  :after (org)
  :defer t
  :bind (("C-c r l" . org-roam-buffer-toggle)
         ("C-c r f" . org-roam-node-find)
         ("C-c r g" . org-roam-ui-open)
         ("C-c r i" . org-roam-node-insert)
         ("C-c r c" . org-roam-capture)
         ("C-c r s" . org-roam-node-grep)
         ("C-c r j" . org-roam-dailies-capture-today)
         ("C-c r t" . org-roam-tag-add))

  :config
  (setopt org-roam-verbose 'nil)
  (setopt org-roam-directory (expand-file-name "roam/" org-directory))
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setopt org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))
          org-roam-completion-everywhere t)

  ;; Backlinks mode sections
  (setopt org-roam-mode-sections
          (list #'org-roam-backlinks-section
                #'org-roam-reflinks-section
                #'org-roam-unlinked-references-section))

  ;; If using org-roam-protocol
  ;; (require 'org-roam-protocol)
  (org-roam-db-autosync-mode 1))

;;; orgroam.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
