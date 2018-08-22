;;; nema-basic --- Must-have plugins and configs
;;; Commentary:
"Must-have plugins and configs"
;;; Code:

;; quelpa - For those packages which are not in MELPA
(use-package quelpa
  :config
  (use-package quelpa-use-package)
  (setq quelpa-update-melpa-p nil)
  (quelpa-use-package-activate-advice))

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

(pcase nema-emacs-completion-engine
  ;; ivy - Completion
  ;; SEEALSO: https://www.reddit.com/r/emacs/comments/6xc0im/ivy_counsel_swiper_company_helm_smex_and_evil/
  ('ivy (use-package ivy
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
          (setq ivy-initial-inputs-alist nil)
          ;; Add C-o quick menu in ivy selection
          (use-package ivy-hydra)
          ;; swiper - show all overview of searches
          (use-package swiper
            :bind (("\C-s" . swiper)))
          ;; counsel - enhanced default common commands
          (use-package counsel
            :bind (("M-x" . counsel-M-x)
	           ("C-x C-f" . counsel-find-file)))))
  ;; Helm - Completion
  ('helm (use-package helm
           :delight
           :bind (("M-x" . helm-M-x)
                  ("C-x C-f" . helm-find-files))
           :config
           (require 'helm-config)
           (helm-mode 1))))

(use-package anzu
  ;; :bind (("C-M-%" . 'anzu-query-replace-at-cursor)

  :delight
  ;; :init
  ;; (global-anzu-mode +1)
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
;; (use-package ace-jump-mode
;;   :bind (("C-." . ace-jump-mode)))

;; avy - jump to char
(use-package avy
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-timer)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("C-c C-j" . avy-resume))
  :config
  (setq avy-background t
        avy-all-windows t
        avy-timeout-seconds 0.3))

;; ace-window - Quickly switch windows
(use-package ace-window
  :bind (("C-M-o" . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; multiple-cursors
(use-package multiple-cursors
  :bind (("C-S-c" . mc/edit-lines)
         ("C-M-<" . mc/skip-to-previous-like-this)
	 ("C->" . mc/mark-next-like-this-symbol)
         ("C-M->" . mc/skip-to-next-like-this)
	 ("C-<" . mc/mark-previous-like-this-symbol)
	 ("C-c C->" . mc/mark-all-symbols-like-this)))

(use-package editorconfig
  :delight
  :config
  (editorconfig-mode t))

;; tree style file manager
(use-package neotree
  :bind (("C-c C-p TAB" . neotree-toggle)))

;; Code folding
;; (use-package origami
;;   :bind (("<backtab>" . origami-recursively-toggle-node) ;; Shift + Tab
;;          ("<C-tab>" . origami-show-only-node) ;; Ctrl + Tab
;;          ("C-c TAB" . origami-open-all-nodes))
;;   :config
;;   (global-origami-mode))

;; Minor mode for Emacs that deals with parens pairs and tries to be smart about it.
;; (use-package smartparens
;;   :delight
;;   :config
;;   (smartparens-global-mode t))

(provide 'nema-basic)
;;; nema-basic.el ends here
