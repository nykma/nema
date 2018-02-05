;;; nema-keymapping --- All customized keymappings goes here
;;; Commentary:
"All customized keymappings goes here"
;;; Code:

(global-set-key (kbd "C-c C-/") 'comment-line)
(global-set-key (kbd "C-x c r") 'nema/core/config-reload)
(global-set-key (kbd "C-x c f") 'nema/core/config-open-init-el)

(provide 'nema-keymapping)
;;; nema-keymapping.el ends here
