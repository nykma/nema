;;; telega --- telegram client
;;; Commentary:
"telegram client"
;;; Code:

(use-package telega
  :hook ((telega-chat-mode . telega-url-shorten-mode))
  :init
  (setq
   telega-directory (expand-file-name ".cache/telega" user-emacs-directory)
   telega-video-play-inline t)
  :config
  (telega-mode-line-mode 1)
  (telega-notifications-mode 1)
  (add-hook 'telega-chat-mode-hook
            (lambda ()
              (company-mode -1))))

;;; telega.el ends here
