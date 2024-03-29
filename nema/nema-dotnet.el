;;; nema-dotnet --- Dotnet environment support
;;; Commentary:
"Dotnet environment support"
;;; Code:

;; https://github.com/emacs-csharp/csharp-mode
(if (version< emacs-version "29")
    (use-package csharp-mode
      :mode "\\.cs\\'"))

;; https://github.com/fsharp/emacs-fsharp-mode
(use-package fsharp-mode
  :mode (("\\.fs[iylx]?$" . fsharp-mode))
  :config
  (setq inferior-fsharp-program "/usr/bin/fsharpi --readline-"
        fsharp-compiler "/usr/bin/fsharpc"))

;; razor / blazor in web mode

(add-to-list 'auto-mode-alist '("\\.cshtml?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.razor?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade?\\'" . web-mode))
(setq web-mode-engines-alist
	'(("razor"    . "\\.cshtml\\'")
	  ("blade"  . "\\.blade\\.")))

(provide 'nema-dotnet)
;;;nema-dotnet.el ends here
