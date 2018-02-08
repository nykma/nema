;;; nema-latex --- LaTeX
;;; Commentary:
"LaTeX enhance tools."
;;; Code:

(use-package auctex
  :config
  (setq TeX-command-list
      '(("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
         (plain-tex-mode ams-tex-mode texinfo-mode)
         :help "Run plain TeX")
        ("LaTeX" "xelatex -interaction nonstopmode %t" TeX-run-TeX nil
         (latex-mode doctex-mode)
         :help "Run LaTeX"))))

(use-package company-auctex)

(provide 'nema-latex)

;;; nema-latex.el ends here
