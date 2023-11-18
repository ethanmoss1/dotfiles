;;; savehist --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, savehist  ... ")

(use-package savehist
  ;; :disabled
  :demand t
  :elpaca nil
  :init (savehist-mode +1))
  :custom
  (savehist-autosave-interval 60)
  (savehist-file (moss-cache-dir "savehist"))

(provide 'moss-savehist)
;;; moss-savehist.el ends here
