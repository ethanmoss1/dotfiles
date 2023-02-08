;; Emacs init file
;; Small emacs init so if for any reason you may need to load another configuration or otherwise you can do so with ease. We only make sure to load the most recent bytecode, then

;; [[file:emacsconfig.org::*Emacs init file][Emacs init file:1]]
;; Stop package.el from adding it/
;; (package-initalize)

;; Bytecode
(setq load-prefer-newer t)
(load (expand-file-name "core/moss-core.el"
                        (file-name-directory load-file-name)))
;; Emacs init file:1 ends here
