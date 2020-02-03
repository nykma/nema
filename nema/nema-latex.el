;;; nema-latex --- LaTeX
;;; Commentary:
"LaTeX enhance tools."
;;; Code:

(use-package tex
  :ensure auctex
  :config
  (setq TeX-command-list
      '(("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
         (plain-tex-mode ams-tex-mode texinfo-mode)
         :help "Run plain TeX")
        ("LaTeX" "xelatex -interaction nonstopmode %t" TeX-run-TeX nil
         (latex-mode doctex-mode)
         :help "Run LaTeX"))
      TeX-auto-save t))

(if nema-use-lsp
    (progn
      (setq lsp-clients-digestif-executable (expand-file-name "~/.luarocks/bin/digestif"))
      (add-hook 'plain-tex-mode-hook #'lsp)
      (add-hook 'latex-mode-hook #'lsp))
  ;; else
  (use-package company-auctex))

(provide 'nema-latex)

;;; nema-latex.el ends here
