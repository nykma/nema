;;; nema-latex --- LaTeX
;;; Commentary:
"LaTeX enhance tools."
;;; Code:

(use-package tex
  :defer t
  :init (progn
	  (setq TeX-auto-save t
		TeX-parse-self t
		TeX-syntactic-comment t
		;; Synctex support
		TeX-source-correlate-start-server nil
		;; Don't insert line-break at inline math
		)
	  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
	  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
	  (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)))

(use-package company-auctex :ensure t)

(provide 'nema-latex)

;;; nema-latex.el ends here
