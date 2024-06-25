;;;; init.el --- Personalised Emacs Configuration
;;
;;;; Commentary : --------------------------------------------------------------
;; Core initalisation for Moss-Emacs. Influenced by Jimeh's .Emacs.d (Emacs
;; Siren) which was inspired by Emacs Prelude. UI and overall design by Nano
;; emacs with some tweaks.  Some other ideas from Jerrypnz and his Hydra focused
;; emacs.
;;
;;;; References : --------------------------------------------------------------
;; Emacs Siren .............................. https://github.com/jimeh/.emacs.d
;; Emacs Prelude ........................... https://github.com/bbatsov/prelude
;; Emacs Nano ........................... https://github.com/rougier/nano-emacs
;; Jerrypnz hydra ........................ https://github.com/jerrypnz/.emacs.d
;;
;;;; Code: ---------------------------------------------------------------------

;; Get the device we are on, for specific settings

(defvar my-devices
  '("laptop"
    "server"
    "tablet")
  "List of devices that I run Emacs on. This effect whether
packages, settings,variables, ect. are set")

(let ((hostname-file (concat user-emacs-directory "hostname")))
  (if (not (file-exists-p hostname-file))
      (with-temp-file hostname-file
        (insert (completing-read "Select Device: " my-devices))))
  (setq my-hostname (with-temp-buffer
                      (insert-file-contents hostname-file)
                      (buffer-string))))

;; Set up module loading
(defvar module-dir
  (concat user-emacs-directory "modules/")
  "Directory where the modules are located")

(defun module--list-modules ()
  "returns the list of modules available to the user"
  (mapcar 'file-name-sans-extension (directory-files module-dir nil "\\.el")))

(defun module--get-option ()
  "Get the module that you want to load"
  (completing-read "Name of module to load: " (module--list-modules)))

(defun module--to-load (module)
  "Load the given MODULE"
  (load (concat module-dir module ".el") nil nil nil nil))

(defun module-load (&optional module)
  "load MODULE that contains a package/elisp for a particular
 purpose and its configuration
If called interactively, select MODULE to load from the list of available modules."
  (interactive)
  (if (called-interactively-p)
      (module--to-load (module--get-option))
    (if (not (eq module nil))
        (module--to-load module))))

;; Load modules
(mapcar 'module-load
        '(;;;;;; ---- List of modules to load ----
          ;; -- Package manager --
          "elpaca"
          ;; "straight"

          ;; Combine to just ’Emacs’
          "keybindings"
          "ui"
          "editor"
          "modules"

          (if (string-equal my-hostname "laptop")
              "exwm")

          ;; -- Compolsory Modules --
          "vertico"
          "orderless"
          "marginalia"
          "chezmoi"

          ;; -- Built-in --
          "dired"
          "recentf"
          "savehist"
          "display-fill-column"
          "ispell"
          "tab-bar"
          "programming"
          "modus-themes"
          "alltheicons"
          "personal-themeing"
          "helpful"
          "org"
          "consult"
          "rainbow"
          "magit"
          "pdf-tools"
          "maxima"
          "gnuplot"
          "notmuch"
          "doom-modeline"
          "eat"
          "docker"
          "org-fragtog"
          "conf-mode"
          "corfu"
          "bluetooth"
          "study"
          "hl-todo"
          "android"
          )) ;; -- End of Modules --

;; Customise file - for semi-temporary customisations
(setq custom-file (concat user-emacs-directory "custom-file.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; elpaca wait?

;; Init file ends here
