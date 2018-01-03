;;; nema-rust --- Rust
;;; Commentary:
"Rust enhance tools."
;;; Code:

(use-package rust-mode
  :ensure t)
(use-package toml-mode
  :ensure t
  :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")
(use-package racer
  :ensure t
  :init (progn
	  (add-hook 'rust-mode-hook '(racer-mode))
	  ))
(use-package cargo
  :ensure t)
(use-package flycheck-rust
  :ensure t
  :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'nema-rust)

;;; nema-rust.el ends here
