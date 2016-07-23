(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(show-paren-mode 1)  ;; highlight matching parenthasis
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

;; nifty documentation at point for lisp files
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


;; slime
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(setq slime-contribs '(slime-fancy))
