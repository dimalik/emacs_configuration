;;; display the line number on the side
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
;;; fix left right arrows
(global-set-key "\M-[1;5C" 'forward-word)
(global-set-key "\M-[1;5D" 'backward-word)
;; show column numbers at the bottom
(setq column-number-mode t)
(cua-mode)                              ; keybinding for copy/cut/paste

(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)
                        
;;; select more like this
(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this)
(global-set-key (kbd "C-*") 'mark-all-like-this)

;;; fix? home and end keys
(define-key global-map "\M-[1~" 'beginning-of-line)
(define-key global-map [select] 'end-of-line)

;;; load theme
(load-theme 'tango-dark)

;;; make it look like the terminal version
;;; 1) no splash screen
;;; 2) no menus toolbars
;;; 3) no 3d crap

(setq inhibit-startup-message t)
(tool-bar-mode -1)                      ; don't show the toolbar
(menu-bar-mode -1)                      ; don't show the menu bar
(scroll-bar-mode -1)                    ; don't show the scroll bar
(set-face-attribute 'mode-line nil :box nil)
 
;; display datetime
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

(setq-default truncate-lines 1)         ; no wordwrap

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward) ; buffernames that are foo<1>, foo<2> are hard to read. This makes them foo|dir  foo|otherdir
(setq abbrev-file-name "~/.emacs.d/abbrev_defs") ; where to save auto-replace maps

;; (ido-mode t);; fuzzy matching on find-file, buffer switch
;; (setq ido-enable-flex-matching t)
;; (add-to-list 'ido-ignore-files "\\.pyc")

;; colorize the output of the compilation mode.
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))

  ;; mocha seems to output some non-standard control characters that
  ;; aren't recognized by ansi-color-apply-on-region, so we'll
  ;; manually convert these into the newlines they should be.
  (goto-char (point-min))
  (while (re-search-forward "\\[2K\\[0G" nil t)
    (progn
      (replace-match "
")))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)


(defalias 'qrr 'query-regexp-replace)
(fset 'yes-or-no-p 'y-or-n-p)         ; only type `y` instead of `yes`
(setq-default indent-tabs-mode nil)   ; no tabs!
(setq fill-column 80)                 ; M-q should fill at 80 chars, not 75
(setq kill-ring-max 100)              ; kill ring size
(setq x-select-enable-clipboard t)
(setq select-active-regions t) 
(setq save-interprogram-paste-before-kill 1) 
(setq yank-pop-change-selection t)
