;;; nema-java --- Java and JVM-based languages config
;;; Commentary:
"Java and JVM-based languages config"
;;; Code:

(use-package kotlin-mode)

(use-package groovy-mode)

(if nema-use-lsp
    (use-package lsp-java))

(provide 'nema-java)

;;; nema-java.el ends here
