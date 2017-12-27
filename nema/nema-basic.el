;;; nema-basic --- Must-have plugins and configs
;;; Code:

;; smex
;; (package-install 'smex)
;; (smex-initialize)

;; ivy - Completion
(use-package ivy
  :config
  (ivy-mode t)
  (setq enable-recursive-minibuffers t))

;; swiper - show all overview of searches
(use-package swiper)

;; counsel - enhanced default common commands
(use-package counsel)

;; which-key
(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

;; mwim - better default behavior
(use-package mwim)

(provide 'nema-basic)
;;; nema-basic.el ends here
