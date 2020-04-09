;;; telega --- telegram client
;;; Commentary:
"telegram client"
;;; Code:

(use-package telega
  :commands (telega)
  :hook ((telega-load . global-telega-squash-message-mode)
  ;;       (telega-load . global-telega-url-shorten-mode) ;; 20200408: will cause recursive load
       (telega-chat-mode . (lambda ()
                 (set (make-local-variable 'company-backends)
                (append '(telega-company-emoji
                    telega-company-username
                    telega-company-hashtag)
                  (when (telega-chat-bot-p telega-chatbuf--chat)
                    '(telega-company-botcmd))))
                 (company-mode 1))))

  :init
  (setq telega-directory (expand-file-name ".cache/telega" user-emacs-directory)
        telega-chat-use-markdown-version 2)

  :config
  (telega-mode-line-mode 1)
  (telega-notifications-mode 1))

;;; telega.el ends here
