;;; moss-keybindings.el -- Summary

;;; Commentary:

;;; Code:

;; (defconst my-leader "C-c")

(general-define-key
 :keymaps 'global
 "C-x k" 'kill-this-buffer              ; Kill buffer without asking which one
 )

(provide 'moss-keybindings)
;;; moss-keybindings.el ends here
