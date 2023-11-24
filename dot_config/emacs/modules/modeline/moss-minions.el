;; Minions - hide minor modes

;; [[file:../emacsconfig.org::*Minions - hide minor modes][Minions - hide minor modes:1]]
(message "[ Moss ] Loading module, Minions  ... ")

(use-package minions
  :init
  (setq minions-mode-line-lighter "≡ ")
  :config
  (minions-mode 1))

(provide 'moss-minions)
;; Minions - hide minor modes:1 ends here
