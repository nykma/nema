;;; nema-dart --- Dart tools
;;; Commentary:
"Dart tools"
;;; Code:

(use-package dart-mode
  :config
  (setq dart-enable-analysis-server t))

(if nema-use-lsp
    ;; Install dart_language_server :
    ;; $ pub global activate dart_language_server
    (use-package lsp-dart
      :commands (lsp-dart-enable)
      :hook ((dart-mode . lsp-dart-enable))))

(provide 'nema-dart)

;;; nema-dart.el ends here
