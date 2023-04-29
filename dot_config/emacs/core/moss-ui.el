(message "[ Moss ] Loading Core Ui Configurations  ... ")

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(menu-bar-mode -1)
(tooltip-mode -1)

(setq frame-title-format
      '("Emacs - " (:eval (if (buffer-file-name)
                              (abbreviate-file-name (buffer-file-name))
                            "%b"))))

(setq use-dialog-box nil)               ; Dont want GUI popups

;; Startup
(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

;; Cursor Customisations
(setq blink-cursor-delay 0.5)
(setq blink-cursor-interval 0.5)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))  ; default
(setq mouse-wheel-progressive-speed t) ; accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ; scroll window under mouse

;; Scrolling via Keyboard
(setq scroll-margin 0)  ; Scroll when x lines away from window top and bottom.
(setq scroll-step 0)  ; scroll amount
(setq scroll-conservatively most-positive-fixnum)  ; dont want to jumps around
;; (setq maximum-scroll-margin 0.3)

;; Set up font
(if window-system
    ;; Set default font based on priority list
    (let* ((families '("JetBrains Nerd Font Mono"
                       "JetBrains Mono"
                       "Roboto Nerd Font Mono"
                       "Roboto Mono"
                       "Droid Sans Mono"
                       "Roboto"))
           (family (catch 'found
                     (dolist (f families)
                       (if (member f (font-family-list))
                           (throw 'found f))))))
      (set-face-attribute 'default nil
                          :family family :height 100)
      (message (concat "[ Moss ] Font loaded: " family))))

;; Nice padding to keep focus within emacs
(setq default-frame-alist
      (append (list
	           '(min-height . 1)
               '(height     . 45)
	           '(min-width  . 1)
               '(width      . 81)
               '(left-fringe . 9)
               '(right-fringe . 9)
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 24)
               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0))))

;; Vertical window divider
(setq window-divider-default-right-width 24)
(setq window-divider-default-places 'right-only)
(window-divider-mode 1)

;; Move around windows with out having to spam ’C-x o’
;; (windmove-mode)
(windmove-default-keybindings 'meta)

;; No fringe
;; (fringe-mode 8)

;; No ugly button for checkboxes
(setq widget-image-enable nil)

;; Hide org markup for README
(setq org-hide-emphasis-markers t)

(provide 'moss-ui)
;; Emacs UI configurations:1 ends here
