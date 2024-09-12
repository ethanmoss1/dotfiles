;;; pdf-tools.el --- Summary

;;; Commentary:

;;; Code:
(use-package pdf-tools
  :if (string-equal my-hostname "laptop")
  :config
  (pdf-tools-install)
  (setq pdf-view-display-size 'fit-page))

;;; pdf-tools.el ends here
