;;; cjk-font --- Sample CJK font setting
;;; Commentary:
"Sample CJK font setting"
;;; Code:

(defun nema/font-init ()
  "FONT settings of gnu-Unifont."
  (interactive)
  (let ((nema/cjk-font "-????-Sarasa Mono SC-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"))
    (dolist (charset '(kana han hangul cjk-misc bopomofo cyrillic symbol)) ;; add `latin' if you want to change normal letter too
      (set-fontset-font (frame-parameter nil 'font) charset
                        (font-spec :name nema/cjk-font)))))

;; (add-hook 'after-init-hook 'nema/font-init)

;;; cjk-font.el ends here
