;;; nema-customize-group --- Customize group settings for NEMa
;;; Commentary:
"Customize group settings for NEMa"
;;; Code:

(defgroup nema ()
  "Nayuki's EMAcs config."
  :tag "NEma"
  :link '(url-link :tag "GitHub" "https://github.com/nykma/nema")
  :prefix "nema-"
  :group 'applications)

(defcustom nema-emacs-completion-engine 'ivy
  "Emacs completion engine to use.
Default is `ivy'."
  :tag "Emacs completion engine"
  :group 'nema
  :type `(choice (const :tag "Ivy" ivy)
                 (const :tag "Helm" helm)
                 (const :tag "Don't use" nil)))

(defcustom nema-use-lsp nil
  "Use LSP (Language Server Protocol) as code completion backend.
Disabled by default."
  :tag "Use LSP"
  :group 'nema
  :type '(boolean))

(provide 'nema-customize-group)

;;; nema-customize-group.el ends here
