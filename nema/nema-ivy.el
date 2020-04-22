;;; nema-ivy --- Ivy configs
;;; Commentary:
"Ivy configs"
;;; Code:

;; ivy - Completion
;; SEEALSO: https://www.reddit.com/r/emacs/comments/6xc0im/ivy_counsel_swiper_company_helm_smex_and_evil/
(use-package ivy
  :delight
  :config
  (ivy-mode 1)
  (setq enable-recursive-minibuffers t
        ivy-use-virtual-buffers t
        ivy-display-style 'fancy
        ivy-format-function 'ivy-format-function-line
        ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy) ; Only counsel-M-x use flx fuzzy search
          (t . ivy--regex-plus))
        ivy-initial-inputs-alist nil)
  ;; Add C-o quick menu in ivy selection
  (use-package ivy-hydra)
  ;; swiper - show all overview of searches
  (use-package swiper
    :bind (("\C-s" . swiper)))
  ;; counsel - enhanced default common commands
  (use-package counsel
    :bind (("M-x" . counsel-M-x)
	   ("C-x C-f" . counsel-find-file)))
  ;; prescient.el: simple but effective sorting and filtering for Emacs.
  (use-package prescient
    :config
    (setq prescient-save-file (expand-file-name ".cache/prescient" user-emacs-directory))
    ;; To cause your usage statistics to be saved between Emacs sessions
    (prescient-persist-mode t))
  (use-package ivy-prescient
    :config
    (ivy-prescient-mode t)))

(provide 'nema-ivy)
;;; nema-ivy.el ends here
