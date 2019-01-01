;;; nema-org --- Org
;;; Commentary:
"org-mode enhancement"
;;; Code:

(use-package htmlize :defer t)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package org
  ;; :bind (("C-c a" . org-agenda)
  ;;        ("C-c c" . org-capture))
  :config
  ;; "org-protocol:/sub-protocol:/" triggers actions associated with sub-protocol through the custom variable org-protocol-protocol-alist.
  ;; Linux setup (Gnome)

  ;; For this to work, you'll need the Gnome-Libraries to be installed.

  ;; gconftool-2 -s /desktop/gnome/url-handlers/org-protocol/command '/usr/local/bin/emacsclient %s' --type String
  ;; gconftool-2 -s /desktop/gnome/url-handlers/org-protocol/enabled --type Boolean true

  ;; Linux setup (KDE)

  ;; Add a file org.protocol to ~/.kde/share/kde4/services/:

  ;; # -*- conf -*-
  ;; [Protocol]
  ;; protocol=org-protocol
  ;; exec=/usr/bin/emacsclient '%u'
  ;; input=none
  ;; output=none
  ;; helper=true
  ;; listing=
  ;; reading=false
  ;; writing=false
  ;; makedir=false
  ;; deleting=false
  ;; Icon=emacs
  ;; Description=A protocol for org-mode
  (require 'org-protocol)
  ;; Use XeLaTeX to export PDF in Org-mode
  (setq org-latex-pdf-process
        '("xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"))
  ;; 指定你要用什麼外部 app 來開 pdf 之類的檔案
  (setq org-file-apps '((auto-mode . emacs)
                        ("\\.mm\\'" . default)
                        ("\\.x?html?\\'" . "xdg-open %s")
                        ("\\.pdf\\'" . emacs)
                        ("\\.jpg\\'" . emacs)))
  ;; Log clock when a job is done.
  (setq org-log-done 'clock))

(provide 'nema-org)

;;; nema-org.el ends here
