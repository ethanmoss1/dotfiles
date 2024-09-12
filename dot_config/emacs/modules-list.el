;; Load modules
(mapcar 'module-load
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

          ;; -- Compolsory Modules --
          "vertico"
          "orderless"
          "marginalia"
          "chezmoi"

		  ;; Window manager and accompying modules
		  ;; Will only load when ‘my-hostname’ is equal to laptop
		  "desktop-environment"
		  "xelb"
		  "exwm"
		  "app-launcher"
		  "buffer-move"
		  "tab-bar"
		  "display-time"
		  "pdf-tools"

          ;; -- Themeing Modules --
          "alltheicons"
		  "modus-themes"
		  "moodline"

          ;; -- Other modules --
		  "notmuch"
          "programming"
          "helpful"
          "consult"
          "magit"
          "org"
          "corfu"
		  "docker"
		  "hl-todo"
		  "rainbow"
		  "nix"
          )) ;; -- End of Modules --
