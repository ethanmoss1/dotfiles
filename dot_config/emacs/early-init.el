;;; early-init.el --- Early initalisation file

;;; Commentary:
;; Set a couple of flags to make sure Emacs loads smoothly
;; Massive thanks to Jimeh, alot of the code here is from his siren Emacs.
;; Credit: https://github.com/jimeh/.emacs.d

;;; Code:
;; Native-Comp
(setq native-comp-speed 2
      comp-speed 2)
(setq native-comp-async-report-warnings-errors nil
      comp-async-report-warnings-errors nil)
(setq native-comp-async-query-on-exit t
      comp-async-query-on-exit t)

;; Defer garbage collection further back in the startup process
;; (setq gc-cons-threshold most-positive-fixnum)

(let ((deny-list '("\\(?:[/\\\\]\\.dir-locals\\.el$\\)")))
  (if (boundp 'native-comp-deferred-compilation-deny-list)
      (setq native-comp-deferred-compilation-deny-list deny-list)
    (setq comp-deferred-compilation-deny-list deny-list)))

(when (or (boundp 'comp-eln-load-path) (boundp 'native-comp-eln-load-path))
  (let ((eln-cache-dir (expand-file-name "cache/eln-cache/"
                                         user-emacs-directory))
        (find-exec (executable-find "find")))

    (if (boundp 'native-comp-eln-load-path)
        (setcar native-comp-eln-load-path eln-cache-dir)
      (setcar comp-eln-load-path eln-cache-dir))
    ;; Quitting emacs while native compilation in progress can leave zero byte
    ;; sized *.eln files behind. Hence delete such files during startup.
    (when find-exec
      (call-process find-exec nil nil nil eln-cache-dir
                    "-name" "*.eln" "-size" "0" "-delete" "-or"
                    "-name" "*.eln.tmp" "-size" "0" "-delete"))))

(if (eq system-type 'android)
    (progn
      (message "Android system, updating paths and libs for termux")
      (setq termux-dir "/data/data/com.termux/")
      (setq shell-file-name (concat termux-dir "files/usr/bin/bash"))
      (setq user-emacs-directory "~/.config/emacs/")
      (setenv "HOME" (concat termux-dir "files/home/"))
      (setenv "PATH"
              (format "%s:%s"
                      (concat
                       termux-dir
                       "files/usr/bin"
                       ":"
                       termux-dir
                       "files/usr/bin/texlive")
			     (getenv "PATH")))
      (setenv "LD_LIBRARY_PATH" (format "%s:%s"
                                        (concat
                                         termux-dir
				                         "files/usr/lib")
					(getenv "LD_LIBRARY_PATH")))
      (push (concat termux-dir "files/usr/bin") exec-path)
      (push (concat termux-dir "files/usr/bin/texlive") exec-path))
  (message "Not android, continuing"))

(setq package-enable-at-startup nil)

(setq tool-bar-mode nil
      menu-bar-mode nil)
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we easily halve startup times with fonts that are
;; larger than the system default.
(setq frame-inhibit-implied-resize t)

;;; early-init.el ends here
