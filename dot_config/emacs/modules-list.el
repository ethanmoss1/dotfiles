;; Load modules
(mapcar
 'module-load
 '(;;;;;; ---- List of modules to load ----
   ;; -- Package manager --
   "elpaca"

   ;; -- Built in modules --
   "c-code"
   "startup"
   "frame"
   "mouse"
   "widget"
   "simple"
   "electric"
   "font-core"
   "saveplace"
   "subr"
   "files"
   "delsel"
   "paren"
   "uniquify"
   "recentf"
   "savehist"
   "auto-insert"
   "dired"
   "keybindings"
   "ibuffer"
   "window"
   "tramp"
   ;; "gnus"
   "ispell"
   "minibuffer"
   "calendar"
   ;; "webjump"
   "replace"

   ;; -- Compulsory Modules --
   "vertico"
   "orderless"
   "marginalia"
   "chezmoi"

   ;; Window manager and accompying modules
   ;; Will only load when ‘my-hostname’ is equal to laptop
   "desktop-environment"
;;   "xelb"
   "exwm"
   "app-launcher"
   "buffer-move"
   "tab-bar"
   "display-time"
   "pdf-tools"
   "ednc"

   ;; -- Themeing Modules --
   "alltheicons"
   "modus-themes"
   ;; "ef-themes"
   ;; "gruvbox"
   "moodline"

   ;; Org Extras
   "org"
   "org-caldav"
   "org-roam"
   "org-fragtog"
   ;; "org-noter"
   ;; "org-gtd"
   "org-man"
   "olivetti"

   ;; -- News and Email --
   "elfeed"
   "notmuch"

   ;; -- Editing modules --
   "programming"
   "vundo"  ;; Visual undo history
   "hl-todo"
   "corfu"
   "rainbow"
   "consult"
   "adaptive-wrap"

   ;; -- Programming languages --
   "nix"
   "python"

   ;; -- Version Control --
   "magit"
   "magit-gptcommit"

   ;; -- Other modules --
   "helpful"
   "docker"
   "eat"
   "gptel"


   )) ;; -- End of Modules --
