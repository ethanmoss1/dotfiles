;;; files.el ---   -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords:

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
;;

;;

;;; Code:
(use-package files
  :ensure nil
  :config
  (setq require-final-newline        t
        large-file-warning-threshold nil
        make-backup-files            nil
        backup-by-copying            t
        delete-old-versions          t
        kept-new-versions            10
        kept-old-versions            0)
  (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'before-save-hook
            (lambda ()
              (when buffer-file-name
                (let ((dir (file-name-directory buffer-file-name)))
                  (when (and (not (file-exists-p dir))
                             (y-or-n-p
                              (format "Directory %s doesn't exist.  Create it?" dir)))
                    (make-directory dir t)))))))

;;; files.el ends here
