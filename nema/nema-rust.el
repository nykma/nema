;;; nema-rust --- Rust
;;; Commentary:
"Rust enhance tools."
;;; Code:

(use-package rust-mode)

(use-package toml-mode
  :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")

(if nema-use-lsp
    ;; Install:
    ;; rustup component add rls-preview rust-analysis rust-src
    (use-package lsp-rust
      :commands (lsp-rust-enable)
      :hook (rust-mode . lsp-rust-enable))
  ;; else
  (use-package racer
  :defer t
  :requires (rust-mode)
  :hook ((rust-mode . racer-mode)
         (racer-mode . eldoc-mode)))
  (use-package flycheck-rust
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
