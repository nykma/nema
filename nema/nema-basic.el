;;; nema-basic --- Must-have plugins and configs
;;; Code:

;; smex
;; (package-install 'smex)
;; (smex-initialize)

;; ivy - Completion
(package-install 'ivy)
(ivy-mode t)

(setq enable-recursive-minibuffers t)

;; swiper - show all overview of searches
(package-install 'swiper)

;; counsel - enhanced default common commands
(package-install 'counsel)

;; which-key
(package-install 'which-key)
(which-key-mode)
(which-key-setup-side-window-right-bottom)

;; mwim - better default behavior
(package-install 'mwim)

(provide 'nema-basic)
;;; nema-basic.el ends here
