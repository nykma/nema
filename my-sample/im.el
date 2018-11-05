;;; nema-im --- Input method
;;; Commentary:
"Chinese input method configuration 中文输入法配置"
;;; Code:

(use-package pyim
  :defer t
  :config
  (use-package posframe) ;; 绘制选词框
  (use-package pyim-basedict ;; 词典
    :config (pyim-basedict-enable))
  (setq default-input-method "pyim"
        pyim-default-scheme 'ziranma-shuangpin  ;; 输入法方案。参考 `pyim-schemes' 变量
        pyim-page-length 7
        pyim-page-tooltip 'child-frame)
  :bind
  (("M-j" . pyim-convert-code-at-point)))

;; (provide 'nema-im)
;;; nema-im.el ends here
