;;; nema-ruby --- RUBY mode
"Ruby packages and settings"
;;; Code:

;; SEEALSO: spacemacs/layers/+lang/ruby/packages.el
(use-package enh-ruby-mode
  :mode (("Appraisals\\'" . enh-ruby-mode)
	 ("\\(Rake\\|Thor\\|Guard\\|Gem\\|Cap\\|Vagrant\\|Berks\\|Pod\\|Puppet\\)file\\'" . enh-ruby-mode)
	 ("\\.\\(rb\\|rabl\\|ru\\|builder\\|rake\\|thor\\|gemspec\\|jbuilder\\)\\'" . enh-ruby-mode))
  :interpreter "ruby"
  :ensure t
  :config
  (setq enh-ruby-deep-indent-paren nil
	enh-ruby-hanging-paren-deep-indent-level 2
	ruby-insert-encoding-magic-comment nil))


(let ((ruby-packages '(bundler
		      rbenv
		      robe
		      rubocop
		      rspec-mode
		      ruby-test-mode
		      ruby-refactor
		      ruby-tools
		      rake
		      )))
  (dolist (pkg ruby-packages)
    (unless (package-installed-p pkg)
      (unless package-archive-contents (package-refresh-contents))
      (package-install pkg)
      (require pkg))))

(use-package inf-ruby
  :ensure t
  :config
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter))

(use-package projectile-rails
  :delight 'projectile-rails-mode
  :config
  (projectile-rails-global-mode)
  )

(use-package rinari)

(provide 'nema-ruby)

;;; nema-ruby.el ends here
