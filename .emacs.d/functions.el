;; clear eshell buffer
(defun eshell-clear-buffer ()
  "Clear terminal"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))
(add-hook 'eshell-mode-hook
	  '(lambda()
	     (local-set-key (kbd "C-l") 'eshell-clear-buffer)))


;; set window width
(defun set-window-width (n)
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t)
  )

(defun set-n-columns (cols)
  "Set the selected window to be n columns wide"
  (interactive "nEnter number of columns: ")
  (set-window-width cols)
)

;; set window height
(defun set-window-height (n)
  (adjust-window-trailing-edge (selected-window) (- n (window-height)))
  )

(defun set-n-rows (rows)
  "Set the selected window to be n rows"
  (interactive "nEnter number of rows: ")
  (set-window-height rows)
  )


;; find the current major mode
(defun buffer-mode (buffer-or-string)
  "Returns the buffer's major mode"
  (message "%s" major-mode))
;;  (with-current-buffer buffer-or-string
;;    major-mode))

(defun getbmode ()
  (interactive)
  (buffer-mode (current-buffer)))

(defun my-setup-hl-line ()
  (hl-line-mode 1)
  (setq cursor-type nil))

;; move autosave files to /tmp instead
(setq backup-directory-alist
      `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" , temporary-file-directory)))



(add-hook 'dired-mode-hook 'my-setup-hl-line)
