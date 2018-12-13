;;; nema-fsharp --- F# mode
;;; Commentary:
"F# mode"
;;; Code:

(use-package fsharp-mode
  :mode (("\\.fs[iylx]?$" . fsharp-mode))
  :config
  (setq inferior-fsharp-program "/usr/bin/fsharpi --readline-"
        fsharp-compiler "/usr/bin/fsharpc"))

(provide 'nema-fsharp)

;;; nema-fsharp.el ends here
