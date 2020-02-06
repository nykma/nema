;;; nema-org --- Org
;;; Commentary:
"org-mode enhancement"
;;; Code:

(use-package htmlize :defer t)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package org
  :pin org
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :config
  ;; Auto save all org files
  ;; See https://www.gnu.org/software/emacs/manual/html_node/emacs/Auto-Save-Control.html#Auto-Save-Control
  (add-hook 'auto-save-hook 'org-save-all-org-buffers)

  (require 'org-capture)
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
        '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          ))

  ;; Auto numbering outline
  ;; (if (version<= "9.3" (org-version))
  ;;     (add-hook 'org-mode-hook 'org-num-mode))

  ;; Log clock when a job is done.
  (setq org-log-done 'clock)

  (setq org-id-track-globally t)
  (setq org-id-locations-file (expand-file-name ".cache/org-id-locations" user-emacs-directory)))

(use-package org-cliplink)

;; PDF viewer
(use-package pdf-tools
  :magic ("%PDF" . pdf-view-mode)
  :config
  ;; Copied from http://pragmaticemacs.com/emacs/more-pdf-tools-tweaks/
  ;; initialise
  (pdf-tools-install t)
  ;; open pdfs scaled to fit page
  (setq-default pdf-view-display-size 'fit-page)
  ;; automatically annotate highlights
  ;; (setq pdf-annot-activate-created-annotations t)
  ;; use normal isearch
  ;; (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  ;; turn off cua so copy works
  (add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0)))
  ;; more fine-grained zooming
  (setq pdf-view-resize-factor 1.1)
  ;; keyboard shortcuts
  (define-key pdf-view-mode-map (kbd "h") 'pdf-annot-add-highlight-markup-annotation)
  (define-key pdf-view-mode-map (kbd "t") 'pdf-annot-add-text-annotation)
  (define-key pdf-view-mode-map (kbd "D") 'pdf-annot-delete))

;; Live preview
(use-package maple-preview
  :quelpa (:fetcher github :repo "honmaple/emacs-maple-preview" :files ("*.el" "index.html" "static"))
  :commands (maple-preview-mode)
  :config
  (setq maple-preview:allow-modes '(org-mode markdown-mode html-mode web-mode)
        maple-preview:host "localhost"
        maple-preview:port 8999
        maple-preview:websocket-port 8081
        maple-preview:auto t))

(use-package org-plus-contrib
  :pin org
  :no-require t)

;; Org babel extensions
;; HTTP client
;; usage: BEGIN_SRC http :pretty
(use-package ob-http
  :hook (org-mode . (lambda ()
                      (add-to-list 'org-babel-load-languages '(http . t)))))

;; render html into PNG using Chrome
;; usage: BEGIN_SRC html-chrome :file test
(use-package ob-html-chrome
  :config
  ;; (add-to-list 'org-babel-load-languages '(html-chrome . t))
  (setq org-babel-html-chrome-chrome-executable "/usr/bin/chromium"))

;; Async src_block execution
;; usage: begin_src sh :async
(use-package ob-async)

(provide 'nema-org)

;;; nema-org.el ends here
