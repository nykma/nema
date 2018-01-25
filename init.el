;;; nema --- Nayuki's EMAcs distro
;;; Commentary:

"init.d heavily inspired by Spacemacs, prelude and kuanyui/.emacs.d"
;;; Code:

(require 'package)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/nema")

;; Core layers
(require 'nema-core)
(require 'nema-basic)
(require 'nema-appearance)

;; General purpose layers
(require 'nema-completion)
(require 'nema-vcs)
(require 'nema-flycheck)
(require 'nema-project)
(require 'nema-im)

;; Language-specific layers
(require 'nema-restclient)
(require 'nema-php)
(require 'nema-ruby)
(require 'nema-elisp)
(require 'nema-org)
(require 'nema-markdown)

;; local-defined scripts
;; (add-to-list 'load-path "~/.emacs.d/scripts)
;; (require 'my-scripts)

;; Key config layers
(require 'nema-keymapping)
;; (require 'my-keymapping)

;;; DON'T EDIT --- Auto generated stuff goes here --- DON'T EDIT
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(moe-theme org-bullets apib-mode markdown-mode pyim php-extras ruby-ext htmlize rake ruby-tools ruby-refactor ruby-test-mode rspec-mode rubocop bundler robe rbenv exec-path-from-shell diminish flycheck-rust cargo racer toml-mode rust-mode tex company-auctex enh-ruby-mode paredit rainbow-delimiters rainbow-delimiters-mode pack powerline use-package yasnippet-snippets counsel-projectile ivy-projectile projectile hc-zenburn-theme php-mode yasnippet company-restclient company restclient flycheck magit counsel swiper ivy mwim which-key smex zenburn-theme))
 '(yas-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
