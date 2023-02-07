;;; moss-core.el --- Personalised Emacs Configuration built with design in mind.
;;
;;; Commentary : ---------------------------------------------------------------
;; Core initalisation for Moss-Emacs.
;; Massively influenced by Jimeh's .Emacs.d (Emacs Siren)  which was inspired by
;; Emacs Prelude. UI and overall design by Nano emacs with some tweaks.
;; Some other ideas from Jerrypnz and his Hydra focused emacs.
;;
;;; References : ---------------------------------------------------------------
;; Emacs Siren .............................. https://github.com/jimeh/.emacs.d
;; Emacs Prelude ........................... https://github.com/bbatsov/prelude
;; Emacs Nano ........................... https://github.com/rougier/nano-emacs
;; Jerrypnz hydra ........................ https://github.com/jerrypnz/.emacs.d
;;
;;; Code: ----------------------------------------------------------------------
(message "[ Moss ] Loading Core ... ")

(defun display-startup-echo-area-message ()
  "Display startup echo area message."
  (message "Emacs initialized in %s" (emacs-init-time)))

;; Set up core group
(defgroup moss nil
  "Emacs. My way."
  :group 'Emacs)

;; Set up load directorys
(defvar moss-core-dir (file-name-directory load-file-name)
  "Core directory for configuration.")

(defvar moss-dir (expand-file-name ".." moss-core-dir)
  "Root directory of configuration files.")

(defvar moss-cache-dir (expand-file-name "cache" user-emacs-directory)
 "Main cache directory which packages should be configured to use.")

;; ;; Set up load directorys
;; (defcustom moss-core-dir nil
;;   "Core directory for configuration."
;;   :set (file-name-directory load-file-name)
;;   :type 'string
;;   :group 'moss)

;; (defcustom moss-dir nil
;;   "Root directory of configuration files."
;;   :type 'string
;;   :set (expand-file-name ".." moss-core-dir)
;;   :group 'moss)

;; (defcustom moss-cache-dir nil
;;   "Main cache directory which packages should be configured to use."
;;   :type 'string
;;   :set (expand-file-name "cache" user-emacs-directory)
;;   :group 'moss)

(unless (file-exists-p moss-cache-dir)
  (make-directory moss-cache-dir t))

(defun moss-recursive-add-to-load-path (dir)
  "Add DIR and all its sub-directories to `load-path'."
  (add-to-list 'load-path dir)
  (dolist (f (directory-files dir))
    (let ((name (expand-file-name f dir)))
      (when (and (file-directory-p name)
                 (not (string-prefix-p "." f)))
        (moss-recursive-add-to-load-path name)))))

(defun moss-dir (name)
  "Return absolute path to sub-directory NAME under moss-dir."
  (expand-file-name name moss-dir))

(defun moss-cache-dir (name)
  "Return absolute path to sub-directory NAME under moss-cache-dir."
  (expand-file-name name moss-cache-dir))

;; Setup load-path
(add-to-list 'load-path moss-core-dir)

(require 'moss-package-manager)
(require 'moss-keybindings)
(require 'moss-performance)
(require 'moss-ui)
(require 'moss-editor)

;; Load all selected modules
(require 'moss-modules)

(setq custom-file (moss-cache-dir "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(message "[ Moss ] Moss Configuration loaded successfully!")

(provide 'moss-core)
;;; moss-core.el ends here
