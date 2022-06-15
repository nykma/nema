(use-package plantuml-mode
  :config
  (require 'ob-plantuml)

  (setq org-plantuml-jar-path (expand-file-name "/usr/share/java/plantuml/plantuml.jar"))
  (setq plantuml-jar-path org-plantuml-jar-path
        plantuml-default-exec-mode 'jar)
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))

  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))
