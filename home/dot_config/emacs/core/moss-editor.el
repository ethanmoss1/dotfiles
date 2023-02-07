;;; moss-editor --- Main configurations to the base Emacs

;;; Commentary:
;; The main conrigurations of the Base Emacs.

;;; Code:
(message "[ Moss ] Loading Core Editor Configurations  ... ")

;; MAJOR: CUA MODE
;; (cua-mode t)

;; Newline at end of file
(setq require-final-newline t)
(setq-default indent-tabs-mode nil)  ; always replace tabs with spaces
(setq-default tab-width 4)  ; Visual tab amount
(setq tab-stop-list (number-sequence 4 120 4))  ; generates tabs distances at 4 spaces increments

;; Electric pairing - close brackets, quotes ect.
(electric-quote-mode t)
(electric-pair-mode t)

;; Dont truncate lines unless I want to
(setq-default truncate-lines t)

;; Setup Cache for different modules
(setq save-place-file (moss-cache-dir "saveplace"))
(save-place-mode 1)

(let ((auto-save-dir (moss-cache-dir "autosave/")))
  (unless (file-exists-p auto-save-dir)
    (make-directory auto-save-dir))
  (setq auto-save-interval 20
        auto-save-file-name-transforms
        `((".*" ,auto-save-dir t))))

(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 10
      kept-old-versions 0
      vc-make-backup-files t
      version-control t
      backup-directory-alist `((".*" . ,(moss-cache-dir "backup"))))

(setq eshell-directory-name (moss-cache-dir "eshell"))
(setq transient-history-file (moss-cache-dir "transient/history.el"))
(setq transient-levels-file (moss-cache-dir "transient/levels.el"))
(setq transient-values-file (moss-cache-dir "transient/values.el"))

(setq make-backup-files nil)
(setq large-file-warning-threshold nil)

;; Font-Core
(global-font-lock-mode t)
;; autorevert
(global-auto-revert-mode 1)  ; updates buffer if file is updated
;; Aliasing
(fset 'yes-or-no-p 'y-or-n-p)  ; set all Yes/No to the easier Y/N
;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'after-save-hook
            'executable-make-buffer-file-executable-if-script-p)
(add-hook 'before-save-hook
            (lambda ()
              (when buffer-file-name
                (let ((dir (file-name-directory buffer-file-name)))
                  (when (and (not (file-exists-p dir))
                             (y-or-n-p
                              (format "Directory %s doesn't exist.  Create it?" dir)))
                    (make-directory dir t))))))

(visual-line-mode nil)
(show-paren-mode 1)
(delete-selection-mode 1)
(line-number-mode -1)

(setq-default fill-column 80)

;; Moderate font lock
(setq font-lock-maximum-decoration t) ; T for max, nil for minimum.
(setq font-lock-maximum-size 256000)

;; Size of temporary buffers
(temp-buffer-resize-mode)
(setq temp-buffer-max-height 8)

;; Minimum window height
(setq window-min-height 1)

;; Buffer encoding
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment   'utf-8)

;; Unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse
      uniquify-separator " • "
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

;; Default shell in term
;; (unless
;;     (or (eq system-type 'windows-nt)
;;         (not (file-exists-p "/bin/zsh")))
;;   (setq-default shell-file-name "/bin/zsh")
;;   (setq explicit-shell-file-name "/bin/zsh"))

;; Kill term buffer when exiting
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  "Advice to kill buffer when you exit terminal."
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(provide 'moss-editor)
;;; moss-editor.el ends here
