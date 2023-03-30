;;; company --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, company  ... ")

(use-package company
  :general
  ;; Enable indent and complete at point functionality by pressing tab.
  ("TAB" 'company-indent-or-complete-common)
  ;; Scroll through company suggestions with C-n and C-p.
  (:keymaps 'company-active-map
            "C-n" 'company-select-next
            "C-p" 'company-select-previous
            "TAB" 'company-complete-selection)

  :config
  (setq company-begin-commands '(self-insert-command)
        company-dabbrev-downcase nil
        company-echo-delay 0.01
        company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-tooltip-limit 5

        ;; invert the navigation direction if the the completion popup-isearch-match
        ;; is displayed on top (happens near the bottom of windows)
        company-tooltip-flip-when-above nil)

  (with-eval-after-load 'orderless
    ;; We follow a suggestion by company maintainer u/hvis:
    ;; https://www.reddit.com/r/emacs/comments/nichkl/comment/gz1jr3s/
    (defun company-completion-styles (capf-fn &rest args)
      (let ((completion-styles '(basic partial-completion)))
        (apply capf-fn args)))

    (advice-add 'company-capf :around #'company-completion-styles))

  ;; (with-eval-after-load 'chezmoi
  ;;   (defun chezmoi--evil-insert-state-enter ()
  ;;     "Run after evil-insert-state-entry."
  ;;     (chezmoi-template-buffer-display nil (point))
  ;;     (remove-hook 'after-change-functions #'chezmoi-template--after-change 1))

  ;;   (defun chezmoi--evil-insert-state-exit ()
  ;;     "Run after evil-insert-state-exit."
  ;;     (chezmoi-template-buffer-display nil)
  ;;     (chezmoi-template-buffer-display t)
  ;;     (add-hook 'after-change-functions #'chezmoi-template--after-change nil 1))

  ;;   (defun chezmoi-evil ()
  ;;     (if chezmoi-mode
  ;;         (progn
  ;;           (add-hook 'evil-insert-state-entry-hook #'chezmoi--evil-insert-state-enter nil 1)
  ;;           (add-hook 'evil-insert-state-exit-hook #'chezmoi--evil-insert-state-exit nil 1))
  ;;       (progn
  ;;         (remove-hook 'evil-insert-state-entry-hook #'chezmoi--evil-insert-state-enter 1)
  ;;         (remove-hook 'evil-insert-state-exit-hook #'chezmoi--evil-insert-state-exit 1))))
  ;;   (add-hook 'chezmoi-mode-hook #'chezmoi-evil))

  (global-company-mode 1)
  ;; :hook
  ;; (python-mode . company-mode)
  )


(provide 'moss-company)
;;; moss-company.el ends here
