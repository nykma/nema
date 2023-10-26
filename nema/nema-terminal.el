;;; nema-terminal --- Terminal config
;;; Commentary:
"Terminal Emulator"
;;; Code:

(require 'nema-customize-group)

(if (and (executable-find "clang")
         (executable-find "libtool")
         (executable-find "make")
         (executable-find "cmake")
         (or (executable-find "gcc")
             (executable-find "clang"))
         (version<= "25.1" emacs-version)
         module-file-suffix)
    ;; Use a C/S term if build dependencies are satisfied.
    ;; https://github.com/akermu/emacs-libvterm
    (use-package vterm
      :custom
      (vterm-kill-buffer-on-exit t)
      :config
      (use-package with-editor
        :hook ((vterm-mode . with-editor-export-editor)))
      (setq nema-term #'vterm)
      (when nema-use-evil
        (add-hook 'vterm-mode-hook
	          (lambda ()
		    (setq-local evil-insert-state-cursor 'box)
		    (evil-insert-state)))
        (define-key vterm-mode-map [return]                      #'vterm-send-return)

        (setq vterm-keymap-exceptions nil)
        (evil-define-key 'insert vterm-mode-map (kbd "C-e")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-f")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-a")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-v")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-b")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-w")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-u")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-n")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-m")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-p")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-j")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-k")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-r")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-t")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-g")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-c")      #'vterm--self-insert)
        (evil-define-key 'insert vterm-mode-map (kbd "C-SPC")    #'vterm--self-insert)
        (evil-define-key 'normal vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
        (evil-define-key 'normal vterm-mode-map (kbd ",c")       #'multi-libvterm)
        (evil-define-key 'normal vterm-mode-map (kbd ",n")       #'multi-libvterm-next)
        (evil-define-key 'normal vterm-mode-map (kbd ",p")       #'multi-libvterm-prev)
        (evil-define-key 'normal vterm-mode-map (kbd "i")        #'evil-insert-resume)
        (evil-define-key 'normal vterm-mode-map (kbd "o")        #'evil-insert-resume)
        (evil-define-key 'normal vterm-mode-map (kbd "<return>") #'evil-insert-resume)))
  ;; Fallback: extended Eshell
  (use-package aweshell
    :quelpa (aweshell :fetcher github :repo "manateelazycat/aweshell")
    :config
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-dakrone
          nema-term #'aweshell-new))
  (use-package multi-term
    :config
    (setq multi-term-program "/usr/bin/bash")))

(global-set-key (kbd "M-i")
                (lambda ()
                  (interactive)
                  (call-interactively nema-term)))

(provide 'nema-terminal)

;;; nema-terminal.el ends here
