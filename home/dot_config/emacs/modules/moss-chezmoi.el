;;; moss-chezmoi.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, chezmoi  ... ")

(use-package chezmoi
  :config
  (require 'chezmoi-company)
  (add-hook 'chezmoi-mode-hook #'(lambda ()
            (if chezmoi-mode
                (add-to-list 'company-backends 'chezmoi-company-backend)
              (delete 'chezmoi-company-backend 'company-backends))))
  )

(provide 'moss-chezmoi)
;;; moss-chezmoi.el ends here -----------------------------------------------------
