;;; dired.el --- Directory Editor  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: directories dir editing files

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
;; Directory Editor

;; Dired makes an Emacs buffer containing a listing of a directory,
;; and optionally some of its subdirectories as well.  You can use the
;; normal Emacs commands to move around in this buffer, and special Dired
;; commands to operate on the listed files.  Dired works with both local and
;; remote directories.

;;; Code:
(use-package dired
  :ensure nil
  :defer t
  :bind
  (:map dired-mode-map
        ("<left>" . dired-up-directory)
        ("<right>" . dired-find-file))

  :config
  (setq dired-listing-switches "-laGvh --group-directories-first"
		dired-auto-revert-buffer 'dired-directory-changed-p
		dired-clean-confirm-killing-deleted-buffers t
		dired-clean-up-buffers-too t
		dired-create-destination-dirs 'always
		dired-free-space 'separate
		dired-mouse-drag-files 'move))

(provide 'dired)
;;; dired.el ends here
