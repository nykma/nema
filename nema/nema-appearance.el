;;; nema-appearance -- Appearance and UI settings
;;; Commentary:
"Appearance and UI settings"
;;; Code:
(require 'nema-customize-group)

;; Hide general UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 1)

;; No cursor blinking
(blink-cursor-mode 0)

;; Hide welcome buffer
(setq inhibit-startup-screen t)


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

;; (use-package highlight-indent-guides
;;   :delight
;;   :hook (prog-mode . highlight-indent-guides-mode)

;;   (setq highlight-indent-guides-method 'character
;;         highlight-indent-guides-character ?\|
;;         highlight-indent-guides-responsive 'top
;;         ))

;; Emacs Macport: enable ligature
(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

;; Highlight TODO
;; from doom-emacs
(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold)
          ("DEBUG"      error bold))))

;; Visual feedback for some operations
(use-package volatile-highlights
  :delight
  :quelpa (volatile-highlights :fetcher github :repo "k-talo/volatile-highlights.el")
  :config
  (volatile-highlights-mode t))

(defun nema/reload-theme (_args)
  "Reload theme with setting of `nema-theme'"
  (interactive "P")
  (pcase nema-theme
  ('moe-theme
   (use-package moe-theme
     :config
     (setq moe-theme-highlight-buffer-id t)
     (moe-theme-apply-color 'yellow)
     (if (eq 'dark nema-theme-style)
         (moe-dark)
       (moe-light))))
  ('hc-zenburn-theme
   (use-package hc-zenburn-theme
     :config
     (load-theme 'hc-zenburn t)))
  ('zenburn-theme
   (use-package zenburn-theme
     :config
     (load-theme 'zenburn t)))
  ('doom-themes
   (use-package doom-themes
     :config
     ;; Global settings (defaults)
     (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
           doom-themes-enable-italic t) ; if nil, italics is universally disabled)
     (if (eq 'dark nema-theme-style)
         (load-theme 'doom-one t)
       (load-theme 'doom-one-light t))
     (doom-themes-visual-bell-config)
     (doom-themes-neotree-config)
     (doom-themes-org-config)))
  ('darkokai-theme
   (use-package darkokai-theme
     :config
     (setq darkokai-mode-line-padding 1
           darkokai-use-variable-pitch nil)
     (load-theme 'darkokai t)))
  ('flucui-themes
   (use-package flucui-themes
     :config
     (flucui-themes-load-style nema-theme-style)))
  ('srcery-theme
   (use-package srcery-theme
     :config
     (load-theme 'srcery t)))
  ('kaolin-themes
   (use-package kaolin-themes
     :config
     (if (eq 'dark nema-theme-style)
         (load-theme 'kaolin-galaxy t)
       (load-theme 'kaolin-light t))))
  ('alect-themes
   (use-package alect-themes
     :config
     (if (eq 'dark nema-theme-style)
         (load-theme 'alect-dark t)
       (load-theme 'alect-light t))))
  ('tron-legacy
   (use-package tron-legacy-theme
     :quelpa (tron-legacy-theme
              :fetcher url
              :url "https://raw.githubusercontent.com/ianpan870102/tron-legacy-emacs-theme/master/tron-legacy-theme.el")
     :config
     ;; FIXME: too dirty
     (add-to-list 'custom-theme-load-path (expand-file-name "quelpa/build/tron-legacy-theme" user-emacs-directory))
     ;; (setq tron-legacy-dark-fg-bright-comments t)
     (load-theme 'tron-legacy t)))
  ('nord
   (use-package nord-theme
     :config
     ;; NOTE: very stupid behavior will happen in terminal Emacsclient
     ;; SEEALSO: https://github.com/arcticicestudio/nord-emacs/issues/59
     (if (daemonp)
	    (add-hook 'after-make-frame-functions
		      (lambda (frame)
			(with-selected-frame frame (load-theme 'nord t))))
	  (load-theme 'nord t))
     ))))

(defun nema/reload-modeline (_args)
  "Reload mode line with settings of `nema-mode-line'."
  (interactive "P")
  (pcase nema-mode-line
    ('smart-mode-line
     (use-package smart-mode-line
       :config
       (setq sml/no-confirm-load-theme t
             sml/theme 'respectful)
       (sml/setup)))
    ('doom-modeline
     (use-package doom-modeline
       :hook (after-init . doom-modeline-mode)
       :config
       (setq doom-modeline-icon nil
             doom-modeline-height 18
             doom-modeline-github nil
             doom-modeline-lsp t)
       (if doom-modeline-icon ;; Demo only
           (use-package all-the-icons
             ;; Remember to run
             ;; (all-the-icons-install-fonts)
             ;; after requiring this package
             ))))
    ('awesome-tray
     (use-package awesome-tray
       :quelpa (awesome-tray :fetcher github :repo "manateelazycat/awesome-tray")
       :config
       (awesome-tray-mode 1)))
    ('telephone-line
     (use-package telephone-line
       :config
       (telephone-line-mode 1)))
    ('powerline
     (use-package powerline
       :config
       (if (eq nema-theme 'moe-theme)
           ;; This must appear AFTER =use-package powerline=
           (powerline-moe-theme)
         (powerline-center-theme))))))

(nema/reload-modeline ())
(nema/reload-theme ())

(provide 'nema-appearance)

;;; nema-appearance.el ends here
