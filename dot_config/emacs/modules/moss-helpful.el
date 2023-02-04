;; Helpful

;; [[file:../emacsconfig.org::*Helpful][Helpful:1]]
(message "[ Moss ] Loading module, Helpful  ... ")

(use-package helpful
  :general
  ;; ("C-h" 'helpful-hydra/body)
  ("C-h h" 'helpful-at-point)
  ("C-h v" 'helpful-variable)
  ("C-h f" 'helpful-callable)
  ("C-h k" 'helpful-key)
  )



(provide 'moss-helpful)
;; Helpful:1 ends here
