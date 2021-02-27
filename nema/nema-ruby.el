;;; nema-ruby --- RUBY mode
"Ruby packages and settings"
;;; Code:

(let ((ruby-packages '(bundler
		      rbenv
		      rubocop
		      rspec-mode
		      ruby-test-mode
		      ruby-refactor
		      ruby-tools
		      rake
		      )))
  (dolist (pkg ruby-packages)
    (eval `(use-package ,pkg :delight))))

(use-package inf-ruby
  :config
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter))

;; (use-package projectile-rails
;;   :delight 'projectile-rails-mode
;;   :config
;;   (projectile-rails-global-mode))

(use-package rinari)
;; https://github.com/emacs-lsp/lsp-ruby
;; Install: gem install solargraph
;; (use-package lsp-ruby
;;   :quelpa (lsp-ruby :fetcher github :repo "emacs-lsp/lsp-ruby")
;;   :after (lsp-mode)
;;   :commands lsp-ruby-enable
;;   :hook (ruby-mode . (lambda ()
;;                        (require 'lsp-ruby)
;;                        (lsp))))

(unless nema-lsp
  ;; SEEALSO: spacemacs/layers/+lang/ruby/packages.el
  (use-package enh-ruby-mode
    :mode (("Appraisals\\'" . enh-ruby-mode)
	   ("\\(Rake\\|Thor\\|Guard\\|Gem\\|Cap\\|Vagrant\\|Berks\\|Pod\\|Puppet\\)file\\'" . enh-ruby-mode)
	   ("\\.\\(rb\\|rabl\\|ru\\|builder\\|rake\\|thor\\|gemspec\\|jbuilder\\)\\'" . enh-ruby-mode))
    :interpreter "ruby"
    :config
    (setq enh-ruby-deep-indent-paren nil
	  enh-ruby-hanging-paren-deep-indent-level 2
	  ruby-insert-encoding-magic-comment nil))
  (use-package robe))

(provide 'nema-ruby)

;;; nema-ruby.el ends here
