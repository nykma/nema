;;; nema-dart --- Dart tools
;;; Commentary:
"Dart tools"
;;; Code:

(require 'nema-customize-group)

(use-package dart-mode)

(use-package flutter
  :after (dart-mode)
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload))
  :config
  ;;(setq flutter-sdk-path "/opt/flutter/")
  )

(use-package lsp-dart
  :if (eq nema-lsp 'lsp-mode)
  :hook (dart-mode . lsp))

(use-package hover
  :if (executable-find "hover")
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-z" . #'hover-run-or-hot-reload)
              ("C-M-x" . #'hover-run-or-hot-restart)
              ("C-M-p" . #'hover-take-screenshot))
  :init
  (setq hover-command-path (executable-find "hover")
        hover-hot-reload-on-save t))

(provide 'nema-dart)

;;; nema-dart.el ends here
