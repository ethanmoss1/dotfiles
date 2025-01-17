;;; jinx.el --- Just in time spell checker           -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

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

;;; Commentary:
;; TODO:
;;; Code:

;; Make sure to install enchant-2 and pkgconf on you system
(let ((enchant (executable-find "enchant-2"))
       (pkg-conf (executable-find "pkgconf")))
  (if (and enchant pkg-conf)
      (use-package jinx
        :hook (elpaca-after-init . global-jinx-mode)
        :bind (("C-." . jinx-correct)
               ("C->" . jinx-languages)))
    (message "Jinx Not Loaded: Cannot find executable(s): %s"
             (concat (if (not enchant) "enchant-2 ")
                     (if (not pkg-conf) "pkgconf ")))))


;; This is a badly spelt word, I hope is can correctly fix these words.


;;; jinx.el ends here
