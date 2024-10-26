;;; eat.el --- Better shell in emacs                -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <ethan@nixos>
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

(use-package eat
  :config
  ;; Eat settings
  (setq eat-kill-buffer-on-exit t)
  ;; Set shell for android
  (if (string-equal my-hostname "tablet")
      (setq eat-shell "/data/data/com.termux/files/usr/bin/bash"))
  ;; For `eat-eshell-mode'
  (add-hook 'eshell-load-hook #'eat-eshell-mode)

  ;; For `eat-eshell-visual-command-mode'
  (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)

  ;; Set up the popup shell
  (add-to-list 'display-buffer-alist
               '("\\*e?shell\\*"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (slot . -1) ;; -1 == L  0 == Mid 1 == R
                 (window-height . 0.33) ;; take 2/3 on bottom left
                 (window-parameters
                  (no-delete-other-windows . nil)))))

;;; eat.el ends here
