;;; apparently the order by which these are loaded is very important
(eval-after-load "autopair-autoloads" ; <-- "autopair-autoloads" not "autopair"
  '(progn
     (require 'autopair)
     (autopair-global-mode 1)))
;;; autopair init
(require 'auto-pair+)
(defalias 'autopair-blink 'autopair--blink)
;; apparently we need this fix in the current version
(setq autopair-blink nil)
