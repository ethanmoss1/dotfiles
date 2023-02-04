;;; display-fill-column --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, display-fill-column  ... ")

(use-package display-fill-column-indicator
  :straight (:type built-in)
  :hook
  (prog-mode . display-fill-column-indicator-mode))

(provide 'moss-display-fill-column)
;;; moss-display-fill-column.el ends here
