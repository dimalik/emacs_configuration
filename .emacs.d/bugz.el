(setq bugz-db-base "http://127.0.0.1/bugzilla/xmlrpc.cgi") ; this should normally be unchanged
(setq bugz-db-user "<your user>")
(setq bugz-db-dir "~/bugs/")

(add-to-list 'auto-mode-alist
	     (cons "\\.bugz$" 'bugz-mode))
