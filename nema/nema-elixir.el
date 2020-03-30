;;; nema-elixir --- Elixir mode
;;; Commentary:
"Elixir mode"
;;; Code:

(use-package elixir-mode
  :quelpa (elixir-mode :fetcher github :repo "elixir-editors/emacs-elixir"))

(use-package alchemist
  ;; Since original repo is kinda deprecated
  :quelpa (alchemist :fetcher github :repo "dfischer/alchemist.el")
  :bind (:map alchemist-mode-map
              ([remap alchemist-goto-definition-at-point] . lsp-ui-peek-find-definitions)))

(provide 'nema-elixir)

;;; nema-elixir.el ends here
