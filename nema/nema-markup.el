;;; nema-markup --- Markup languages support
;;; Commentary:
"Markup languages support"
;;; Code:

(use-package yaml-mode
  :bind ((:map yaml-mode-map
               ("\C-m" . newline-and-indent)
               ("C-c C-v" . nema/base64-encode-region-nowrap)
               ("C-c C-c" . base64-decode-region)))
  :init
  (defun nema/base64-encode-region-nowrap ()
    "Encode region into base64 with no linewrap.
Useful when editing Kubernetes Secrets."
    (interactive)
    (base64-encode-region (point) (mark) t)))

(use-package csv-mode)

(provide 'nema-markup)

;;; nema-markup.el ends here
