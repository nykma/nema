;;; nema-c --- C & C++ layer
;;; Commentary:
"C & C++ layer"
;;; Code:

;; (use-package cc-mode)

(if nema-use-lsp
    ;; Install: brew install cquery or see https://github.com/cquery-project/cquery/releases
    (use-package cquery
      :defines projectile-project-root-files-top-down-recurring
      :commands lsp-cquery-enable
      :hook ((cc-mode c++-mode objc-mode) . lsp-cquery-enable)
      :config
      (with-eval-after-load 'projectile
        (setq projectile-project-root-files-top-down-recurring
              (append '("compile_commands.json"
                        ".cquery")
                      projectile-project-root-files-top-down-recurring))))

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

(provide 'nema-c)

;;; nema-c.el ends here
