;;; ox-hugo --- Org exports to Hugo-compatible markdowns
;;; Commentary:
"Org exports to Hugo-compatible markdowns"
;;; Code:


(use-package ox-hugo
  :after (ox)
  :config
  (setq org-hugo-auto-set-lastmod t
        org-hugo-use-code-for-kbd t))

;;; ox-hugo.el ends here
