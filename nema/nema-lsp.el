;;; nema-lsp --- Language Server Protocol settings
;;; Commentary:
"Language Server Protocol settings"
;;; Code:

(require 'nema-customize-group)
(require 'company)
(require 'company-capf)

(pcase nema-lsp
  ('lsp-mode
   ;; Main
   (use-package lsp-mode
     ;; :delight
     :commands (lsp)
     :hook (((ruby-mode
              php-mode
              ;; python-mode ;; <- handled in nema-python.el
              js-mode typescript-mode js2-mode rjsx-mode vue-mode ng2-html-mode ng2-ts-mode
              go-mode
              rust-mode
              ;; c-mode c++-mode objc-mode ;; <- handled in nema-c.el
              ;; swift-mode ;; <- handled in nema-swift.el
              ;; dart-mode ;; <- handled in nema-dart.el
              elixir-mode
              java-mode
              tuareg-mode ;; OCaml
              ;; plain-tex-mode latex-mode ;; <- handled in nema-latex.el
              ) . lsp)
            (lsp-mode . lsp-enable-which-key-integration))
     :init
     (setq lsp-keymap-prefix "s-p"
           lsp-auto-configure t
           lsp-keep-workspace-alive nil
           lsp-auto-guess-root t
           lsp-response-timeout 20
           lsp-session-file (expand-file-name ".cache/lsp-sessions" user-emacs-directory)
           lsp-intelephense-storage-path (expand-file-name ".cache/lsp/intelephense" user-emacs-directory))
     :config
     (require 'lsp-clients)
     (use-package lsp-java)
     ;; Add some extra dirs to ignore
     (dolist (dir '("[/\\\\]builddir$"
                    "[/\\\\]\\.elixir_ls$"
                    "[/\\\\]_build$"
                    "[/\\\\]\\.ccls-cache$"
                    "[/\\\\]deps$"
                    "[/\\\\]\\.log$"
                    "[/\\\\]vendor$"))
       (push dir lsp-file-watch-ignored)))

   ;; Display LSP output
   (use-package lsp-ui
     :after (lsp-mode)
     :commands (lsp-ui-mode)
     :bind
     (:map lsp-ui-mode-map
           ([remap xref-find-references] . lsp-ui-peek-find-references)
           ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
           ("C-c u" . lsp-ui-imenu))
     :hook (lsp-mode . lsp-ui-mode)
     :init
     ;; WORKAROUND
     ;; See: https://github.com/syl20bnr/spacemacs/issues/13355
     (setq lsp-ui-doc--buffer-prefix "*lsp-ui-doc-"
           lsp-ui-doc-winum-ignore t)
     :config
     (setq scroll-margin 0))

   ;; Debugger
   ;; See https://github.com/yyoncho/dap-mode for usage
   (use-package dap-mode
     :after (lsp-mode)
     :hook ((lsp-mode . dap-mode)
            (lsp-mode . dap-ui-mode))
     :config
     (require 'dap-gdb-lldb)
     (setq dap-breakpoints-file (expand-file-name ".cache/dap-breakpoints" user-emacs-directory)))

   ;; LSP as completion backend
   ;; Deprecated: now suggest using company-capf
   ;; (use-package company-lsp
   ;;   :after (lsp-mode company)
   ;;   :commands (company-lsp))
   (add-to-list 'company-backends 'company-capf)


   ;; Treemacs support
   (use-package lsp-treemacs
     :if (fboundp 'treemacs)
     :commands (lsp-treemacs-error-list))

   ;; Helm intergration
   (use-package helm-lsp
     :if (eq nema-emacs-completion-engine 'helm)
     :commands (helm-lsp-workspace-symbol))

   ;; ivy intergration
   (use-package lsp-ivy
     :if (eq nema-emacs-completion-engine 'ivy)
     :commands (lsp-ivy-workspace-symbol)))

  ;; nox - a very-lightweight LSP client forked from eglot
  ;; Seealso: https://github.com/manateelazycat/nox
  ('nox
   (use-package nox
     :quelpa (nox
              :fetcher github
              :repo "manateelazycat/nox"
              :files ("jsonrpc.el" "nox.el"))
     :hook (((js-mode
              rust-mode
              python-mode
              ruby-mode
              java-mode
              sh-mode
              php-mode
              c-mode-common
              c-mode
              c++-mode
              haskell-mode
              dart-mode
              elixir-mode
              latex-mode
              json-mode
              ) . nox-ensure))
     :config
     (add-to-list 'nox-server-programs
                  `(elixir-mode . (,(expand-file-name "~/.elixir-ls-server/language_server.sh"))))
     (add-to-list 'nox-server-programs
                  '(php-mode . ("intelephense" "--stdio"))))))

(provide 'nema-lsp)

;;; nema-lsp.el ends here
