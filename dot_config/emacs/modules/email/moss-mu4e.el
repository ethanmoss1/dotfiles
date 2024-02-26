;;; moss-mu4e.el --- Emacs Email client

;;; Commentary : ---------------------------------------------------------------
;; Using Emacs as my Email client with MU 4 Emacs.
;; install using aur helper package manager or manually,
;; 'yay mu'

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, mu4e  ... ")

(use-package mu4e
  :elpaca (:host github
		     :files ("build/mu4e/*.el")
             ;; :branch "master"
             :branch "release/1.10"
		     :repo "djcb/mu"
		     :pre-build (("./autogen.sh")
                         ("make")))
  ;; :elpaca (mu4e :host github
  ;;               :repo "djcb/mu"
  ;;               :branch "release/1.10"
  ;;               :files ("mu4e/*.el" "build/mu4e/mu4e-meta.el" "build/mu4e/mu4e-config.el" "build/mu4e/mu4e.info")
  ;;               :main "mu4e/mu4e.el"
  ;;               :pre-build (("./autogen.sh") ("ninja" "-C" "build")
  ;;                           (make-symbolic-link (expand-file-name "./build/mu/mu")
  ;;                                               (expand-file-name "~/bin/mu") 'ok-if-exists))
  ;;               :build (:not elpaca--compile-info))
  :commands
  (mu4e mu4e-update-index)
  :config
  ;; use pass to store passwords
  ;; file auth looks for is ~/.password-store/<smtp.host.tld>:<port>/<name>
  (auth-source-pass-enable)

  :custom
  (auth-sources '(password-store))
  (auth-source-debug t)
  (auth-source-do-cache nil)
  (;; Set correct binary
   ;; mu4e-mu-binary "~/.config/emacs/cache/straight/repos/mu/build/mu/mu"
   mail-user-agent 'mu4e-user-agent
   mu4e-change-filenames-when-moving t  ;; Avoid mail sync issues w/ mbsync
   mu4e-modeline-mode nil
   mu4e-modeline-support nil


   ;; Refresh mail using isync every 10 minutes
   mu4e-update-interval (* 10 60)
   message-kill-buffer-on-exit t
   mu4e-use-fancy-chars t
   mu4e-get-mail-command "mbsync -a"
   mu4e-maildir "/home/ethan/Mail"

   ;; mu4e-maildir-shortcuts '(("/Inbox"                   . ?i)
                            ;; ("/cywin/[Gmail]/Sent Mail" . ?s)
                            ;; ("/cywin/[Gmail]/Trash"     . ?t)
                            ;; ("/cywin/[Gmail]/Drafts"    . ?d)
                            ;; ("/cywin/[Gmail]/All Mail"  . ?a))

   mu4e-contexts (list
                  ;; Cywinskimoss Gmail Account
                  (make-mu4e-context
                   :name "Cywinskimoss"
                   :match-func
                   (lambda (msg) (when msg
                    (string-prefix-p "/cywin" (mu4e-message-field msg :maildir))))
                   :vars '((user-mail-address   . "cywinskimoss@gmail.com")
                           (user-full-name      . "Ethan Moss")
                           (mu4e-drafts-folder  . "/cywin/[Gmail]/Drafts")
                           (mu4e-sent-folder    . "/cywin/[Gmail]/Sent Mail")
                           (mu4e-refile-folder  . "/cywin/[Gmail]/All Mail")
                           (mu4e-trash-folder   . "/cywin/[Gmail]/Trash")))

                  ;; Wow.ethm Gmail account
                  (make-mu4e-context
                   :name "Wow.ethm"
                   :match-func
                   (lambda (msg) (when msg
                    (string-prefix-p "/wowethm" (mu4e-message-field msg :maildir))))
                   :vars '((user-mail-address   . "wow.ethm@gmail.com")
                           (user-full-name      . "Ethan Moss")
                           (mu4e-drafts-folder  . "/wowethm/[Gmail]/Drafts")
                           (mu4e-sent-folder    . "/wowethm/[Gmail]/Sent Mail")
                           (mu4e-refile-folder  . "/wowethm/[Gmail]/All Mail")
                           (mu4e-trash-folder   . "/wowethm/[Gmail]/Trash")))
                  )
   )
   ;; Create context for merged views
   (add-to-list 'mu4e-bookmarks '("m:/cywin/INBOX or m:/wowethm/INBOX" "All Inboxes" ?i))

   )

;; Show how many unread messages
;; (use-package mu4e-alert
;;   :config
;;   (mu4e-alert-enable-mode-line-display)
;;   (mu4e-alert-enable-notifications)
;;   ;; (mu4e-modeline-mode -1)
;;   )

(provide 'moss-mu4e)

;;; moss-mu4e.el ends here -----------------------------------------------------
