;; Load modules
(mapcar 'module-load
        '(;;;;;; ---- List of modules to load ----
          ;; -- Package manager --
          "elpaca"               ; Required to load additional packages

          ;; -- Emacs Default --
          ;; Changes to the way emacs works from the defaults.
          "keybindings"
          "ui"
          "editor"

          ;; -- Built in modules --
          ;; List of modules that are part of the emacs distribution and their
          ;; customisation
          "c-code"
          "startup"
          "frame"
          "mouse"
          "widget"
                    "uniquify"
          "dired"

		  ;; vvv not done yet vvv
          "recentf"
		  "savehist"
          "display-fill-column"

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
