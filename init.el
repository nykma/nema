;;; nema - Nayuki's EMAcs distro
;;; Heavily inspired by https://github.com/kuanyui/.emacs.d

(require 'package)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/nema")

(require 'nema-core)
(require 'nema-theme)
(require 'nema-keymapping)
(require 'nema-basic)
;; (require 'nema-flycheck)

;;; Auto generated stuff goes here - DON'T EDIT

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit counsel swiper ivy mwim which-key smex
	   (zenburn-theme)
	   zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
