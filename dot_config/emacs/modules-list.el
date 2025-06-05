;; Load modules
(mapcar
 'config-module-load
 '(;;;;;; ---- List of modules to load ----
   ;; -- Package manager --
   "elpaca"
   ;; "exec-path-from-shell"  ;; Need for path on MacOS

   "wait" ;; special wait and install.

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
   "embark"

   "wait"

   ;; MacOS packages
   ;; "macos-config"
   ;; "ns-auto-titlebar"

   ;; Window manager and accompying modules
   ;; Will only load when ‘my-hostname’ is equal to laptop
   ;; "desktop-environment"
   ;; "xelb"
   ;; "exwm"
   ;; "app-launcher"
   ;; "buffer-move"
   "tab-bar"
   "display-time"
   "pdf-tools"
   ;; "ednc"

   ;; -- Themeing Modules --
   "modus-themes"
   ;; "ef-themes"
   ;; "gruvbox"
   "moodline"
   ;; "alltheicons"
   "nerd-icons"
   "spacious-padding"  ;; adds padding, looks nice

   ;; Org & Org related
   "org"
   "org-contrib"
   "org-protocol"
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
   ;; "ntfy"

   ;; -- Editing modules --
   ;; "prot-better-c-g"
   "programming"
   "vundo"  ;; Visual undo history
   "hl-todo"
   "corfu"
   "rainbow"
   "consult"
   "adaptive-wrap"
   "jinx"
   "aggressive-indent"

   ;; -- Programming languages --
   "lsp-mode"
   ;; "eglot"
   "nix"
   "python"

   ;; -- Version Control --
   "magit"
   ;; "magit-gptcommit"

   ;; -- Other modules --
   "edit-server"
   "helpful"
   ;; "docker"
   "eat"
   ;; "systemd"
   ;; "gptel"
   ;; "mini-ontop"  ;; stops windows jiggling
   "el-easydraw"

   ;; -- Final modifications
   "linux"
   "secrets"
   )) ;; -- End of Modules --
