;;; nema --- Nayuki's EMAcs distro
;; -*- lexical-binding: t -*-
;;; Commentary:

"Nayuki's .emacs.d.
Heavily inspired by parcell/emacs.d, prelude and kuanyui/.emacs.d"

;;; Code:

;; If you meet something wrong,
;; (setq debug-on-error t)

(require 'package)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Core config files
(add-to-list 'load-path
             (expand-file-name "nema" user-emacs-directory))

(require 'nema-customize-group)

;;; move customize-set-variable out of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))    ; Touch this file
(load custom-file)

;;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(when (version<=  "27" emacs-version)
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; Core layers
(require 'nema-core)

(require 'nema-basic)
(require 'nema-appearance)

;; General purpose layers
(require 'nema-snippet)
(require 'nema-completion)
(require 'nema-lsp)
(require 'nema-vcs)
(require 'nema-project)
(require 'nema-terminal)
(require 'nema-systemd)
;; Language-specific layers
(require 'nema-restclient)
(require 'nema-php)
(require 'nema-ruby)
(require 'nema-org)
(require 'nema-markdown)
(require 'nema-javascript)
(require 'nema-java)
(require 'nema-python)
(require 'nema-rust)
(require 'nema-web)
(require 'nema-markup)
(require 'nema-lua)
(require 'nema-docker)
(require 'nema-c)
(require 'nema-dotnet)
(require 'nema-elixir)
(require 'nema-dart)
(require 'nema-go)
(require 'nema-clojure)
(require 'nema-swift)
(require 'nema-latex)
(require 'nema-ocaml)
(require 'nema-protobuf)
(require 'nema-haskell)
(require 'nema-nix)

(require 'nema-graphql)

;; misc
(require 'nema-dired)
(require 'nema-twitter)

;; local-defined scripts
;; (add-to-list 'load-path "~/.emacs.d/scripts)
;; (require 'my-scripts)

;; Key bindings
(if nema-use-evil
    (require 'nema-evil))

;; Load all self configs in ~/.emacs.d/my
(let ((loaded (mapcar #'car load-history)))
  (dolist (file (directory-files (expand-file-name "my" user-emacs-directory) t ".+\\.elc?$"))
    (unless (catch 'load-error
              (dolist (done loaded)
                (when (equal file done) (throw 'load-error t)))
              nil)
      (load (file-name-sans-extension file))
      (push file loaded))))

;;; init.el ends here
