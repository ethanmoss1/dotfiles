;;; elfeed.el --- RSS and ATOM feed manager and viewer  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

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

;;; Commentary:

;;

;;; Code:

(use-package elfeed
  :config
  (setq elfeed-feeds
      '(;; Computing & IT News
		("https://learn2.open.ac.uk/blocks/news/feed.php?bi=304299" uni news)
		;; Module M269 news
		("https://learn2.open.ac.uk/blocks/news/feed.php?bi=304300" uni news)
		;; Module T257 news
		("https://learn2.open.ac.uk/blocks/news/feed.php?bi=299153" uni news)
		;; /dev/null
		("yummymelon.com/devnull/feeds/all.atom.xml" emacs blog)
		;; XKCD
		("https://xkcd.com/rss.xml" humour cartoon)
		;; Emacs release news
		("https://emacs.org/rss/emacs.xml" emacs news release)
		;; Google Alerts "Spinal Muscular Atrophy"
		("https://www.google.com/alerts/feeds/13595612812189678051/7036549150154760100" news medical)
		;; Google Alerts "Bridge RNA"
		("https://www.google.com/alerts/feeds/13595612812189678051/7859550417961526637" news medical)
        ;; Planet Emacs
        ("https://planet.emacslife.com/atom.xml" emacs news)
        ("https://themkat.net/feed/by_tag/emacs.xml" emacs news)
        )))

;; (use-package elfeed-goodies
;;   :after elfeed
;;   :init (elfeed-goodies/setup))

;;; elfeed.el ends here
