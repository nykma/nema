;;; nema-im --- Input method
;;; Commentary:
"Chinese input method configuration 中文输入法配置

搭配环境变量 LC_CTYPE=en_US.UTF-8 可以让 Emacs 不使用 fcitx"
;;; Code:

(require 'nema-customize-group)

(defcustom nema-im 'rime
  "Emacs input method engine to use.
Default is `rime'."
  :tag "Emacs input engine"
  :group 'nema
  :type '(choice
          (const :tag "rime" rime)
          (const :tag "pyim" pyim)))

(use-package posframe
  :quelpa (posframe :fetcher github :repo "tumashu/posframe" :files ("posframe.el")))

(when nema-has-jis-keycode
  (bind-key (kbd "<henkan>") #'toggle-input-method)
  (unbind-key (kbd "C-\\")))

(pcase nema-im
  ('rime
   ;; https://github.com/DogLooksGood/emacs-rime
   (use-package rime
     :demand t
     :custom
     (default-input-method "rime")
     ;; (rime-librime-root "~/.emacs.d/librime/dist")
     ;; (rime-user-data-dir "~/.config/fcitx/rime")
     :config
     (setq rime-translate-keybindings '("C-f" "C-b" "C-n" "C-p" "C-g")
           rime-show-candidate 'minibuffer)
     (if nema-use-evil
         ;; 一个在 evil-normal-state 中、在英文字母后面以及代码中自动使用英文的例子。
         (setq rime-disable-predicates
               '(rime-predicate-evil-mode-p
                 rime-predicate-after-alphabet-char-p
                 rime-predicate-prog-in-code-p)))))

  ('pyim
   (use-package liberime
             :quelpa (liberime
                       :fetcher github
                       :repo "merrickluo/liberime"
                       :files ("CMakeLists.txt" "Makefile" "src" "liberime.el" "liberime-config.el"))
             ;; :custom
             ;; (liberime-user-data-dir "~/.config/fcitx/rime")
             :init
             (add-hook 'liberime-after-start-hook
                       (lambda ()
                         (liberime-select-schema "double_pinyin")))
             :config
             (unless (file-exists-p (liberime-get-module-file))
               (liberime-build)))

   (use-package pyim
     :demand t
     :bind
     (("M-j" . pyim-convert-string-at-point)
      ;; ("C-\\" . toggle-input-method)
      )
     :config
     (setq default-input-method "pyim"
           pyim-default-scheme 'rime
           pyim-page-tooltip 'posframe
           pyim-page-length 6)

     ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
     ;; 我自己使用的中英文动态切换规则是：
     ;; 1. 光标只有在注释里面时，才可以输入中文。
     ;; 2. 光标前是汉字字符时，才能输入中文。
     ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
     (setq-default pyim-english-input-switch-functions
                   '(pyim-probe-dynamic-english
                     pyim-probe-isearch-mode
                     pyim-probe-program-mode
                     pyim-probe-org-structure-template))

     (setq-default pyim-punctuation-half-width-functions
                   '(pyim-probe-punctuation-line-beginning
                     pyim-probe-punctuation-after-punctuation)))))

;; (provide 'nema-im)
;;; nema-im.el ends here
