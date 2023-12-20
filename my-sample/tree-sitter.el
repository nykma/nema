;;; nema-tree-sitter --- Incremental parsing
;;; Commentary:
"Incremental parsing.  Emacs will have internal `treesit' support
since 29.1.  This script will automaticlly detect current emacs
version and choose internal impl if possible."
;;; Code:

(require 'nema-customize-group)

(if (and (featurep 'treesit)
         (treesit-available-p))
    ;; NOTICE: you should compile `libtree-sitter-*.so' (or `dll' or `dylib') by your own:
    ;; 1. git clone https://github.com/casouri/tree-sitter-module.git
    ;; 2. cd into it and run `./batch.sh'
    ;; 3. Copy every file under `dist/' to `~/.emacs.d/.cache/tree-sitter'.
    (progn
      (setq treesit-font-lock-level 4
            treesit-extra-load-path (list (expand-file-name ".cache/tree-sitter" user-emacs-directory)))
      ;; auto download and compile .so modules
      (use-package treesit-auto
        :config
        (setq treesit-auto-install t)
        (treesit-auto-add-to-auto-mode-alist 'all)
        (global-treesit-auto-mode)

        ;; Add LSP and combobulate support for each of `-ts-mode' hooks.
        (when (eq nema-lsp 'lsp-mode)
          (defun treesit-auto-copy-all-lsp-languages ()
	    (cl-loop for recipe in treesit-auto-recipe-list
		     do (treesit-auto-copy-lsp-language
			 (treesit-auto-recipe-remap recipe)
			 (treesit-auto-recipe-ts-mode recipe))))
	  (defun treesit-auto-copy-lsp-language (from to)
	    (let ((from-value (alist-get from lsp-language-id-configuration)))
	      (when from-value
		(add-to-list 'lsp-language-id-configuration `(,to . ,from-value))
		from-value)))
          (treesit-auto-copy-all-lsp-languages)

          (let* ((tree-sitter-modes (cl-loop for recipe in treesit-auto-recipe-list
                                             collect (treesit-auto-recipe-ts-mode recipe)))
                 (tree-sitter-mode-hooks (cl-loop for mode in tree-sitter-modes
                                                  collect (intern (format "%s-hook" mode)))))
            ;; Iter each hooks in `tree-sitter-mode-hooks' and add `lsp' to it.
            (dolist (hook tree-sitter-mode-hooks)
              (add-hook hook #'lsp)
              (add-hook hook #'combobulate-mode)))))
      ;; Structure editing
      (use-package combobulate
        :quelpa (combobulate :fetcher github :repo "mickeynp/combobulate")))

  ;; else: treesit is not internal function of Emacs - use tree-sitter.el
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
