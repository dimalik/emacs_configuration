;; erc related
(defun i-wanna-be-social ()
  "Connect to IM networks using bitlbee."
  (interactive)
  (erc :server "localhost" :port 6667 :nick "da"))

(defun bitlbee-identify ()
  (load-library "~/.passwords.gpg")
  (provide 'passwords)
  (when (and (string= "localhost" erc-session-server)
	     (string= "&bitlbee" (buffer-name)))
    (erc-message "PRIVMSG" (format "%s identify da secretpassword"
				   (erc-default-target)
				   djcb-bitlbee-password))))

(add-hook 'erc-join-hook 'bitlbee-identify)
