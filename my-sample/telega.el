;;; telega --- telegram client
;;; Commentary:
"telegram client"
;;; Code:

(use-package telega
  :commands (telega)
  :hook ((telega-chat-mode . (lambda ()
                (set (make-local-variable 'company-backends)
                (append '(telega-company-emoji
                    telega-company-username
                    telega-company-hashtag)
                  (when (telega-chat-bot-p telega-chatbuf--chat)
                    '(telega-company-botcmd))))
                 (company-mode 1))))

  :init
  (setq telega-directory (expand-file-name ".cache/telega" user-emacs-directory)
        telega-chat-input-markups '("markdown2" nil))

  :config
  (telega-mode-line-mode 1)
  (telega-notifications-mode 1))

;;; telega.el ends here
