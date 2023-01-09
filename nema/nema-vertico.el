;;; nema-vertico --- Better solution for incremental narrowing in Emacs.
;;; Commentary:
"Better solution for incremental narrowing in Emacs.

See also: https://github.com/minad/vertico"
;;; Code:
;;; -*- lexical-binding: t; -*-

(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-scroll-margin 0
        vertico-count 15
        vertico-resize t
        vertico-cycle t))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (setq savehist-file (expand-file-name ".cache/savehist" user-emacs-directory))
  (savehist-mode))

;; Add prompt indicator to `completing-read-multiple'.
;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
(defun nema--crm-indicator (args)
  (cons (format "[CRM%s] %s"
                (replace-regexp-in-string
                 "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                 crm-separator)
                (car args))
        (cdr args)))
(advice-add #'completing-read-multiple :filter-args #'nema--crm-indicator)

;; Do not allow the cursor in the minibuffer prompt
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; Emacs 28: Hide commands in M-x which do not work in the current mode.
;; Vertico commands are hidden in normal buffers.
(if (version<= "28" emacs-version)
    (setq read-extended-command-predicate
          #'command-completion-default-include-p))

;; Enable recursive minibuffers
(setq enable-recursive-minibuffers t)

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Annotations in minibuffer
(use-package marginalia
  :config
  (marginalia-mode t))

(provide 'nema-vertico)

;;; nema-vertico.el ends here
