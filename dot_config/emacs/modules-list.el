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
		  "tab-bar"
		  "recentf"
          "savehist"
		  "auto-insert"
          "dired"
          "keybindings"
		  "ibuffer"

          ;; -- Compolsory Modules --
          "vertico"
          "orderless"
          "marginalia"
          "chezmoi"
          "exwm"                 ; will only load for laptop

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
