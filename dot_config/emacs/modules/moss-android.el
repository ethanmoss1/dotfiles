;;; moss-android.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, android  ... ")

(server-start)
(push (concat "TEXMFLOCAL=" termux-dir "files/usr/share/texlive/texmf-local") process-environment)
(push (concat "TEXMFROOT=" termux-dir "files/usr/share/texlive/2024") process-environment)

;; Need US international keyboard so change needed
(global-set-key (kbd "ˆ") (kbd "^"))  ; For latex maths

(provide 'moss-android)
;;; moss-android.el ends here -----------------------------------------------------
