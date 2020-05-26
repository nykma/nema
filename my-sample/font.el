;;; font --- Sample font setting
;;; Commentary:
"Sample font setting"
;;; Code:

(defun nema/font-init ()
  "Font settings.

See also: `find-font', `font-spec', `set-fontset-font',
`face-font-family-alternatives' and external program `xfontsel'.

To debug: check `fontset-alias-alist' variable."
  (interactive)
  (if (display-graphic-p)
      (let ((normal-font (font-spec :family "Victor Mono" :height 12))
            (emoji-font (font-spec :family "JoyPixels" :height 12))
            (cjk-font (font-spec :family "Sarasa Term Slab SC" :height 12)))
        (if (and (find-font normal-font) (find-font cjk-font) (find-font emoji-font))
            (progn
              (set-fontset-font nil 'unicode normal-font nil 'prepend)
              (dolist (cjk-charset '(kana han hangul cjk-misc bopomofo cyrillic))
                (set-fontset-font nil cjk-charset cjk-font nil 'append))
              (set-fontset-font nil 'symbol emoji-font nil 'prepend))
          (message "Some font not found. Normal: %s | CJK: %s | Emoji: %s"
                   (find-font normal-font)
                   (find-font cjk-font)
                   (find-font emoji-font))))
    (message "No graphic. Font settings skipped.")))

(add-hook 'server-after-make-frame-hook 'nema/font-init)

;;; font.el ends here
