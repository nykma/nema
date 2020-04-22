;;; nema-selectrum --- Better solution for incremental narrowing in Emacs.
;;; Commentary:
"Better solution for incremental narrowing in Emacs.

See also: https://github.com/raxod502/selectrum"
;;; Code:

(use-package selectrum
  :config
  (selectrum-mode t))

;; to make sorting and filtering more intelligent
(use-package selectrum-prescient
  :config
  (setf prescient-save-file (expand-file-name ".cache/prescient" user-emacs-directory))
  (selectrum-prescient-mode t)
  (prescient-persist-mode t))

(provide 'nema-selectrum)

;;; nema-selectrum.el ends here
