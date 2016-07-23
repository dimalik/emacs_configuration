(setq ess-swv-processor 'knitr)
(setq ess-swv-plug-into-AUCTeX-p t)

(setq TeX-file-extensions
      '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))
(add-to-list 'auto-mode-alist '("\\.Rnw\\'" . Rnw-mode))
(add-to-list 'auto-mode-alist '("\\.Snw\\'" . Snw-mode))
(add-hook 'Rnw-mode-hook
 (lambda ()
  (add-to-list 'TeX-expand-list '("%rnw" file "Rnw" t) t)
  (add-to-list 'TeX-command-list
               '("Knit" "Rscript -e \"library(knitr); knit('%t')\""
                 TeX-run-command nil (latex-mode) :help
                 "Run Knitr") t)
  (add-to-list 'TeX-command-list
               '("LaTeXKnit" "%l %(mode) %s"
                 TeX-run-TeX nil (latex-mode) :help
                 "Run LaTeX after Knit") t)
  (setq TeX-command-default "Knit")))
	

(defun ess-swv-remove-TeX-commands (x)
  "Helper function: check if car of X is one of the Knitr strings"
  (let ((swv-cmds '("Knit" "LaTeXKnit")))
    (unless (member (car x) swv-cmds) x)))

;; reftex
(load "auctex.el" nil t t)
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)
(setq reftex-cite-format 'natbib)
;; pdflatex support
(setq TeX-PDF-mode t)
;; global library
(setq reftex-default-bibliography '("/path/to/library.bib"))

;; texcount
(defun latex-word-count ()
  (interactive)
  (shell-command (concat "texcount "
			 "-unicode "
			 "-inc "
			 (buffer-file-name))))
(eval-after-load "latex"
  '(define-key LaTeX-mode-map "\C-cw" 'latex-word-count))


(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-bib-cite)
;; gb4e
(add-hook 'LaTeX-mode-hook '(lambda ()
			      (add-to-list 'LaTeX-item-list
					   '("exe" lambda ()
                                             (let (TeX-insert-braces) (TeX-insert-macro "ex"))))))
(setq-default TeX-master nil)
