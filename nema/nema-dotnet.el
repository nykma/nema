;;; nema-dotnet --- Dotnet environment support
;;; Commentary:
"Dotnet environment support"
;;; Code:

;; https://github.com/emacs-csharp/csharp-mode
(use-package csharp-mode
  :mode "\\.cs\\'")

;; https://github.com/fsharp/emacs-fsharp-mode
(use-package fsharp-mode
  :mode (("\\.fs[iylx]?$" . fsharp-mode))
  :config
  (setq inferior-fsharp-program "/usr/bin/fsharpi --readline-"
        fsharp-compiler "/usr/bin/fsharpc"))

(provide 'nema-dotnet)
;;;nema-dotnet.el ends here
