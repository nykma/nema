;;; nema-elisp --- LISP enhance tools.
;;; Commentary:
"LISP enhance tools."
;;; Code:

;; Deprecated. Use smartparens instead.
;; (use-package paredit
;;   :delight
;;   :config
;;   ;; SEEALSO: https://www.emacswiki.org/emacs/ParEdit
;;   (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;;   (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;;   (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;;   (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;;   (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;;   (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;;   (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

(provide 'nema-elisp)

;;; nema-elisp.el ends here
