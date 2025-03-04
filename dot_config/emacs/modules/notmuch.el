;;; notmuch.el ---   -*- lexical-binding: t; -*-

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
(defun my/notmuch-edit-config ()
  "Edit the taggin config for notmuch"
  (interactive)
  (find-file "/ssh:syncthing:~/mail/.notmuch/tagmail"))

(use-package notmuch
  :config
  ;; Notmuch on remote server, ssh config and custom bash file needed
  (if (string-equal my-hostname "tablet")
	  (setq notmuch-command "/data/data/com.termux/files/home/mail/.notmuch/remote-notmuch")
	(setq notmuch-command "~/mail/.notmuch/remote-notmuch"))

  ;;;; Notmuch - Welcome screen
  (setq	notmuch-show-logo nil
		notmuch-hello-sections '(notmuch-hello-insert-header
                                 notmuch-hello-insert-search
                                 notmuch-hello-insert-saved-searches
                                 ;; notmuch-hello-insert-recent-searches
                                 notmuch-hello-insert-alltags)
		notmuch-saved-searches '((:name "inbox" :query "tag:inbox" :key "i")
                                 (:name "unread" :query "tag:unread AND NOT tag:mailinglist" :key "u")
                                 (:name "mailing lists" :query "tag:mailinglist AND tag:unread" :key "l" :search-type tree)
                                 (:name "flagged" :query "tag:flagged" :key "f")
                                 (:name "sent" :query "tag:sent" :key "t")
                                 (:name "important" :query "tag:important" :key "p")
                                 (:name "all mail" :query "*" :key "a"))
  ;;;; Notmuch - Mail view
		mm-text-html-renderer 'shr))

;;;; --------------------------------
;;;; Additional config for future use
;;;; --------------------------------

;; To prevent you from having to maintain your GPG private keys on the remote
;; server, you can add advice to notmuch-show-view-raw-message to enable epa
;; inline decryption from notmuch raw message views.

;;;; enable gpg decryption in raw view
;;(defadvice notmuch-show-view-raw-message
;;    (after notmuch-show-view-raw-message-after activate)
;;  (epa-mail-mode))

;;;; ----------------------------------------------------

;; When using remote-notmuch in an environment that brings the ssh tunnel up and
;; down often (e.g. laptop suspends), it's helpful to have an Emacs process
;; sentinel in place that will monitor the process state of your remote-notmuch
;; ssh session.Here is config for down the line that allow monitoring of the
;; remote notmuch ssh session to stop it from restarting the ssh process all the
;; time

;;(defvar my/ssh-tunnel-notmuch-proc nil)
;;
;;(defun my/ssh-tunnel-notmuch ()
;;  "Start and monitor ssh session for remote-notmuch."
;;  (my/ssh-tunnel-with-proc
;;   (proc "~/.ssh/config" "notmuch")
;;   (set-process-sentinel
;;    proc
;;    #'(lambda (proc string)
;;        (when (buffer-live-p (process-buffer proc))
;;          (kill-buffer (process-buffer proc)))
;;        (when (yes-or-no-p "Restart notmuch control master? ")
;;          (setq my/ssh-tunnel-notmuch-proc (my/ssh-tunnel-notmuch)))))
;;   proc))
;;
;;(defadvice notmuch
;;    (before notmuch-before activate)
;;  (unless (process-live-p my/ssh-tunnel-notmuch-proc)
;;    (message "Starting notmuch control master")
;;    (setq my/ssh-tunnel-notmuch-proc (my/ssh-tunnel-notmuch))))
;;
;;;;; here be dragons
;;
;;(require 'cl-lib)
;;(require 'tramp)
;;
;;(cl-defmacro my/ssh-tunnel-with-proc ((proc ssh-tunnel-config-path ssh-tunnel-config-name) &body body)
;;  "Bind PROC with an ssh process for SSH-TUNNEL-CONFIG-NAME from SSH-TUNNEL-CONFIG-PATH for BODY.
;;
;;  Example of use:
;;
;;  (defun my/ssh-tunnel-start ()
;;    \"returns active process or nil\"
;;    (my/ssh-tunnel-with-proc (proc \"~/my-ssh-configs/someconfig.ssh\"
;;                                   \"name_of_config\")
;;                             ;; BODY with process bound to proc
;;                             proc))
;;  "
;;  (let ((ssh-tunnel-process (gensym "ssh-tunnel-process")))
;;
;;    `(let ((,ssh-tunnel-process nil)
;;           (ssh-tunnel-buffer-name (format "*%s*" ,ssh-tunnel-config-name))
;;           (ssh-tunnel-config ,ssh-tunnel-config-name))
;;       (if (not (process-live-p ,ssh-tunnel-process))
;;           (let ((process (start-process
;;                           ,ssh-tunnel-config-name
;;                           (generate-new-buffer ssh-tunnel-buffer-name)
;;                           "ssh"
;;                           "-C"
;;                           "-N"
;;                           "-F"
;;                           (format "%s" (expand-file-name ,ssh-tunnel-config-path))
;;                           ,ssh-tunnel-config-name)))
;;             (if (process-live-p process)
;;                 (progn
;;                   (setq ,ssh-tunnel-process process)
;;                   (set-process-filter
;;                    process
;;                    #'(lambda (proc string)
;;                        (when (and (process-live-p proc)
;;                                   (buffer-live-p (process-buffer proc)))
;;                          (if (string-match-p tramp-password-prompt-regexp string)
;;                              (process-send-string proc (concat (read-passwd string) "\n"))
;;                            (princ (format "%s" string)
;;                                   (process-buffer proc))))))
;;                   (set-process-sentinel
;;                    process
;;                    #'(lambda (proc string)
;;                        (message "%s-sentinel: %s" ,ssh-tunnel-config-name string)))
;;                   (message "Started ssh config: %s" ,ssh-tunnel-config-name))
;;               ;; else
;;               (message "Could not start ssh config: %s" ,ssh-tunnel-config-name)))
;;         (message "%s already running" ,ssh-tunnel-config-name))
;;       ;; BODY
;;       (let ((,proc ,ssh-tunnel-process))
;;         ,@body)
;;       )))

;;;; ----------------------------------------------------

;;; notmuch.el ends here
