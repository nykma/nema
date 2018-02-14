;;; nema-appearance -- Appearance and UI settings
;;; Commentary:
"Appearance and UI settings"
;;; Code:

;; Hide welcome buffer
(setq inhibit-startup-screen t)

;; Font
;; ~/.Xresources:
;; Emacs.font: -*-tamzenforpowerline-medium-*-*-*-16-*-*-*-*-*-*-*
(when (display-graphic-p)
  (let ((nema/cjk-font "-gnu-Unifont-Medium-R-Normal-Sans-16-*-*-*-*-*-*"))
    (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
		      (font-spec :name nema/cjk-font)))
    ))

;; Powerline
;; (use-package powerline)

;; Nyan mode
;; (use-package nyan-mode
;;   :config
;;   (setq nyan-animate-nyancat t
;; 	nyan-bar-length 35
;; 	nyan-wavy-trail nil
;; 	nyan-minimum-window-width 100)
;;   (nyan-mode))

;; Paren mode
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; (use-package hc-zenburn-theme
  ;; :config
  ;; (load-theme 'hc-zenburn t))

;; moe-theme
(use-package moe-theme
  :config
  (setq moe-theme-highlight-buffer-id t)
  (moe-theme-set-color 'cyan)
  ;; (powerline-moe-theme) ;; This must appear AFTER =use-package powerline=
  (moe-dark)
  ;; smart-mode-line
  (use-package smart-mode-line
    :config
    (setq sml/theme 'dark
          sml/no-confirm-load-theme t)
    (sml/setup)))

(provide 'nema-appearance)

;;; nema-appearance.el ends here
