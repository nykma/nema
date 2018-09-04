;;; nema-terminal --- Terminal config
;;; Commentary:
"Terminal Emulator"
;;; Code:

;; Extended Eshell
(use-package aweshell
  :quelpa (aweshell :fetcher github :repo "manateelazycat/aweshell")
  :config
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-dakrone))

(use-package multi-term
  :config
  (setq multi-term-program "/usr/bin/bash"))

(provide 'nema-terminal)

;;; nema-terminal.el ends here
