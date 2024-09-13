;;; moss-gnus.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------
(use-package gnus
  :ensure (:package "gnus"
		   ;; :depth 1
		   :inherit nil
		   :protocol https
		   :files (:defaults "lisp/gnus/*" (:exclude ".git"))
		   :repo "https://git.savannah.gnu.org/git/emacs.git")
  :config
  (setq user-full-name "Ethan Moss"
		gnus-select-method '(nntp "news.eternal-september.org"))

  (add-to-list 'gnus-secondary-select-methods
               '(nnatom "learn2.open.ac.uk/blocks/news/feed.php?bi=304299"
						(nnatom-name "M269 News")))
  (add-to-list 'nnrss-group-alist '(("xkcd.com"
									"https://xkcd.com/rss.xml"
									"A webcomic of romance and math humor."))))


;; https://xkcd.com/rss.xml
;; (nnrss "https://emacs.org/rss/emacs.xml"
;;				  (nnrss-name "Emacs News"))


;;;; Welcome as a new user of news.eternal-september.org
;; You have successfully registered as a user of the news.eternal-september.org
;; Usenet news server.  As a registered user you may now access all newsgroups
;; and post articles to these groups.  Please configure your newsreader to
;; access
;;
;; news.eternal-september.org
;;
;; The port number is 119. This is the standard port number for news servers and
;; should be set as a default in your client. You also have to configure your
;; client to use the userid and password you will soon receive by email.  If you
;; are only able to select groups in the;
;;
;; eternal-september.* and posenet.*
;;
;; hierarchies, your news client has connected to the server without sending the
;; userid and password. Please refer to your newsreader's documentation for
;; information on how to configure server access with authentication or check
;; the FAQ In case of problems or questions don't hesitate to conatct
;; support@eternal-september.org.
