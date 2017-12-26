;;; nema-core --- Core config for nema
;;; Commentary:

;;; Code:

(set-locale-environment "UTF-8")

(defmacro buffer-real-name ()
  "This macro will return the real filename of current
buffer (without parent directory) Because `uniquify' could cause
`buffer-name' returning you an unwanted value.
e.g. ruby main.rb => ruby main.rb:directory_name"
  `(file-name-nondirectory buffer-file-name))

;; packages which is not installed via packages.el
;; (add-to-list 'load-path "~/.emacs.d/lisps")

;; Packges.el
;; (require 'package)
;; (package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

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

(provide 'nema-core)
;;; nema-core.el ends here
