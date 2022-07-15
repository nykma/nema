;;; nema-go --- Go modules
;;; Commentary:
"Go modules"
;;; Code:

(use-package go-mode
  :defer nil
  :bind (:map go-mode-map
              ("C-c C-f" . gofmt)))

(provide 'nema-go)

;;; nema-go.el ends here
