;; Orderless
;; Completion framework

;; [[file:../emacsconfig.org::*Orderless][Orderless:1]]
(message "[ Moss ] Loading Module, Orderless  ... ")

(use-package orderless
  :disabled
  ;; :config
  ;; (with-eval-after-load 'company-mode
  ;;   (defun just-one-face (fn &rest args)
  ;;     (let ((orderless-match-faces [completions-common-part]))
  ;;       (apply fn args)))
  ;;
  ;;   (advice-add 'company-capf--candidates :around #'just-one-face))

  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(provide 'moss-orderless)
;; Orderless:1 ends here
