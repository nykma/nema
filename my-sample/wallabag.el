;; wallabag: self-hosted read-it-later

(use-package wallabag
  :quelpa (wallabag.el :fetcher github :repo "chenyanming/wallabag.el")
  :config
  (setq wallabag-host "my-wallabag.org")
  (setq wallabag-username "xx")
  (setq wallabag-password "xx")
  (setq wallabag-clientid "xx") ;; created with API clients management
  (setq wallabag-secret "xx") ;; created with API clients management
  ;; (setq wallabag-db-file "~/OneDrive/Org/wallabag.sqlite") ;; optional, default is saved to ~/.emacs.d/.cache/wallabag.sqlite
  ;; (run-with-timer 0 3540 'wallabag-request-token) ;; optional, auto refresh token, token should refresh every hour
  )
