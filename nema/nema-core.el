;;; nema-core --- Core config for nema
;;; Commentary:

;;; Code:

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; Packges
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; use-package
(unless (or package-archive-contents (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))
;; Always install new package
(setq use-package-always-ensure t)

(set-locale-environment "UTF-8")


(setq require-final-newline t)

;; PATH settings
(setenv "PATH"
	(concat
	 (format "%s/%s;" (getenv "HOME") ".cargo/bin")
	 (format "%s/%s;" (getenv "HOME") ".rbenv/shims")
	 (format "%s/%s;" (getenv "HOME") ".cabal/bin")
	 (format "%s/%s;" (getenv "HOME") ".config/composer/vendor/bin")
	 (getenv "PATH")))

;; Config
(defun nema/core/config-reload ()
  "Reload '~/.emacs.d/init.el'."
  (interactive)
  (load-file "~/.emacs.d/init.el")
  (message "Nema - config reloaded."))

(defun nema/core/config-open-init-el ()
  "Edit 'init.el'."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Define temp file dir.
;; SEEALSO: https://stackoverflow.com/questions/2680389/how-to-remove-all-files-ending-with-made-by-emacs
(setq backup-directory-alist '(("." . "~/.emacs.d/temp/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 5    ; how many of the newest versions to keep
  kept-old-versions 0    ; and how many of the old
  vc-make-backup-files t ; you don't commit on every save, right?
  )
;; Don't auto save sensitive data
(setq auto-mode-alist
      (append
       (list
        '("\\.\\(vcf\\|gpg\\)$" . sensitive-minor-mode)
        )
       auto-mode-alist))

(defmacro buffer-real-name ()
  "This macro will return the real filename of current
buffer (without parent directory) Because `uniquify' could cause
`buffer-name' returning you an unwanted value.
e.g. ruby main.rb => ruby main.rb:directory_name"
  `(file-name-nondirectory buffer-file-name))

;; auto pair
(electric-pair-mode t)

(provide 'nema-core)
;;; nema-core.el ends here
