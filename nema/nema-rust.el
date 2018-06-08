;;; nema-rust --- Rust
;;; Commentary:
"Rust enhance tools."
;;; Code:

(use-package rust-mode)

(use-package toml-mode
  :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")

(use-package racer
  :defer t
  :requires (rust-mode)
  :hook ((rust-mode . racer-mode)
         (racer-mode . eldoc-mode)))

(use-package cargo
  :requires (rust-mode))

(use-package flycheck-rust
  :requires (rust-mode flycheck)
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'nema-rust)

;;; nema-rust.el ends here
