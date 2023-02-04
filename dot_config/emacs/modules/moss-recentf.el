;;; recentf --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, recentf  ... ")

(use-package recentf
  :straight (:type built-in)
  :demand t

  :custom
  (recentf-save-file (moss-cache-dir "recentf"))
  (recentf-max-saved-items 10000)
  (recentf-max-menu-items 1000)
  (recentf-auto-cleanup 'never)
  (recentf-exclude '("\\.git.*"))

  ;; :preface
  ;; (defun siren-recentf-exclude-p (file)
  ;;   "A predicate to decide whether to exclude FILE from recentf."
  ;;   (let ((file-dir (file-truename (file-name-directory file))))
  ;;     (-any-p (lambda (dir)
  ;;               (string-prefix-p dir file-dir))
  ;;             (mapcar 'file-truename (list siren-cache-dir package-user-dir)))))

  :config
  ;; (add-to-list 'recentf-exclude 'siren-recentf-exclude-p)
  (recentf-mode +1))

(provide 'moss-recentf)
;;; moss-recentf.el ends here
