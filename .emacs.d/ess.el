;; ess

(let ((ess-path (getenv "ESS_PATH")))
  (if ess-path (add-to-list 'load-path ess-path)
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/ess")))
(require 'ess-site)
