;;; nema-dart --- Dart tools
;;; Commentary:
"Dart tools"
;;; Code:

(use-package dart-mode)

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload))
  :config
  (setq flutter-sdk-path "/opt/flutter/"))
(provide 'nema-dart)

;;; nema-dart.el ends here
