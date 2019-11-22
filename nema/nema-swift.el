;;; nema-swift --- Emacs Swift support
;;; Commentary:
"Emacs Swift support"
;;; Code:

(use-package swift-mode)

;; Document
(use-package swift-helpful
  :quelpa (swift-helpful :fetcher github :repo "danielmartin/swift-helpful" :files ("*.el" "swift-info/*.info")))

(if nema-use-lsp
    ;; See installation guide in https://github.com/emacs-lsp/lsp-sourcekit
    (use-package lsp-sourcekit
      :after lsp-mode
      :hook (swift-mode . lsp)
      :config
      ;; (setenv "SOURCEKIT_TOOLCHAIN_PATH" "/Library/Developer/Toolchains/swift-latest.xctoolchain")
      ;; (setq lsp-sourcekit-executable (expand-file-name "/usr/local/bin/sourcekit-lsp"))
      ))

(provide 'nema-swift)

;;; nema-swift.el ends here
