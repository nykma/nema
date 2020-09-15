;;; nema-im --- Input method
;;; Commentary:
"Chinese input method configuration 中文输入法配置

搭配环境变量 LC_CTYPE=en_US.UTF-8 可以让 Emacs 不使用 fcitx"
;;; Code:

(require 'nema-customize-group)

(when nema-has-jis-keycode
  (bind-key (kbd "<henkan>") #'toggle-input-method)
  (unbind-key (kbd "C-\\")))

;; https://github.com/DogLooksGood/emacs-rime
(use-package rime
  :demand t
  :custom
  (default-input-method "rime")
  ;; (rime-librime-root "~/.emacs.d/librime/dist")
  ;; (rime-user-data-dir "~/.config/fcitx/rime")
  :config
  (setq rime-translate-keybindings '("C-f" "C-b" "C-n" "C-p" "C-g")
        rime-show-candidate 'posframe
        rime-posframe-style 'vertical)
  (if nema-use-evil
      ;; 一个在 evil-normal-state 中、在英文字母后面以及代码中自动使用英文的例子。
      (setq rime-disable-predicates
            '(rime-predicate-evil-mode-p
              rime-predicate-after-alphabet-char-p
              rime-predicate-prog-in-code-p))))

(provide 'nema-im)
;;; nema-im.el ends here
