;;; ibuffer.el --- Buffer management  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: buffer emacs

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

;;; Commentary:
;; Buffer management

;; Manage buffers using filters and marking systems like dired

;;; Code:

(use-package ibuffer
  :ensure nil
  :hook (ibuffer . (lambda ()
                     ;; Apply filter and collapse ‘Org’ heading.
                     (ibuffer-switch-to-saved-filter-groups "Groups")
                     (setq ibuffer-hidden-filter-groups '("Org"))
                     (ibuffer-update nil)))
  :config
  ;; Configure the way the ibuffer looks
  (setq ibuffer-eliding-string "…"
        ibuffer-formats '(( mark
                            modified
                            " "
                            (name 16 -1 :left :elide)
                            " "
                            (filename 40 -1 :right))))

  ;; Set up filters
  (setq ibuffer-show-empty-filter-groups nil
		ibuffer-saved-filter-groups '(("Groups"
									   ("Files"
										(and
										 (visiting-file)
										 (not derived-mode . org-mode)))
                                       ("Shell"
                                        (or
                                         (derived-mode . eshell-mode)
                                         (derived-mode . shell-mode)
                                         (derived-mode . eat-mode)))
                                       ("EXWM"
                                        (and
                                         (derived-mode . exwm-mode)
                                         (not (name . "firefox"))))
									   ("Firefox"
										(and
										 (derived-mode . exwm-mode)
										 (name . "firefox")))
									   ("Magit"
										(name . "^magit"))
									   ("Help"
										(or
										 (derived-mode . help-mode)
										 (derived-mode . helpful-mode)))
									   ("Dired"
										(derived-mode . dired-mode))
									   ("Org"
										(derived-mode . org-mode))
									   ("Temporary"
										(name . "*.**"))))))

;;; ibuffer.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
