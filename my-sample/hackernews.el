(use-package hnreader
  :commands (hnreader-news
             hnreader-past
             hnreader-ask
             hnreader-show
             hnreader-newest
             hnreader-more
             hnreader-back
             hnreader-comment
             hnreader-org-insert-hn-link)
  :config
  (setq org-confirm-elisp-link-function nil))
