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

(defcustom nema-mode-line 'smart-mode-line
  "Mode line to use.
Default is `smart-mode-line'"
  :tag "Mode line"
  :group 'nema
  :type '(choice (const :tag "Smart mode line" smart-mode-line)
                 (const :tag "Doom modeline" doom-modeline)))

(defcustom nema-theme 'moe-theme
  "Color theme for the whole Emacs.
Default is `moe-theme'"
  :tag "Theme"
  :group 'nema
  :type '(choice (const :tag "moe-theme.el" moe-theme)
                 (const :tag "Zenburn (high contrast)" hc-zenburn-theme)
                 (const :tag "Zenburn" zenburn)
                 (const :tag "Doom themes: peacock" doom-themes)
                 (const :tag "Darkokai" darkokai-theme)
                 (const :tag "Fluc UI" flucui-themes)))

(provide 'nema-customize-group)

;;; nema-customize-group.el ends here
