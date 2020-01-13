(use-package telega
  :hook ((telega-chat-mode . telega-url-shorten-mode))
  :pin melpa-stable
  :init
  (setq
   telega-directory (expand-file-name ".cache/telega" user-emacs-directory)
   telega-video-play-inline t)
  :config
  (telega-mode-line-mode 1)
  (telega-notifications-mode 1))
