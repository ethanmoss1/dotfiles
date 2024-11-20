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

;; (use-package consult-org-roam)
(defun org-roam-node-grep ()
  "Find in files in org roam directory"
  (interactive)
  (consult-grep org-roam-directory))

(use-package org-roam
  :bind (("C-c r l" . org-roam-buffer-toggle)
         ("C-c r f" . org-roam-node-find)
         ("C-c r g" . org-roam-ui-open)
         ("C-c r i" . org-roam-node-insert)
         ("C-c r c" . org-roam-capture)
         ("C-c r s" . org-roam-node-grep)
         ("C-c r j" . org-roam-dailies-capture-today))

  :config
  (setq org-roam-directory (expand-file-name "roam/" org-directory))
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))
        org-roam-completion-everywhere t)

    ;; If using org-roam-protocol
  ;; (require 'org-roam-protocol)
  (org-roam-db-autosync-mode 1))

;;; Additional Org-roam package;
(use-package org-roam-ui
  :config
  ;; To sync the theme your using, run ‘orui-sync-theme’
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start nil))

(use-package org-roam-timestamps
  :config
  ;; Run ‘org-roam-timestamps-all’, This will add ctime and mtime properties to
  ;; all the property drawers of your notes.

  ;; This will also update the parent file when you update a subnote.
  (setq org-roam-timestamps-parent-file t)

  ;; This will remember previous mtimes and add the new timestamp to the front
  ;; of the list rather than replace the old one. This will allow us to create
  ;; git-like time-tracker-views in org-roam-ui, showing you when you modified
  ;; which files. It will however clog up your properties drawer a lot more and
  ;; of course increase file size. If you previously had this turned on but want
  ;; to remove it for all files, run org-roam-timestamps-clean-mtimes.
  (setq org-roam-timestamps-remember-timestamps t)

  ;; Minimum time in seconds between two timestamps. Defaults to an hour. Only
  ;; does something if org-roam-timestamps-remember-timestamps is t
  (setq org-roam-timestamps-minimum-gap 3600)

  ;; Start the minor mode.
  (org-roam-timestamps-mode))

;;; orgroam.el ends here
