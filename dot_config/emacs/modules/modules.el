(message "[ Moss ] Loading Modules ... ")

;; Setting up module load path
(defvar moss-modules-dir (expand-file-name "modules" user-emacs-directory)
  "Main modules directory where package configurations are.")
(moss-recursive-add-to-load-path moss-modules-dir)

;; Compulsory packages ---------------------------------------------------------
(require 'moss-vertico)
(require 'moss-orderless)
(require 'moss-marginalia)
(require 'moss-chezmoi)

(require 'moss-exwm)

;; Built in modules ------------------------------------------------------------
(require 'moss-dired)
(require 'moss-recentf)
(require 'moss-savehist)
(require 'moss-display-fill-column)
(require 'moss-ispell)
(require 'moss-tab-bar)
(require 'moss-programming)

;; External Packages -----------------------------------------------------------

;; TODO: This was a failure, need to organise again

;; (require 'moss-gruvbox)
;; (require 'moss-zenburn)
(require 'moss-modus-themes)
(require 'moss-alltheicons)
(require 'moss-personal-themeing)
(require 'moss-helpful)
(require 'moss-org)
(require 'moss-consult)
(require 'moss-rainbow)
(require 'moss-magit)
(require 'moss-pdf-tools)
(require 'moss-maxima)
(require 'moss-gnuplot)
;; (require 'moss-mu4e)
(require 'moss-notmuch)
(require 'moss-doom-modeline)
(require 'moss-eat)
(require 'moss-docker)
(require 'moss-org-fragtog)
(require 'moss-conf-mode)
(require 'moss-corfu)
(require 'moss-bluetooth)
(require 'moss-study)
(require 'moss-hl-todo)

;; Modify packages for use on android
(require 'moss-android)

(provide 'moss-modules)