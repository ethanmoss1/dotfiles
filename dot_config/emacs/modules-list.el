;; Load modules
(mapcar
 'config-module-load
 '(;;;;;; ---- List of modules to load ----
   ;; -- Package manager --
   "elpaca"
   ;; "exec-path-from-shell"  ;; Need for path on MacOS

   "wait" ;; special wait and install.

   ;; -- Built in modules --
   "keybindings"
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
   "ibuffer"
   "window"
   "tramp"
   ;; "gnus"
   "ispell"
   "minibuffer"
   "calendar"
   ;; "webjump"
   "replace"
   "winner"
   "ediff"
   "dictionary"
   "project"

   ;; -- Compulsory Modules --
   "vertico"
   "orderless"
   "marginalia"
   "consult"
   "embark"

   "chezmoi"

   ;; MacOS packages
   ;; "macos-config"
   ;; "ns-auto-titlebar"

   "wait" ;; Install the most important first.

   ;; - Inbuffer Completion
   "corfu"
   "cape"


   ;; Window manager and accompying modules
   ;; Will only load when ‘my-hostname’ is equal to laptop
   "desktop-environment"
   "xelb"
   "exwm"
   "app-launcher"
   ;; "buffer-move"
   "tab-bar"
   "display-time"
   "pdf-tools"
   "ednc"
   "ultra-scroll"

   "wait"

   ;; -- Themeing Modules --
   "modus-themes"
   "nerd-icons"
   "spacious-padding"  ;; adds padding, looks nice
   ;; "doom-modeline"

   ;; Org & Org related
   "org"
   "org-contrib"
   "org-protocol"
   "org-export-icalendar"

   "org-link-man"
   "org-link-rfc"

   ;; "org-caldav"
   "org-roam"
   ;; "org-roam-ui"
   "org-roam-timestamps"
   "org-contacts"
   "org-fragtog"
   "org-appear"
   ;; "org-noter"
   ;; "org-gtd"
   "olivetti"


   ;; -- Bibliography related packages --
   "citar"
   "citar-org-roam"
   "zotra"

   ;; -- News and Email --
   "elfeed"
   "notmuch"
   "microdata" ;; For acting on data in an email
   "ntfy"

   ;; -- Editing modules --
   ;; "prot-better-c-g"
   "programming"
   "vundo"  ;; Visual undo history
   "hl-todo"
   "rainbow"
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
   ;; "conventional-commit"

   ;; -- Other modules --
   "edit-server"
   "helpful"
   "docker"
   "eat"
   "systemd"
   "daemon"
   ;; "gptel"
   ;; "mini-ontop"  ;; stops windows jiggling
   "el-easydraw" ;; edraw

   ;; -- Final modifications
   "linux"
   "bluetooth"
   "secrets"
   )) ;; -- End of Modules --
