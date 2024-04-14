;;; moss-zenburn.el --- A low contrast theme
;;; Commentary:
;;
;;; Code:
(message "[ Moss ] Loading Module, Theme-Zenburn ... ")

(use-package zenburn-theme
  :custom-face
  (internal-border ((t (:background nil))))
  :config
  (load-theme 'zenburn t))

(provide 'moss-zenburn)
;;; moss-zenburn.el ends here
