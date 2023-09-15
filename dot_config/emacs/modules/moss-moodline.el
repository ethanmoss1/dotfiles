;;; moss-moodline.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, moodline  ... ")

(use-package mood-line
  ;; :bind
  ;; (
  ;; ("C-c a" . org-agenda) ;; example
  ;; )
  :custom
  (mood-line-show-cursor-point t)
  (mood-line-show-encoding-information t)
  (mood-line-show-eol-style t)
  (mood-line-show-indentation-style t)
  (mood-line-show-major-mode t)

  :config
  (mood-line-mode)
  ;; :?
  )

(provide 'moss-moodline)
;;; moss-moodline.el ends here -----------------------------------------------------
