;;; savehist --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, savehist  ... ")

(use-package savehist
  :demand t
  :straight (:type built-in)
  :custom
  (savehist-autosave-interval 60)
  (savehist-file (moss-cache-dir "savehist"))
  :init (savehist-mode +1))

(provide 'moss-savehist)
;;; moss-savehist.el ends here
