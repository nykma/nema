;;; nema-basic --- Must-have plugins and configs
;;; Code:

;; delight - Chage minor mode indicator in mode line
(use-package delight
  :config
  (delight '((eldoc-mode nil "eldoc")
	     (auto-revert-mode nil "autorevert")
	     (emacs-lisp-mode "ELisp" :major)
	     (abbrev-mode "" "abbrev"))))

;; smex
;; (use-package smex
;;   :bind (("M-x" . smex)
;; 	 ("M-X" . smex-major-mode-commands)
;; 	 ("C-c C-c M-x") . execute-extended-command) ;; old M-x
;;   :config
;;   (smex-initialize))

;; ivy - Completion
;; SEEALSO: https://www.reddit.com/r/emacs/comments/6xc0im/ivy_counsel_swiper_company_helm_smex_and_evil/
(use-package ivy
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
  :bind (("\C-s" . swiper)))

;; counsel - enhanced default common commands
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  )

;; which-key
(use-package which-key
  :delight
  :config
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

;; mwim - better default behavior
(use-package mwim
  :bind (("C-a" . mwim-beginning-of-code-or-line)
	 ("C-e" . mwim-end-of-code-or-line)))

;; ace-jump-mode - cursor quick jump
(use-package ace-jump-mode
  :bind (("C-." . ace-jump-mode)))

;; ace-window - Quickly switch windows
(use-package ace-window
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; multiple-cursors
(use-package multiple-cursors
  :bind (("C-S-c" . mc/edit-lines)
	 ("C->" . mc/mark-next-like-this-symbol)
	 ("C-<" . mc/mark-previous-like-this-symbol)
	 ("C-c C->" . mc/mark-all-symbols-like-this)))

(provide 'nema-basic)
;;; nema-basic.el ends here
