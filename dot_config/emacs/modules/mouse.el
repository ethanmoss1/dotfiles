;;; mouse.el --- Mouse support in Emacs  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: mouse X11

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
;; Mouse support in Emacs

;;

;;; Code:
(use-package mouse
  :ensure nil
  :config (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
                mouse-wheel-progressive-speed t      ; accelerate scrolling
                mouse-wheel-follow-mouse 't))         ;scroll window under mouse

;;; mouse.el ends here
