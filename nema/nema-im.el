;;; nema-im --- Input method
;;; Commentary:
"Chinese input method configuration 中文测试测试"
;;; Code:

(use-package pyim
  :defer t
  :config
  (setq default-input-method "pyim")
  (use-package pyim-basedict
    :config (pyim-basedict-enable))
  (setq pyim-default-scheme 'quanpin)
  (setq pyim-page-length 9)
  (setq pyim-page-tooltip 'child-frame)
  :bind
  (("M-j" . pyim-convert-code-at-point)))

(provide 'nema-im)

;;; nema-im.el ends here
