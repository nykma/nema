;;; nema-ocaml --- OCaml language support
;;; Commentary:
"OCaml language support"
;;; Code:

(use-package tuareg
  :hook ((tuareg . (lambda()
                     (when (functionp 'prettify-symbols-mode)
                       (prettify-symbols-mode))))))

(provide 'nema-ocaml)

;;; nema-ocaml.el ends here
