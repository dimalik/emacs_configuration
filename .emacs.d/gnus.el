;; gnus settings
(defun my-gnus-group-list-subscribed-groups ()
  "List all subscribed groups with or without un-read messages"
  (interactive)
  (gnus-group-list-all-groups 5)
  )

(add-hook 'gnus-group-mode-hook
	  ;; list lal the subscribed groups even they contain zero un-read messages
	  (lambda () (local-set-key "o" 'my-gnus-group-list-subscribed-groups))
	  )



(add-hook 'gnus-summary-mode-hook 'my-setup-hl-line)
(add-hook 'gnus-group-mode-hook 'my-setup-hl-line)
