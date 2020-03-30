;;; nema-java --- Java and JVM-based languages config
;;; Commentary:
"Java and JVM-based languages config"
;;; Code:

(use-package kotlin-mode)

(use-package groovy-mode)

(use-package lsp-java
  :if (eq nema-lsp 'lsp-mode))

(provide 'nema-java)

;;; nema-java.el ends here
