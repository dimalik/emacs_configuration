;; ;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/.virtualenvs/")

(add-to-list 'package-archives
 	     '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;; package-archives

(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "jedi")          ; use preferred backend
(elpy-use-ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--gui=tk --pdb --nosep --classic")

(defun company-yasnippet-or-completion ()
  "Solve company yasnippet conflicts."
  (interactive)
  (let ((yas-fallback-behavior
         (apply 'company-complete-common nil)))
    (yas-expand)))

(add-hook 'company-mode-hook
          (lambda ()
            (substitute-key-definition
             'company-complete-common
             'company-yasnippet-or-completion
             company-active-map)))
