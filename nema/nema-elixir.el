;;; nema-elixir --- Elixir mode
;;; Commentary:
"Elixir mode"
;;; Code:

(use-package elixir-mode
  :quelpa (elixir-mode :fetcher github :repo "elixir-editors/emacs-elixir"))

;; alchemist is dead, long live LSP!
(use-package mix
  :if nema-lsp
  :quelpa (mix.el :fetcher github :repo "ayrat555/mix.el" :files ("mix.el" "LICENSE"))
  :hook ((elixir-mode . mix-minor-mode)))

(use-package alchemist
  :if (not nema-lsp)
  ;; Since original repo is kinda deprecated
  :quelpa (alchemist :fetcher github :repo "dfischer/alchemist.el"))

(use-package inf-iex
  :hook (elixir-mode . inf-iex-minor-mode)
  :quelpa (inf-iex :fetcher github
                :repo "DogLooksGood/inf-iex"))

(provide 'nema-elixir)

;;; nema-elixir.el ends here
