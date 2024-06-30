;;; magit --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, magit  ... ")

(use-package transient)

(use-package magit
  :after transient
  (setq vc-make-backup-files t
        version-control t))

(provide 'moss-magit)
;;; moss-magit.el ends here
