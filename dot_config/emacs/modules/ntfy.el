;;; ntfy.el --- Notification service in emacs        -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Ethan Moss

;; Author: Ethan Moss <ethan@Ethans-MacBook-Pro.local>
;; Keywords: lisp

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

;;; Code:

(use-package ntfy
  ;; :ensure ( :host github
  ;;           :repo "shombando/ntfy"
  ;;           :files (:defaults "*.el"))
  :ensure ( :repo "/Users/Ethan/Documents/src/ntfy/"
            :files (defaults "*.el"))
  :config
  (setq ntfy-server "http://ntfy.hmsrv.uk"
		ntfy-topic "emacs"
		ntfy-header "Notification from emacs"
		ntfy-tags "purple_circle,loudspeaker"))

;;; ntfy.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
