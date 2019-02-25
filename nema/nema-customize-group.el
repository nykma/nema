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
  :type '(choice
          (const :tag "Ivy" ivy)
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
  :type '(choice
          (const :tag "Emacs default" default)
          (const :tag "Smart mode line" smart-mode-line)
          (const :tag "Doom modeline" doom-modeline)
          (const :tag "Awesome Tray" awesome-tray)
          (const :tag "Telephone Line" telephone-line)
          (const :tag "Powerline" powerline)))

(defcustom nema-theme 'srcery-theme
  "Color theme for the whole Emacs.
Default is `srcery-theme'"
  :tag "Theme"
  :group 'nema
  :type '(choice
          (const :tag "moe-theme.el" moe-theme)
          (const :tag "Zenburn (high contrast)" hc-zenburn-theme)
          (const :tag "Zenburn" zenburn)
          (const :tag "Doom themes: peacock" doom-themes)
          (const :tag "Darkokai" darkokai-theme)
          (const :tag "Fluc UI" flucui-themes)
          (const :tag "Srcery" srcery-theme)
          (const :tag "Kaolin" kaolin-themes)
          (const :tag "Alect themes" alect-themes)))

(defcustom nema-theme-style 'dark
  "Use dark or light style of color theme (if the theme supports).
Default is `dark'"
  :tag "Theme"
  :group 'nema
  :type '(choice
          (const :tag "Light" light)
          (const :tag "Dark" dark)))

(provide 'nema-customize-group)

;;; nema-customize-group.el ends here
