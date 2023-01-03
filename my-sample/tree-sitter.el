;;; nema-tree-sitter --- Incremental parsing
;;; Commentary:
"Incremental parsing.  Emacs will have internal `treesit' support
since 29.1.  This script will automaticlly detect current emacs
version and choose internal impl if possible."
;;; Code:

(require 'nema-customize-group)

(if (and (featurep 'treesit)
         (treesit-available-p)
         (treesit-ready-p 'bash))
    ;; NOTICE: you should compile `libtree-sitter-*.so' (or `dll' or `dylib') by your own:
    ;; 1. git clone https://github.com/casouri/tree-sitter-module.git
    ;; 2. cd into it and run `./batch.sh'
    ;; 3. Copy every file under `dist/' to `~/.emacs.d/.cache/tree-sitter'.
    (progn
      (setq treesit-extra-load-path (list (expand-file-name ".cache/tree-sitter" user-emacs-directory)))
      (defvar nema--tree-sitter-major-mode-map
            '((sh-mode . bash-ts-mode)
              (c-mode . c-ts-mode)
              (c++-mode . c++-ts-mode)
              (csharp-mode . csharp-ts-mode)
              (cmake-mode . cmake-ts-mode)
              (css-mode . css-ts-mode)
              (dockerfile-mode . dockerfile-ts-mode)
              ;; (elixir-mode . elixir-ts-mode)
              ;; (glsl-mode . glsl-ts-mode)
              (go-mode . go-ts-mode)
              ;; (heex-mode . heex-ts-mode)
              ;; (html-mode . html-ts-mode)
              (java-mode . java-ts-mode)
              (javascript-mode . js-ts-mode)
              (js-json-mode . json-ts-mode)
              ;; (julia-mode . julia-ts-mode)
              ;; (makefile-gmake-mode . makefile-ts-mode)
              ;; (markdown-mode . markdown-ts-mode)
              ;; (org-mode . org-ts-mode)
              ;; (perl-mode . perl-ts-mode)
              (ruby-mode . ruby-ts-mode)
              (rust-mode . rust-ts-mode)
              ;; (sql-mode . sql-ts-mode)
              (conf-toml-mode . toml-ts-mode)
              (rjsx-mode . tsx-ts-mode)
              (typescript-mode . typescript-ts-mode)
              ;; (verilog-mode . verilog-ts-mode)
              ;; (vhdl-mode . vhdl-ts-mode)
              ;; (wgsl-mode . wgsl-ts-mode)
              (yaml-mode . yaml-ts-mode))
            "Mode mapping for all major modes that support `treesit'.")
      (dolist (modemap nema--tree-sitter-major-mode-map)
        (push modemap major-mode-remap-alist)
        (if nema-lsp
            (add-hook (intern (format "%s-hook" (cdr modemap))) #'lsp))))

  ;; else
  ;; tree-sitter-core
  (use-package tree-sitter
    :demand t)

  (use-package tree-sitter-langs
    :after tree-sitter
    :config
    (require 'tree-sitter-hl)
    (require 'tree-sitter-query)
    (global-tree-sitter-mode)
    (delight 'tree-sitter-mode nil 'tree-sitter)
    (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

    (add-to-list 'tree-sitter-major-mode-language-alist '(ng2-ts-mode . typescript)))

  (use-package tree-sitter-indent
    :after tree-sitter))


;;; tree-sitter.el ends here
