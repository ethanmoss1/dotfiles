;;; moss-exwm.el --- Summary  -*- lexical-binding: t; -*-

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, exwm  ... ")

(use-package xelb
  :elpaca
  (:host github :repo "emacs-exwm/xelb"))

(use-package exwm
  ;; currently exwm is changing repo, recipes havent been updated correctly
  :after xelb
  :elpaca
  (:host github :repo "emacs-exwm/exwm")

  :hook
  (exwm-update-class . (lambda ()
                         (exwm-workspace-rename-buffer exwm-class-name)))

  :custom
  (exwm-workspace-number 10)
  (exwm-input-global-keys
   `(([s-left] . windmove-left)
     ([s-right] . windmove-right)
     ([s-up] . windmove-up)
     ([s-down] . windmove-down)

     ;; 's-r': Reset (to line-mode).
     ;; ([s-r] . exwm-reset)

     ;; ([?\s-w] . exwm-workspace-switch)
     ([s-tab] . (lambda (command)
                    (interactive (list (read-shell-command "$ ")))
                    (start-process-shell-command command nil command)))
     ,@(mapcar (lambda (i)
                 `(,(kbd (format "s-%d" i)) .
                   (lambda ()
                     (interactive)
                     (exwm-workspace-switch-create ,i))))
               (number-sequence 0 9))))


;;  :config
;;  (defvar exwm--application-location "/usr/share/applications/")
;;  (defun exwm-launch-application ()
;;    "Launch an application using completion"
;;    (interactive)
;;    (message (directory-files exwm--application-location))
;;    )



  )
;; If we are using EWXM, enable the interesting stuff
;; (if moss/exwm-enabled
    ;; (progn
      ;; (use-package exwm-modeline)
      ;; (require 'exwm-systemtray)))

(provide 'moss-exwm)
;;; moss-exwm.el ends here -----------------------------------------------------
