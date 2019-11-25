;;; nema-java --- Java and JVM-based languages config
;;; Commentary:
"Java and JVM-based languages config"
;;; Code:

(use-package kotlin-mode)

(use-package groovy-mode)

(use-package lsp-java
  :if nema-use-lsp)

(provide 'nema-java)

;;; nema-java.el ends here
