;;; nema-rust --- Rust
;;; Commentary:
"Rust enhance tools."
;;; Code:

(require 'nema-customize-group)

(use-package rust-mode)
(use-package cargo)

;;https://github.com/brotzeit/rustic
;; (use-package rustic
;;   ;; :bind
;;   ;; (:map rustic-mode-map
;;   ;;       ("C-c C-f" . rustic-format-dwim))
;;   :config
;;   (setq rustic-lsp-server 'rust-analyzer
;;         rustic-format-trigger 'on-save))



;; conf-toml-mode is enough
;; (use-package toml-mode
;;   :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")

(use-package racer
  :if (not nema-lsp)
  :defer t
  :requires (rust-mode)
  :hook ((rust-mode . racer-mode)
         (racer-mode . eldoc-mode)))

(use-package flycheck-rust
  :if (and nema-use-flycheck (not nema-lsp))
  :requires (rust-mode flycheck)
  :hook (flycheck-mode . flycheck-rust-setup)
  ;; :config
  ;; (with-eval-after-load 'rust-mode
  ;;   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  )

;; (use-package cargo
;;   :requires (rust-mode))

(provide 'nema-rust)

;;; nema-rust.el ends here
