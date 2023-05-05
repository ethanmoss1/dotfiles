(message "[ Moss ] Loading Modules ... ")

;; Setting up module load path
(defvar moss-modules-dir (expand-file-name "modules" user-emacs-directory)
  "Main modules directory where package configurations are.")
(add-to-list 'load-path moss-modules-dir)

;; Compulsory packages ---------------------------------------------------------

(require 'moss-vertico)
(require 'moss-orderless)
(require 'moss-marginalia)
;; (require 'moss-evil)

;; Built in modules ------------------------------------------------------------
(require 'moss-dired)
(require 'moss-recentf)
(require 'moss-savehist)
(require 'moss-display-fill-column)

;; Window manager --------------------------------------------------------------
;; To use emacs as your window manager please make sure you have a .desktop file
;; set up to allow you to boot into EXWM
;; (require 'moss-exwm)

;; External Packages -----------------------------------------------------------

;; Main Theme
;; (require 'moss-base16)
(require 'moss-gruvbox)
;; (require 'moss-modus-themes)

;; Additional Theming
;; (require 'moss-nano)                    ; makes emacs more elegant
(require 'moss-alltheicons)             ; Icons for modules
;; (require 'moss-solaire)
(require 'moss-personal-themeing)

;; Documentation
;; (require 'moss-hydra)
(require 'moss-helpful)

;; Org and or packages
(require 'moss-org)
;; (require 'moss-orgroam)
(require 'moss-org-noter)

;; Auto completion
(require 'moss-consult)
;; (require 'moss-mini-frame)

;; Terminal Emulation
(require 'moss-vterm)

;; Editing
;; (require 'moss-godmode)
(require 'moss-svg-tag-mode) ;; :TEST:
(require 'moss-rainbow)
;; (require 'moss-buffer-move)
;; (require 'moss-shell-pop)

;; Version Control
(require 'moss-magit)
(require 'moss-chezmoi)

;; Project
;; (require 'moss-projectile)

;; LSP
(require 'moss-eglot)
(require 'moss-company)
(require 'moss-tree-sitter)

;; Filetype specific
;; (require 'moss-pdf-tools)

;; Languages

;; Email client
;; (require 'moss-mu4e)
;; (require 'moss-mu4e-dashboard)
;; (require 'moss-gnus)

;; Modeline
(require 'moss-doom-modeline)
(require 'moss-minions)

(provide 'moss-modules)
