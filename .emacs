;;; helper functions to get the ~/.emacs.d directory

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
	 user-emacs-directory)
	((boundp 'user-init-directory)
	 user-init-directory)
	(t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;;; every plugin which requires setup is in its own
;;; file. sometimes this might become overwhelming
;;; but it's nice for consistency.
;;; packages with + = need to setup dirs
;;; packages with - = check dirs (generally correct)
(load-user-file "paths.el")             ; - add any paths that might have packages
(load-user-file "autopair.el")          ; for adding closing parens quotes etc like in textmate
(load-user-file "functions.el")         ; minor helper function (find current mode, resize windows)
(load-user-file "visual-bindings.el")   ; - make it look like the terminal version, themeing etc.
(load-user-file "ess.el")               ; - load ESS
(load-user-file "packages.el")          ; adds repos and ensures packages are installed
(load-user-file "markdown.el")          ; loads markdown mode
(load-user-file "helm.el")              ; helm initialization
(load-user-file "empos.el")             ; + empos vars
(load-user-file "slime.el")             ; - load slime
(load-user-file "org.el")               ; + load org and init dirs 
(load-user-file "python.el")            ; + load elpy/initialize ipython
(load-user-file "autocomplete.el")      ; autocomplete mode
(load-user-file "gnus.el")              ; gnus mailing
(load-user-file "switch-window.el")     ; nice packages to navigate through buffers
(load-user-file "erc.el")               ; + relay chat client for emacs (fix the gpg file)
(load-user-file "sgml.el")
(load-user-file "speedbar.el")          ; load sr-speedbar instead (no detached window)
(load-user-file "git.el")               ; + magit and yagist (fix your gist token)
(load-user-file "web-mode.el")          ; web mode hooks
(load-user-file "js.el")                ; js (and java(!)) hooks and functions
(load-user-file "tex.el")               ; several tex (and knitr) related funs
(load-user-file "bugz.el")              ; bugzilla interface
(load-user-file "eshell.el")            ; provides eshell specific functions
(exec-path-from-shell-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(bugz-command "/usr/bin/bugz")
 '(empos-favorite-engines (list "crossref" "pubmed" "arxiv"))
 '(lua-default-application "qlua")
 '(lua-default-command-switches (quote ("-i" "-lqttorch" "-lenv")))
 '(pyvenv-mode t)
 '(safe-local-variable-values (quote ((engine . django))))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
