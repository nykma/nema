;;; nema-core --- Core config for nema
;;; Commentary:

;;; Code:

;; Packges
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(unless package-archive-contents (package-refresh-contents))
(package-install 'use-package)
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

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
  "Open 'init.el'."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Define temp file dir.
;; SEEALSO: https://stackoverflow.com/questions/2680389/how-to-remove-all-files-ending-with-made-by-emacs
(setq backup-directory-alist '(("." . "~/.emacs.d/temp/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(defmacro buffer-real-name ()
  "This macro will return the real filename of current
buffer (without parent directory) Because `uniquify' could cause
`buffer-name' returning you an unwanted value.
e.g. ruby main.rb => ruby main.rb:directory_name"
  `(file-name-nondirectory buffer-file-name))

;; auto pair
(electric-pair-mode t)

;; windmove
(global-set-key (kbd "C-c C-w C-h") 'windmove-left)
(global-set-key (kbd "C-c C-w C-j") 'windmove-down)
(global-set-key (kbd "C-c C-w C-k") 'windmove-up)
(global-set-key (kbd "C-c C-w C-l") 'windmove-right)

(provide 'nema-core)
;;; nema-core.el ends here
