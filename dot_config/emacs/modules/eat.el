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
  :bind ("C-c t" . eshell)
  :config
  ;; Set shell for certain hosts
  (if (string-equal my-hostname "tablet")
      (setq eat-shell "/data/data/com.termux/files/usr/bin/bash")
    ;; (setq eat-shell "/bin/bash")
    (setq eat-shell "/bin/zsh"))

  ;; Eat settings
  (setq eat-kill-buffer-on-exit t
        eat-term-name "xterm"  ;; easier than trying to hack eat-term to work
        eat-tramp-shells '(("docker" . "/bin/sh")
                           ("ssh" . "/bin/bash")))

  ;; For `eat-eshell-mode'.
  ;; (add-hook 'eshell-load-hook #'eat-eshell-mode)

  ;; For `eat-eshell-visual-command-mode'.
  ;; (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)

  (eat-eshell-mode)

  ;; Set up the popup shell
  (add-to-list 'display-buffer-alist
               ;; *shell*  *eshell*  *eat*
               '("\\*\\(e?shell\\|eat\\)\\*"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (slot . -1) ;; -1 == L  0 == Mid 1 == R
                 (window-height . 0.33) ;; take 2/3 on bottom left
                 (window-parameters
                  (no-delete-other-windows . nil)))))

;;; eat.el ends here
