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
              yaml-mode
              csharp-mode
              conf-toml-mode
              ) . lsp)
            (lsp-mode . lsp-enable-which-key-integration))
     :init
     (setq lsp-keymap-prefix "s-p"
           lsp-auto-configure t
           lsp-keep-workspace-alive nil
           lsp-auto-guess-root t
           lsp-response-timeout 20
           lsp-idle-delay 0.500
           lsp-session-file (expand-file-name ".cache/lsp-sessions" user-emacs-directory)
           lsp-eslint-library-choices-file (expand-file-name ".cache/lsp-eslint-choices" user-emacs-directory))
     :config
     ;; force lsp-mode to forget the workspace folders for multi root
     ;; servers so the workspace folders are added on demand
     ;; https://emacs-lsp.github.io/lsp-mode/page/faq/#how-do-i-force-lsp-mode-to-forget-the-workspace-folders-for-multi-root
     (advice-add 'lsp :before (lambda (&rest _args) (eval '(setf (lsp-session-server-id->folders (lsp-session)) (ht)))))

     (use-package lsp-java)

     ;; Add some extra dirs to ignore
     (dolist (dir '("[/\\\\]builddir$"
                    "[/\\\\]\\.elixir_ls$"
                    "[/\\\\]_build$"
                    "[/\\\\]\\.ccls-cache$"
                    "[/\\\\]deps$"
                    "[/\\\\]\\.log$"
                    "[/\\\\]vendor$"))
       (push dir lsp-file-watch-ignored-directories)))

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
           lsp-ui-doc-winum-ignore t
           ;; https://github.com/emacs-lsp/lsp-mode/blob/master/docs/tutorials/how-to-turn-off.md
           lsp-enable-symbol-highlighting t

           lsp-ui-doc-enable t
           lsp-ui-doc-position 'top
           lsp-ui-doc-alignment 'frame
           lsp-ui-doc-show-with-cursor t
           lsp-ui-doc-text-scale-level -3

           lsp-lens-enable t

           lsp-headerline-breadcrumb-enable nil

           lsp-ui-sideline-enable nil
           ;; lsp-ui-sideline-show-hover nil
           ;; lsp-ui-sideline-show-code-actions t
           ;; lsp-ui-sideline-show-diagnostics t
           lsp-ui-sideline-show-code-actions nil

           lsp-modeline-code-actions-enable t

           lsp-signature-render-documentation nil)
     :config
     (setq scroll-margin 0)
     (delight 'lsp-lens-mode nil 'lsp-lens))

   ;; Debugger
   ;; See https://github.com/yyoncho/dap-mode for usage
   (use-package dap-mode
     :after (lsp-mode)
     :hook ((lsp-mode . dap-mode)
            (lsp-mode . dap-ui-mode))
     :config
     (setq dap-breakpoints-file (expand-file-name ".cache/dap-breakpoints" user-emacs-directory)
           dap-utils-extension-path (expand-file-name ".cache/dap-extension" user-emacs-directory))
     (require 'dap-gdb-lldb)
     (require 'dap-go)
     (setq dap-breakpoints-file (expand-file-name ".cache/dap-breakpoints" user-emacs-directory))
     (require 'dap-cpptools)
     (add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))
     (dap-register-debug-template "Rust::GDB Run Configuration"
                                  (list :type "gdb"
                                        :request "launch"
                                        :name "GDB::Run"
                                        :gdbpath "rust-gdb"
                                        :target nil
                                        :cwd nil)))
   ;; LSP as completion backend
   ;; Deprecated: now suggest using company-capf
   ;; (use-package company-lsp
   ;;   :after (lsp-mode company)
   ;;   :commands (company-lsp))

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
     :commands (lsp-ivy-workspace-symbol))))

(provide 'nema-lsp)

;;; nema-lsp.el ends here
