;;; corfu.el ---   -*- lexical-binding: t; -*-

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

;;; Commentary :

;;; Code :
(use-package corfu
  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :hook (elpaca-after-init . global-corfu-mode)
  :config
  (require 'corfu-popupinfo)

  (setopt corfu-popupinfo-delay '(0.5 . 0.5)
          corfu-min-width 20)
  (corfu-popupinfo-mode)

  ;; (require 'org-TBLFM-regexp)
  (setopt corfu-cycle t                ;; Enable cycling for `corfu-next/previous'
          corfu-auto t                 ;; Enable auto completion
          corfu-separator ?\s          ;; Orderless field separator
          corfu-quit-at-boundary nil   ;; Never quit at completion boundary
          corfu-quit-no-match t
          corfu-preview-current nil    ;; Disable current candidate preview
          corfu-preselect 'prompt      ;; Preselect the prompt
          corfu-on-exact-match nil     ;; Configure handling of exact matches
          corfu-scroll-margin 2))      ;; Use scroll margin

;; Additional package to make it work on terminal.
(use-package corfu-terminal
  :after (corfu)
  :init (corfu-terminal-mode))

;; A few more useful configurations...
(use-package emacs
  :ensure nil
  :init
  ;; TAB cycle if there are only few candidates
  (setopt completion-cycle-threshold nil)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  (setopt read-extended-command-predicate
          #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setopt tab-always-indent 'complete))


;;; corfu.el ends here ----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
