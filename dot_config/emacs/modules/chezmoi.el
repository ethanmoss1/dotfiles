(use-package chezmoi
  :bind
  ("C-c d f" . 'chezmoi-find)
  ("C-c d s" . 'chezmoi-magit-status)
  ("C-c d e" . 'chezmoi-goto-emacs-folder)
  ("C-c d c" . 'chezmoi-goto-chezmoi-folder)
  :config
  (defun chezmoi-dired-add-marked-files ()
    "Add files marked in Dired to source state."
    (interactive)
    (dolist (file (dired-get-marked-files))
      (shell-command (concat chezmoi-command " add " (shell-quote-argument file)))))

  (defun chezmoi-magit-status ()
    "Show the status of the chezmoi source repository."
    (interactive)
    (magit-status-setup-buffer (cl-first (chezmoi--dispatch "source-path"))))

  (defun chezmoi-goto-emacs-folder ()
	"Go to the emacs user directory"
	(interactive)
	(dired user-emacs-directory))

  (defun chezmoi-goto-chezmoi-folder ()
	"Go to the chezmoi directory"
    (interactive)
	(dired "~/.local/share/chezmoi")))
