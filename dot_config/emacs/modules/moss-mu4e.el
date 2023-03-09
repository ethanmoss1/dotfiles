;;; moss-mu4e.el --- Emacs Email client

;;; Commentary : ---------------------------------------------------------------
;; Using Emacs as my Email client with MU 4 Emacs.
;; install using aur helper package manager or manually,
;; 'yay mu'

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, mu4e  ... ")

(use-package mu4e
  :straight (:host github
		     :files ("build/mu4e/*.elc")
             :branch "release/1.8"
		     :repo "djcb/mu"
		     :pre-build (("meson" "build")
                         ("ninja" "-C" "build"))))



(provide 'moss-mu4e)

;;; moss-mu4e.el ends here -----------------------------------------------------
