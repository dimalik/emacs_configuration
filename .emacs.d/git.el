;; git
(setq yagist-github-token "<your gist token>")
(add-hook 'yagist-list-mode-hook '(lambda () (hl-line-mode 1)))
(global-set-key (kbd "C-x g") 'magit-status)
