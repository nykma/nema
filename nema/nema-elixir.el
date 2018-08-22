;;; nema-elixir --- Elixir mode
;;; Commentary:
"Elixir mode"
;;; Code:

(use-package elixir-mode)
(use-package alchemist)

(if nema-use-lsp
    ;; Follow instructions of
    ;; https://github.com/rodrigues/lsp-elixir
    (use-package lsp-elixir
      :quelpa (lsp-elixir :fetcher github :repo "rodrigues/lsp-elixir")
      :commands (lsp-elixir-enable)
      :hook ((elixir-mode . lsp-elixir-enable))))

(provide 'nema-elixir)

;;; nema-elixir.el ends here
