;;; org-roam --- Rudimentary Roam replica with Org-mode
;;; Commentary:
"Rudimentary Roam replica with Org-mode"
;;; Code:

(require 'nema-customize-group)

(use-package org-roam
  :delight org-roam-mode
  :hook (after-init . org-roam-mode)
  ;; :custom
  ;; (org-roam-directory "/path/to/org-files/")
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert)))
  :config
  (setq org-roam-completion-system nema-emacs-completion-engine))
;;; org-roam.el ends here
