;;; nema-keymapping - All customized keymappings goes here

(global-set-key (kbd "C-c C-/") 'comment-line)
(global-set-key (kbd "C-x c r") 'nema/core/config-reload)
(global-set-key (kbd "C-x c f") 'nema/core/config-open-init-el)

;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; old M-x

(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; magit
(global-set-key (kbd "C-c g g") 'magit-status)
(global-set-key (kbd "C-c g p") 'magit-push)
(global-set-key (kbd "C-c g P") 'magit-pull)

(provide 'nema-keymapping)
;;; nema-keymapping.el ends here
