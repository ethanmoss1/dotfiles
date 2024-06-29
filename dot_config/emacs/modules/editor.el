;;; editor.el --- Emacs customisation for editing  -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: startup editing

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
;; Emacs customisation for editing

;; Specific customisations of the Emacs editor that are more sane (maybe?)

;;; Code:
(indent-tabs-mode nil)             ; always replace tabs with spaces
(electric-quote-mode t)
(electric-pair-mode t)
(global-font-lock-mode t)
(save-place-mode 1)
(global-auto-revert-mode 1)        ; updates buffer if file is updated
(fset 'yes-or-no-p 'y-or-n-p)      ; set all Yes/No to the easier Y/N

(setq-default tab-width 4          ; Visual tab amount
              truncate-lines t
              fill-column 80
			  indent-tabs-mode nil)

(setq tab-stop-list (number-sequence 4 120 4)  ; generates tabs distances at 4 spaces increments
      require-final-newline t
      make-backup-files nil
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 10
      kept-old-versions 0
      vc-make-backup-files t
      version-control t
      large-file-warning-threshold nil)

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'after-save-hook
            'executable-make-buffer-file-executable-if-script-p)
(add-hook 'before-save-hook
            (lambda ()
              (when buffer-file-name
                (let ((dir (file-name-directory buffer-file-name)))
                  (when (and (not (file-exists-p dir))
                             (y-or-n-p
                              (format "Directory %s doesn't exist.  Create it?" dir)))
                    (make-directory dir t))))))

(visual-line-mode nil)
(show-paren-mode 1)
(delete-selection-mode 1)
(line-number-mode -1)

;; Kill term buffer when exiting
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  "Advice to kill buffer when you exit terminal."
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(provide 'editor)
;;; editor.el ends here
