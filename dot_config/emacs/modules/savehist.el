;;; savehist --- Summary

;;; Commentary:

;;; Code:

(use-package savehist
  :demand t
  :ensure nil
  :init (savehist-mode +1)
  :custom
  (savehist-autosave-interval 60)
  (savehist-file (concat user-emacs-directory "savehist")))

(provide 'savehist)
;;; savehist.el ends here
