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
        company-tooltip-flip-when-above t)

  (with-eval-after-load 'orderless
    ;; We follow a suggestion by company maintainer u/hvis:
    ;; https://www.reddit.com/r/emacs/comments/nichkl/comment/gz1jr3s/
    (defun company-completion-styles (capf-fn &rest args)
      (let ((completion-styles '(basic partial-completion)))
        (apply capf-fn args)))

    (advice-add 'company-capf :around #'company-completion-styles))
  (with-)
  :hook
  (python-mode . company-mode))


(provide 'moss-company)
;;; moss-company.el ends here
