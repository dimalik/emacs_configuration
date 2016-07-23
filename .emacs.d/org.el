;; org-mode

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;; these are the files org should use globally
;;; these are examples (feel free to fix)
(setq org-agenda-files (list "~/.org/mails.org"
			     "~/.org/todo.org"
			     "~/.org/notes.org"))

(add-hook 'org-agenda-mode-hook (lambda () (hl-line-mode 1)))

;;; org-mode/RefTex interface
;;; now we can use bibliographies in the notes
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
	 (global-auto-revert-mode t)
	 (reftex-parse-all)
	 (reftex-set-cite-format "** [[bib:%l][%l]]: %t \n"
				 )))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;;; points to library
(setq org-link-abbrev-alist
      '(("bib" . "/path/to/library")))
