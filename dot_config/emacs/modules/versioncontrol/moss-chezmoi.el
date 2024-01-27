;;; moss-chezmoi.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, chezmoi  ... ")

(use-package chezmoi
  :config
  (add-hook 'chezmoi-mode-hook #'(lambda ()
            (if chezmoi-mode
                (add-to-list 'company-backends 'chezmoi-company-backend)
              (delete 'chezmoi-company-backend 'company-backends))))

  (defun chezmoi-dired-add-marked-files ()
    "Add files marked in Dired to source state."
    (interactive)
    (dolist (file (dired-get-marked-files))
      (shell-command (concat chezmoi-command " add " (shell-quote-argument file)))))

  (defun chezmoi-magit-status ()
    "Show the status of the chezmoi source repository."
    (interactive)
    (magit-status-setup-buffer (cl-first (chezmoi--dispatch "source-path"))))
  )

(provide 'moss-chezmoi)
;;; moss-chezmoi.el ends here -----------------------------------------------------
