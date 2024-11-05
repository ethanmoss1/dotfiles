;;; gptel.el --- LLM chat for Emacs                  -*- lexical-binding: t; -*-

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


;; For more info visit the github page.
;; https://github.com/karthink/gptel

;;; Code:

(use-package gptel
  :config
  ;; Optional package
  (use-package markdown-mode)

  ;; Change to Gemini
  (setq gptel-model 'gemini-pro
        gptel-backend (gptel-make-gemini "Gemini"
                        :key (funcall (plist-get (car (auth-source-search
                                                       :max 1
                                                       :host "ai.gemini"
                                                       :user "google"))
                                                 :secret))
                        :stream t))

  (add-hook 'gptel-post-response-functions 'gptel-end-of-response)

  ;; Display buffer alist
  (add-to-list 'display-buffer-alist
               '("\\*gemini\\*"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (slot . -1) ;; -1 == L  0 == Mid 1 == R
                 (window-height . 0.33) ;; take 2/3 on bottom left
                 (window-parameters
                  (no-delete-other-windows . nil)))))

;;; gptel.el ends here
;; Local Variables:
;; eval: (if module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
