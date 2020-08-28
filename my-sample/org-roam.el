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
  :bind
  (:map org-roam-mode-map
        (("C-c n l" . org-roam)
         ("C-c n i" . org-roam-insert)
         ("C-c n f" . org-roam-find-file)
         ("C-c n g" . org-roam-graph))
        :map org-mode-map
        (("C-c n i" . org-roam-insert-immediate)))
  :init
  (setq org-roam-db-location (expand-file-name ".cache/roam.db" user-emacs-directory))
  :config
  (setq org-roam-completion-system nema-emacs-completion-engine))

(use-package org-journal
  :after org-roam
  :bind
  (:map org-roam-mode-map
        (("C-c n j" . org-journal-new-entry)))
  :custom
  (org-journal-date-prefix "#+title: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-dir (expand-file-name "journal" org-roam-directory))
  (org-journal-date-format "%Y-%m-%d"))

;;; org-roam.el ends here
