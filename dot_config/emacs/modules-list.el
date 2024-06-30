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
          "dired"
          "keybindings"
          "recentf"
          "savehist"

          ;; vvv not done yet vvv

          ;; -- Compolsory Modules --
          "vertico"
          "orderless"
          "marginalia"
          "chezmoi"
          ;; "exwm"                 ; will only load for laptop

          ;; -- Themeing Modules --
          "alltheicons"
		  "modus-themes"
		  "moodline"

          ;; -- Other modules --
		  ;; "notmuch"
          "tab-bar"
          "programming"
          "helpful"
          "consult"
          "magit"
          "org"
          "corfu"
		  "docker"
		  "hl-todo"
		  "rainbow"
          )) ;; -- End of Modules --
