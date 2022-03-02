;;; nema-tree-sitter --- Incremental parsing
;;; Commentary:
"Incremental parsing"
;;; Code:

(defvar nema--tree-sitter-grammatical-edit-lang-hooks
  '(
    c-mode-common-hook
    c-mode-hook
    c++-mode-hook
    java-mode-hook
    haskell-mode-hook
    tuareg-mode-hook
    ;; maxima-mode-hook
    ielm-mode-hook
    sh-mode-hook
    ;; makefile-gmake-mode-hook
    php-mode-hook
    python-mode-hook
    js-mode-hook
    go-mode-hook
    qml-mode-hook
    jade-mode-hook
    css-mode-hook
    ruby-mode-hook
    coffee-mode-hook
    rust-mode-hook
    ;; qmake-mode-hook
    lua-mode-hook
    swift-mode-hook
    elixir-mode-hook

    ;; SEE ALSO: https://emacs-china.org/t/tree-sitter/19014
    emacs-lisp-mode-hook
    lisp-interaction-mode-hook
    lisp-mode-hook
    minibuffer-inactive-mode-hook)
  "All language mode hooks to use tree-sitter grammatical-edit (instead of puni-mode).")

;; tree-sitter-core
(use-package tree-sitter
  :demand t)

(defun nema//tree-sitter-install-elisp ()
  "Install elisp.so in tree-sitter-lang dir"
  (when (and (executable-find "gcc")
             (executable-find "git"))
    (let* ((buffer (generate-new-buffer (format "*tree-sitter-elisp-install*")))
           (tmpdir (make-temp-file "tree-sitter-elisp-" t))
           (source-file (expand-file-name "./src/parser.c" tmpdir))
           (target-so (expand-file-name "./bin/elisp.so" tree-sitter-langs--dir))
           (clone '(call-process-shell-command
                    (s-join " " `("git" "clone" "https://github.com/Wilfred/tree-sitter-elisp" ,tmpdir))
                    nil
                    buffer))
           (build '(call-process-shell-command
                    (s-join " " `("gcc" ,source-file "-fPIC" ,(s-join "" `("-I" ,tmpdir "/")) "--shared" "-o" ,target-so))
                    nil
                    buffer))
           (clean '(call-process-shell-command
                    (s-join " " `("rm" "-rf" ,tmpdir))
                    nil
                    buffer)))
      (if (file-exists-p target-so)
          (message "ELisp tree-sitter support already installed.")
        (switch-to-buffer-other-window buffer)
        (if (= 0 (eval clone))
            (if (= 0 (eval build))
                (if (= 0 (eval clean))
                    (progn (message "ELisp tree-sitter: installed successfully.")
                           (kill-buffer buffer))
                  (message "ELisp tree-sitter: Error when cleaning tmpdir."))
              (message "ELisp tree-sitter: build failed."))
          (message "ELisp tree-sitter: clone failed"))))))

(use-package tree-sitter-langs
  :after tree-sitter
  :config
  (require 'tree-sitter-hl)
  (require 'tree-sitter-query)
  (global-tree-sitter-mode)
  (delight 'tree-sitter-mode nil 'tree-sitter)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

  (add-to-list 'tree-sitter-major-mode-language-alist '(ng2-ts-mode . typescript))

  (nema//tree-sitter-install-elisp)
  (dolist (target-mode '(emacs-lisp-mode lisp-interaction-mode lisp-mode minibuffer-inactive-mode))
    (add-to-list 'tree-sitter-major-mode-language-alist `(,target-mode . elisp))))

(use-package tree-sitter-indent
  :after tree-sitter)

;; Structure editing based on tree-sitter
;; (use-package grammatical-edit
;;   :quelpa (grammatical-edit :fetcher github :repo "manateelazycat/grammatical-edit")
;;   :demand t
;;   :bind ((:map grammatical-edit-mode-map
;;                ("(" . grammatical-edit-open-round)
;;                ("[" . grammatical-edit-open-bracket)
;;                ("{" . grammatical-edit-open-curly)
;;                (")" . grammatical-edit-close-round)
;;                ("]" . grammatical-edit-close-bracket)
;;                ("}" . grammatical-edit-close-curly)
;;                ("=" . grammatical-edit-equal)

;;                ("%" . grammatical-edit-match-paren)
;;                ("\"" . grammatical-edit-double-quote)

;;                ("SPC" . grammatical-edit-space)
;;                ("RET" . grammatical-edit-newline)

;;                ("M-o" . grammatical-edit-backward-delete)
;;                ("C-d" . grammatical-edit-forward-delete)
;;                ("C-k" . grammatical-edit-kill)

;;                ("M-\"" . grammatical-edit-wrap-double-quote)
;;                ("M-[" . grammatical-edit-wrap-bracket)
;;                ("M-{" . grammatical-edit-wrap-curly)
;;                ("M-(" . grammatical-edit-wrap-round)
;;                ("M-)" . grammatical-edit-unwrap)

;;                ("M-p" . grammatical-edit-jump-right)
;;                ("M-n" . grammatical-edit-jump-left)
;;                ("M-:" . grammatical-edit-jump-out-pair-and-newline)))
;;   :config
;;   (dolist (hook nema--tree-sitter-grammatical-edit-lang-hooks)
;;     (add-hook hook #'(lambda ()
;;                       (puni-disable-puni-mode)
;;                       (grammatical-edit-mode 1)))))


;;; tree-sitter.el ends here
