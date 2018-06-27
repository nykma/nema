;;; erc --- ERC configs
;;; Code:

(use-package erc
  :config
  (setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#wikipedia" "#archlinux")))

  (defun nema/erc/nykma ()
    "Connect to Freenode.net using identity: nykma"
    (interactive)
    (erc-ssl :server "chat.freenode.net" :port 6697
             :nick "nykma" :full-name "Nyk Ma" :password "P@55w0rD!")))

;;; erc.el ends here
