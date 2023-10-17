;;; nema-nix --- Nix configuration file support
;;; Commentary:
"Nix configuration file support"
;;; Code:

(use-package nix-mode
  :mode "\\.nix\\'"
  :config
  (when nema-lsp
    (add-hook 'nix-mode-hook #'lsp-deferred)
    ;; (use-package lsp-nix
    ;;   :after (lsp-mode)
    ;;   :demand t
    ;;   :custom
    ;;   (lsp-nix-nil-formatter ["nixpkgs-fmt"]))
    ))

(use-package direnv
 :if (executable-find "direnv")
 :config
 (direnv-mode)
 (setq direnv-always-show-summary nil))

(provide 'nema-nix)
;;; nema-nix.el ends here
