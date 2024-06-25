;;; moss-orgroam.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, orgroam  ... ")

(use-package org-roam
  :bind (("C-c r l" . org-roam-buffer-toggle)
         ("C-c r f" . org-roam-node-find)
         ("C-c r g" . org-roam-graph)
         ("C-c r i" . org-roam-node-insert)
         ("C-c r c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))

  :custom
  (org-roam-directory (file-truename "~/Nextcloud/Org/roam"))

  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))
        org-roam-completion-everywhere t)

  (org-roam-db-autosync-mode)

  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(provide 'moss-orgroam)
;;; moss-orgroam.el ends here -----------------------------------------------------
