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
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Core layers
(require 'nema-core)
(require 'nema-basic)
(require 'nema-appearance)

;; General purpose layers
(require 'nema-completion)
(require 'nema-vcs)
(require 'nema-snippet)
(require 'nema-flycheck)
(require 'nema-project)
(require 'nema-im)
(require 'nema-terminal)

;; Language-specific layers
(require 'nema-restclient)
(require 'nema-php)
(require 'nema-ruby)
(require 'nema-elisp)
(require 'nema-org)
(require 'nema-markdown)
(require 'nema-javascript)
(require 'nema-python)
(require 'nema-web)
(require 'nema-markup)
(require 'nema-docker)
(require 'nema-c)

;; misc
(require 'nema-dired)
(require 'nema-twitter)

;; local-defined scripts
;; (add-to-list 'load-path "~/.emacs.d/scripts)
;; (require 'my-scripts)

;; Key config layers
(require 'nema-keymapping)
(require 'nema-hydra)

;; Load all self configs in ~/.emacs.d/my
(let ((loaded (mapcar #'car load-history)))
  (dolist  (file (directory-files "~/.emacs.d/my" t ".+\\.elc?$"))
    (unless (catch 'load-error
              (dolist (done loaded)
                (when (equal file done) (throw 'load-error t)))
              nil)
      (load (file-name-sans-extension file))
      (push file loaded))))

;;; DON'T EDIT --- Auto generated stuff goes here --- DON'T EDIT
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-selected-packages
   (quote
    (origami neotree doom-themes company-php ac-php ivy-hydra magit-gitflow anzu flycheck-rtags ivy-rtags company-rtags rtags editorconfig scss-mode pug-mode vue-mode twittering-mode smart-mode-line nyan-mode smart-tabs-mode auctex dockerfile-mode docker multiple-cursors projectile-rails yaml-mode rinari multi-term emmet-mode web-mode delight rjsx-mode elpy tide js2-mode ace-window hydra tabbar moe-theme org-bullets apib-mode markdown-mode pyim php-extras ruby-ext htmlize rake ruby-tools ruby-test-mode rspec-mode rubocop bundler robe rbenv exec-path-from-shell flycheck-rust cargo racer toml-mode rust-mode company-auctex enh-ruby-mode paredit rainbow-delimiters rainbow-delimiters-mode pack powerline use-package yasnippet-snippets counsel-projectile ivy-projectile projectile hc-zenburn-theme php-mode yasnippet company-restclient company restclient flycheck magit counsel swiper ivy mwim which-key smex zenburn-theme))))

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
