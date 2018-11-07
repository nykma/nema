;; Use paredit in almost all prog-mode
(use-package paredit-everywhere
  :delight
  :hook ((prog-mode . paredit-everywhere-mode))
  :bind (("C-k" . paredit-kill)))
