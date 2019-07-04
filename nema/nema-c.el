;;; nema-c --- C & C++ layer
;;; Commentary:
"C & C++ layer"
;;; Code:

;; (use-package cc-mode)

(if nema-use-lsp
    (use-package ccls
      :hook ((c-mode c++-mode objc-mode) . (lambda () (require 'ccls) (lsp)))
      :config (setq ccls-executable "/usr/bin/ccls"))
  ;; else
  ;; https://github.com/Andersbakken/rtags
  (use-package rtags)
  (if (fboundp 'company-mode)
    (use-package company-rtags))
  (pcase nema-emacs-completion-engine
    ('ivy (use-package ivy-rtags))))


(use-package cc-mode)
;; (use-package semantic
;;   :config
;;   (global-semantic-idle-scheduler-mode))

;; cmake
(use-package cmake-mode)

(provide 'nema-c)

;;; nema-c.el ends here
