;;; nema-basic --- Must-have plugins and configs
;;; Code:

;; delight - Chage minor mode indicator in mode line
(use-package delight
  :ensure t
  :config
  (delight '((eldoc-mode nil "eldoc")
	     (auto-revert-mode nil "autorevert"))))

;; smex
;; (package-install 'smex)
;; (smex-initialize)

;; ivy - Completion
;; SEEALSO: https://www.reddit.com/r/emacs/comments/6xc0im/ivy_counsel_swiper_company_helm_smex_and_evil/
(use-package ivy
  :ensure t
  :delight
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
  (setq ivy-initial-inputs-alist nil))

;; swiper - show all overview of searches
(use-package swiper
  :ensure t)

;; counsel - enhanced default common commands
(use-package counsel
  :ensure t)

;; which-key
(use-package which-key
  :ensure t
  :delight
  :config
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

;; mwim - better default behavior
(use-package mwim
  :ensure t)

;; ace-jump-mode - cursor quick jump
(use-package ace-jump-mode
  :ensure t
  :bind (("C-." . ace-jump-mode)))

;; ace-window - Quickly switch windows
(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(provide 'nema-basic)
;;; nema-basic.el ends here
