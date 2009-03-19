;;; init.el

; load paths
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(setq custom-file (concat dotfiles-dir "custom.el"))
(setq vendor-dir (concat dotfiles-dir "vendor"))
(add-to-list 'load-path vendor-dir)

(require 'cl)

; ready, set, go!
(defvar *emacs-load-start* (current-time))

(require 'elpa)
(require 'global)
(require 'defuns)
(require 'bindings)
(require 'modes)
(require 'theme)
(require 'snippets)

(vendor 'cheat)
(vendor 'far-search)
(vendor 'fuzzy-find-in-project)
(vendor 'textmate)
(textmate-mode)
(vendor 'whitespace)

(load custom-file 'noerror)

; finish!
(message "Loaded in %ds"
	 (destructuring-bind
	     (hi lo ms)
	     (current-time)
	   (- (+ hi lo)
	      (+ (first *emacs-load-start*)
		 (second *emacs-load-start*)))))

(provide 'init)
