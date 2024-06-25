;; Ui

;; [[file:../emacsconfig.org::*Ui][Ui:1]]
(message "[ Moss ] Loading module, Consult  ... ")

(global-unset-key (kbd "C-x C-b"))
(use-package consult
  :bind
  ("C-t" . 'consult-imenu)
  ("C-x b" . 'consult-buffer)
  ("C-c b" . 'consult-project-buffer)
  ("C-x C-b" . 'consult-bookmark)
  ("C-s" . 'consult-line)
  ("M-g M-g" . 'consult-goto-line))

(provide 'moss-consult)
;; Ui:1 ends here
