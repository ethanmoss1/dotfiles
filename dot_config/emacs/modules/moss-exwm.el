;;; moss-exwm.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, exwm  ... ")

(use-package exwm
  :config
  (require 'exwm-config)
  (exwm-config-example)
  (exwm-enable)
  )

(provide 'moss-exwm)
;;; moss-exwm.el ends here -----------------------------------------------------
