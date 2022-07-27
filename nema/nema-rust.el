;;; nema-rust --- Rust
;;; Commentary:
"Rust enhance tools."
;;; Code:

(require 'nema-customize-group)

(use-package rustic
  :config
  (setq rustic-lsp-server 'rust-analyzer))

;; conf-toml-mode is enough
;; (use-package toml-mode
;;   :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")

(unless nema-lsp
  (use-package racer
    :defer t
    :requires (rust-mode)
    :hook ((rust-mode . racer-mode)
           (racer-mode . eldoc-mode)))
  (use-package flycheck-rust
    :if nema-use-flycheck
    :requires (rust-mode flycheck)
    :hook (flycheck-mode . flycheck-rust-setup)
  ;; :config
  ;; (with-eval-after-load 'rust-mode
  ;;   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  ))


(use-package cargo
  :requires (rust-mode))

(provide 'nema-rust)

;;; nema-rust.el ends here
