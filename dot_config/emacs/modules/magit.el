;;; magit.el ---   -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
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

;;; Code :
(use-package transient)

(use-package magit
  :after transient
  :bind ("C-c m m" . 'magit)
  :config
  ;; VC Generic settings
  (setq vc-make-backup-files nil
        version-control t)

  ;; follow the default
  (setq magit-delete-by-moving-to-trash delete-by-moving-to-trash)

  ;; Magit Settings;
  ;; Diff settings
  (setq magit-diff-refine-hunk 'all)

  ;; buffer alist
  ;; (add-to-list 'display-buffer-alist
  ;;              '("^COMMIT"
  ;;                (display-buffer-in-side-window)
  ;;                (side . bottom)
  ;;                (slot . 0)
  ;;                (window-height . 0.33)
  ;;                (window-parameters
  ;;                 (no-delete-other-windows . t))))
  (setopt magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;; magit.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
