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
  ;; https://www.orgroam.com/manual/Installation-_00281_0029.html#Installation-_00281_0029
  (require 'org-roam-protocol)
  (setq org-roam-completion-system nema-emacs-completion-engine
        org-roam-capture-templates
        '(("d" "default" plain (function org-roam-capture--get-point)
           "%?"
           :file-name "%<%Y%m%d%H%M%S>-${slug}"
           :head "#+title: ${title}\n#+roam_alias:\n#+roam_tags:\n\n* ${title}\n"))))

(use-package org-roam-server
  :commands (org-roam-server-mode)
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 58080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

(use-package org-journal
  :after org-roam
  :bind
  (:map org-roam-mode-map
        (("C-c n j" . org-journal-new-entry)))
  :custom
  (org-journal-file-header "#+roam_tags: journal")
  (org-journal-date-prefix "#+title: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-dir (expand-file-name "journal" org-roam-directory))
  (org-journal-date-format "%Y-%m-%d"))

;;; org-roam.el ends here
