(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))


(setq-default js2-basic-offset 2)
(setq js-indent-level 2)
(add-hook 'js2-mode-hook (lambda ()
                           (progn
                             (paredit-mode -1)
                             (flycheck-mode))))
;; (require 'slime-js)


(defun find-imports (ext import-syntax-fn root tag)
  "Searches for occurrences of `tag` in files under `root` with extension `ext`

  Slightly confusing bash command which will search for java
  imports in your `get-java-project-root` directory and present you
  with a list of options sorted in most-used order. It does not
  insert them into the buffer, however.

  import-syntax-fn is a fn, given a tag, which returns an line of import code.

  returns a list of strings indicating used imports, most used first
  "
  

  (let* ((command (concat
                     ;;; find all java files in project root (excluding symlinks)
                   "find -P " root " -name '*." ext "' -type f | "
                     ;;; filter out imports that match tag
                   "xargs grep -h '" (funcall import-syntax-fn tag) "' "
                     ;;; group occurrences, count unique entries, then sort DESC
                   " | sort | uniq -c | sort -nr "
                     ;;; trim whitespace and ditch the count
                   " | sed 's/^\s*//' | cut -f2- -d ' '"))
         (results (shell-command-to-string command)))
    (progn
      (message command)
      (if (not (eq 0 (length results)))
          (split-string
           results
           "\n" t)))))

(defun copy-js-imports ()
  (interactive)
  (kill-new
   (first (find-imports "js" 
                        (lambda (tag) (concat tag " = require")) 
                        (textmate-project-root) (thing-at-point 'word)))))

(require 'flymake-jshint)
(add-hook 'js-mode-hook 'flymake-jshint-load)
(add-hook 'js-mode-hook 'flymake-mode)



(defun pretty-print-json(&optional b e)
  "Shells out to Python to pretty print JSON" 
  (interactive "r")
  (shell-command-on-region b e "python -m json.tool" (current-buffer) t)
  )

(autoload 'inferior-moz-mode "moz" "MozRepl Inferior Mode" t)
(autoload 'moz-minor-mode "moz" "MozRepl Minor Mode" t)
(add-hook 'js-mode-hook 'javascript-moz-setup)
(defun javascript-moz-setup () (moz-minor-mode 1))
