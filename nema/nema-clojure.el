;;; nema-clojure --- Clojure tools
;;; Commentary:
"Clojure tools"
;;; Code:

;; incl. Clojure and ClojureScript
(use-package clojure-mode
  :hook ((clojure-mode clojurescript-mode) . paredit-mode)
  :config
  (use-package clojure-snippets))

(provide 'nema-clojure)

;;; nema-clojure.el ends here
