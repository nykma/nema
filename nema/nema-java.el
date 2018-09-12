;;; nema-java --- Java and JVM-based languages config
;;; Commentary:
"Java and JVM-based languages config"
;;; Code:

(use-package kotlin-mode)

(use-package groovy-mode)

(if nema-use-lsp
    ;; wget http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
    ;; tar -xf jdt-language-server-latest.tar.gz -C ~/.emacs.d/eclipse.jdt.ls/server/
    (use-package lsp-java
      :commands (lsp-java-enable)
      :hook (java-mode . lsp-java-enable)))

(provide 'nema-java)

;;; nema-java.el ends here
