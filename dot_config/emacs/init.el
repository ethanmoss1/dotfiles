;;; init.el --- My Personalised Emacs Configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: init

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;;; Commentary:
;; My Personalised Emacs Configuration

;; Core initalisation for my modularised Emacs. Influenced by Jimeh's .Emacs.d
;; (EmacsSiren) which was inspired by Emacs Prelude. UI and overall design by
;; Nanoemacs with some tweaks.  Some other ideas from Jerrypnz and his Hydra
;; focused emacs.

;; Taking these inital starting points I developed a modulariased approach that
;; takes each package and puts them into modules, these modules arent just
;; external packages but configuration of built in packages as well as custom
;; modules that contain my own code for a specific function.

;;;; References:
;; Emacs Siren .............................. https://github.com/jimeh/.emacs.d
;; Emacs Prelude ........................... https://github.com/bbatsov/prelude
;; Emacs Nano ........................... https://github.com/rougier/nano-emacs
;; Jerrypnz hydra ........................ https://github.com/jerrypnz/.emacs.d

;;;; Code:
(defgroup config nil
  "test group"
  :group 'emacs)

(defvar my-devices
  '("laptop"
    "server"
    "tablet")
  "List of devices that I run Emacs on. This effects whether certain packages,
settings, variables, ect. are set or loaded")

;; Set up module loading and creation
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
purpose and its configuration. If called interactively, select
MODULE to load from the list of available modules."
  (interactive)
  (condition-case err
	  (if (called-interactively-p 'interactive)
		  (module--to-load (module--get-option))
		(if (not (eq module nil))
			(module--to-load module)))
  (error (display-warning 'config
						  (format-message "Loading %s: %s"
										  (or (concat "module " module)
											  "interactive module")
										  (error-message-string err))
							:warning))))

(defun module-new ()
  "Create a new module file in the modules directory that allows
loading of the module, C-u allows loading of the module straight
after creating the file (not implemented yet)"
  (interactive)
  (let ((pkg-name (read-string "Package Name: "))
		(year (format-time-string "%Y"))
		(keywords (read-string "Keywords describing package: "))
		(short-desc (read-string "Short description of package: "))
		(long-desc (read-string "Long description of package: ")))
    (with-temp-file (concat module-dir pkg-name ".el")
      (insert (concat ;; -- START - New module contents --
			   ";;; " pkg-name ".el --- " short-desc "  -*- lexical-binding: t;"
               "-*-\n\n;; Copyright (C) " year "  Ethan Moss\n\n"
               ";; Author: Ethan Moss <cywinskimoss@gmail.com>\n"
			   ";; Keywords: " keywords "\n\n"
			   ";; This program is free software; you can redistribute it and/or modify\n"
			   ";; it under the terms of the GNU General Public License as published by\n"
			   ";; the Free Software Foundation, either version 3 of the License, or\n"
			   ";; (at your option) any later version.\n\n"
			   ";; This program is distributed in the hope that it will be useful,\n"
			   ";; but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
			   ";; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n"
			   ";; GNU General Public License for more details.\n\n"
			   ";; You should have received a copy of the GNU General Public License\n"
			   ";; along with this program.  If not, see <https://www.gnu.org/licenses/>.\n\n"
			   ";;; Commentary:\n;; " short-desc "\n\n"
			   ";; " long-desc "\n\n"
			   ";;; Code:\n\n"
			   "(use-package " pkg-name ")\n\n"
			   ";;; " pkg-name ".el ends here\n")))
    ;; -- END - New module contents --
    (find-file (concat module-dir pkg-name ".el"))))

;; Set up devices specific configuration
(let ((hostname-file (concat user-emacs-directory "hostname")))
  (if (not (file-exists-p hostname-file))
      (with-temp-file hostname-file
        (insert (completing-read "Select Device: " my-devices))))
  (setq my-hostname (with-temp-buffer
                      (insert-file-contents hostname-file)
                      (buffer-string))))

(load-file (concat user-emacs-directory "modules-list.el"))

;; Customise file - for semi-temporary customisations
(setq custom-file (concat user-emacs-directory "custom-file.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; init.el ends here
