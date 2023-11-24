(message "[ Moss ] Loading Modules ... ")

;; Setting up module load path
(defvar moss-modules-dir (expand-file-name "modules" user-emacs-directory)
  "Main modules directory where package configurations are.")
(moss-recursive-add-to-load-path moss-modules-dir)

;; Compulsory packages ---------------------------------------------------------
(require 'moss-vertico)
(require 'moss-orderless)
(require 'moss-marginalia)

;; Built in modules ------------------------------------------------------------
(require 'moss-dired)
(require 'moss-recentf)
(require 'moss-savehist)
(require 'moss-display-fill-column)
(require 'moss-ispell)

;; External Packages -----------------------------------------------------------

(require 'moss-gruvbox)
(require 'moss-alltheicons)
(require 'moss-personal-themeing)
(require 'moss-helpful)
(require 'moss-org)
(require 'moss-consult)
(require 'moss-rainbow)
(require 'moss-magit)
(require 'moss-chezmoi)
(require 'moss-pdf-tools)
(require 'moss-maxima)
(require 'moss-gnuplot)
(require 'moss-mu4e)
(require 'moss-moodline)
(require 'moss-eat)
(require 'moss-docker)
(require 'moss-org-fragtog)

(provide 'moss-modules)
