;;; nema-basic --- Must-have plugins and configs
;;; Code:

;; smex
;; (package-install 'smex)
;; (smex-initialize)

;; ivy - Completion
;; SEEALSO: https://www.reddit.com/r/emacs/comments/6xc0im/ivy_counsel_swiper_company_helm_smex_and_evil/
(use-package ivy
  :diminish (ivy-mode . "")
  :config
  (ivy-mode t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (setq ivy-format-function 'ivy-format-function-line)
  ;; TODO testing out the fuzzy search
  (setq ivy-re-builders-alist
      '((counsel-M-x . ivy--regex-fuzzy) ; Only counsel-M-x use flx fuzzy search
        (t . ivy--regex-plus)))
  (setq ivy-initial-inputs-alist nil)
  )

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
