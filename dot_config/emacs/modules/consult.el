;;; consult.el ---   -*- lexical-binding: t; -*-

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
(global-unset-key (kbd "C-x C-b"))

(use-package consult
  :bind
  ("C-t" . 'consult-imenu)
  ("C-x b" . 'consult-buffer)
  ("C-c b" . 'consult-project-buffer)
  ("C-x C-b" . 'consult-bookmark)
  ("C-s" . 'consult-line)
  ("M-g M-g" . 'consult-goto-line))

;; consult.el ends here
