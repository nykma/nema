;;; nema-basic --- Must-have plugins and configs
;;; Commentary:
"Must-have plugins and configs"
;;; Code:

(require 'nema-customize-group)

(if (boundp 'save-place-file)
    (setq save-place-file (expand-file-name ".cache/places" user-emacs-directory)))

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
  ('ivy (require 'nema-ivy))
  ;; Helm - Completion
  ('helm (require 'nema-helm))
  ('selectrum (require 'nema-selectrum))
  (_ (ido-mode 1)))

;; Interactive regex replacer
(use-package anzu
  ;; :bind (("C-M-%" . 'anzu-query-replace-at-cursor)
  :delight
  ;; :init
  ;; (global-anzu-mode +1)
  )

;; Interactive searcher aka Better C-s
(use-package ctrlf
  :config
  (ctrlf-mode t))

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

;; Code folding
;; (use-package origami
;;   :bind (("<backtab>" . origami-recursively-toggle-node) ;; Shift + Tab
;;          ("<C-tab>" . origami-show-only-node) ;; Ctrl + Tab
;;          ("C-c TAB" . origami-open-all-nodes))
;;   :config
;;   (global-origami-mode))

;; Minor mode for Emacs that deals with parens pairs and tries to be smart about it.
(use-package smartparens-config
  :ensure smartparens
  ;; https://ebzzry.io/en/emacs-pairs/#keys
  ;; :hook ((prog-mode markdown-mode org-mode) . turn-on-smartparens-strict-mode)
  :bind (:map smartparens-mode-map
              ("C-M-a" . sp-beginning-of-sexp)
              ("C-M-e" . sp-end-of-sexp)

              ("C-<down>" . sp-down-sexp)
              ("C-<up>"   . sp-up-sexp)
              ("M-<down>" . sp-backward-down-sexp)
              ("M-<up>"   . sp-backward-up-sexp)

              ("C-M-f" . sp-forward-sexp)
              ("C-M-b" . sp-backward-sexp)

              ("C-M-n" . sp-next-sexp)
              ("C-M-p" . sp-previous-sexp)

              ("C-S-f" . sp-forward-symbol)
              ("C-S-b" . sp-backward-symbol)

              ("C-<right>" . sp-forward-slurp-sexp)
              ("M-<right>" . sp-forward-barf-sexp)
              ("C-<left>"  . sp-backward-slurp-sexp)
              ("M-<left>"  . sp-backward-barf-sexp)

              ("C-M-t" . sp-transpose-sexp)
              ("C-M-k" . sp-kill-sexp)
              ("C-k"   . sp-kill-hybrid-sexp)
              ("M-k"   . sp-backward-kill-sexp)
              ("C-M-w" . sp-copy-sexp)
              ("C-M-d" . delete-sexp)

              ("M-<backspace>" . backward-kill-word)
              ("C-<backspace>" . sp-backward-kill-word)
              ([remap sp-backward-kill-word] . backward-kill-word)

              ("M-[" . sp-backward-unwrap-sexp)
              ("M-]" . sp-unwrap-sexp)

              ("C-x C-t" . sp-transpose-hybrid-sexp)

              ("C-c ("  . nema//wrap-with-parens)
              ("C-c ["  . nema//wrap-with-brackets)
              ("C-c {"  . nema//wrap-with-braces)
              ("C-c '"  . nema//wrap-with-single-quotes)
              ("C-c \"" . nema//wrap-with-double-quotes)
              ("C-c _"  . nema//wrap-with-underscores)
              ("C-c `"  . nema//wrap-with-back-quotes))
  :config
  (show-smartparens-global-mode t)
  (smartparens-strict-mode t)

  (defmacro nema//def-pairs (pairs)
    "Define functions for pairing. PAIRS is an alist of (NAME . STRING)
conses, where NAME is the function name that will be created and
STRING is a single-character string that marks the opening character.

  (def-pairs ((paren . \"(\")
              (bracket . \"[\"))

defines the functions WRAP-WITH-PAREN and WRAP-WITH-BRACKET,
respectively."
    `(progn
       ,@(loop for (key . val) in pairs
               collect
               `(defun ,(read (concat
                               "nema//wrap-with-"
                               (prin1-to-string key)
                               "s"))
                    (&optional arg)
                  (interactive "p")
                  (sp-wrap-with-pair ,val)))))

  (nema//def-pairs ((paren . "(")
                    (bracket . "[")
                    (brace . "{")
                    (single-quote . "'")
                    (double-quote . "\"")
                    (back-quote . "`"))))

;; Popup window manager
;; Seldom use it. Disabled.
;; (use-package popwin
;;   :delight
;;   :bind-keymap
;;   ("C-z" . popwin:keymap)
;;   :config
;;   (popwin-mode 1))

;; Better help page
(use-package helpful
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-c C-d" . helpful-at-point)
   ("C-h F" . helpful-function)
   ("C-h C" . helpful-command)))

;; Undo tree, why not
(use-package undo-tree
  :delight
  :config
  (setq undo-tree-visualizer-timestamps t
        undo-tree-visualizer-diff t)
  (global-undo-tree-mode))

;; Edit code comments using C-c ' , like org-mode
(use-package separedit
  :quelpa (separedit :fetcher github :repo "twlz0ne/separedit.el")
  :bind (:map prog-mode-map
              ("C-c '" . separedit))
  :config
  (setq separedit-default-mode 'markdown-mode))

;; Powerful ibuffer alternative
(use-package bufler
  :bind (("C-x C-b" . bufler)
         ("C-x b" . bufler-switch-buffer))
  :config
  ;; The global minor mode bufler-mode allows each frame to have a
  ;; “workspace”, which is a buffer group selected by the user.
  (bufler-mode)
  ;; The global minor mode bufler-tabs-mode uses the new Emacs 27
  ;; tab-bar and tab-line features to display workspaces and
  ;; buffers.
  ;; (if (version<= "27" emacs-version)
  ;;       (bufler-tabs-mode))

  ;; Manually delight
  (defun nema//bufler-workspace-delight ()
    "Advice for overwriting `bufler-workspace-mode-lighter'"
    "")
  (advice-add 'bufler-workspace-mode-lighter
              :override #'nema//bufler-workspace-delight))

;; Syntax checker - flymake (lasy version) or flycheck
(if nema-use-flycheck
    (use-package flycheck
      :delight
      :init
      (setq flycheck-emacs-lisp-load-path 'inherit)
      :config
      (global-flycheck-mode))
  (use-package lazyflymake
    :quelpa (lazyflymake :fetcher github :repo "redguardtoo/lazyflymake")
    :hook ((prog-mode . lazyflymake-start))))

(provide 'nema-basic)
;;; nema-basic.el ends here
