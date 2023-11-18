(message "[ Moss ] Loading Modules ... ")

;; Setting up module load path
(defvar moss-modules-dir (expand-file-name "modules" user-emacs-directory)
  "Main modules directory where package configurations are.")

(moss-recursive-add-to-load-path moss-modules-dir)

(provide 'moss-modules)
