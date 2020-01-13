(use-package telega
  :hook ((telega-chat-mode . telega-url-shorten-mode))
  :config
  (setq
   telega-directory (expand-file-name ".cache/telega" user-emacs-directory)
   telega-video-play-inline t)
  (telega-mode-line-mode 1)
  (telega-notifications-mode 1))
