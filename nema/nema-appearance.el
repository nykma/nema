;;; nema-appearance -- Appearance and UI settings
;;; Commentary:
"Appearance and UI settings 中文测试测试测试"
;;; Code:

(package-install 'hc-zenburn-theme)
(load-theme 'hc-zenburn t)

;; UI - disable all UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Font
;; ~/.Xresources:
;; Emacs.font: -*-tamzenforpowerline-medium-*-*-*-16-*-*-*-*-*-*-*
(when (display-graphic-p)
(defvar nema/cjk-font "-gnu-Unifont-Medium-R-Normal-Sans-16-*-*-*-*-*-*"
  "Default CJK font for GUI.")
(dolist (charset '(kana han cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font) charset
		  (font-spec :name nema/cjk-font)))
;; (set-fontset-font (frame-parameter nil 'font) 'han (font-spec :family "-gnu-Unifont-Medium-R-Normal-Sans-16-160-75-75-c-80-iso10646-1" :size 16))
)

(provide 'nema-appearance)

;;; nema-appearance.el ends here
