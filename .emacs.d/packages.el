(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; (defvar my-packages '(magit clojure-mode dedicated 
;;                             ;; elisp-cache ;; seems to be missing from marmalade
;;                             org paredit protobuf-mode rainbow-delimiters scpaste
;;                             ;; something in ESK is breaking ido for me
;;                             ;; starter-kit-lisp starter-kit-js starter-kit-eshell
;;                             scratch dizzee ctags-update virtualenvwrapper websocket znc
;;                             pastels-on-dark-theme textmate pony-mode slime flymake-jshint
;;                             js2-mode
;;                             json-mode ;; better syntax highlighting / error reporting for json
;;                             yaml-mode
;;                             haskell-mode ;; used for xmonad config
;;                             zencoding-mode ;; easy html authoring
;;                             idle-highlight-mode flymake-cursor dired-single
;;                             ;; flymake-less ; missing from melpa
;;                             git-link ;; link to line of code.
;;                             less-css-mode css-eldoc
;;                             dockerfile-mode ;; syntax highlighting for Dockerfiles
;;                             web-mode ;; multi-mode [sorta] for html files
;;                             pastels-on-dark-theme textmate pony-mode
;;                             fill-column-indicator flycheck flymake-jshint
;;                             auto-complete scss-mode flymake-sass
;;                             htmlize ;; used for blog publishing
;;                             markdown-mode ;; markdown syntax highlighting, etc.
;;                             pymacs ;; python + emacs bridge for ropemacs refactoring
;;                             dired-details ; makes dired buffer nice
;;                             go-mode go-eldoc go-autocomplete ; golang
;;                             yasnippet ;; programmable tab-completion
;;                             xclip ;; linux console copy+paste goodness
;;                             gnuplot ;; used for gnuplot graph exports from org-babel's publish
;;                             )
;;   "A list of packages to ensure are installed at launch.")

;; (dolist (p my-packages)
;;   (when (not (package-installed-p p))
;;     (package-install p)))
