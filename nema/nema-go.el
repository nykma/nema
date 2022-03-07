;;; nema-go --- Go modules
;;; Commentary:
"Go modules"
;;; Code:

(use-package go-mode
  :config
  (bind-key (kbd "C-c C-f") #'gofmt 'go-mode-map))

(provide 'nema-go)

;;; nema-go.el ends here
