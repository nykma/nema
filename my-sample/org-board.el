;;; org-board --- Archiving website in org
;;; Commentary:
"Archiving website in org"
;;; Code:

(use-package org-board
  :config
  (setq org-board-wget-show-buffer nil)
  (add-to-list 'org-board-wget-switches "--span-hosts")
  (push `("l"
          "Brain/Inbox, URL fetched from kill ring head"
          entry
          (file+olp ,(expand-file-name "brain/INBOX.org" org-directory) "INBOX")
          "* %(org-cliplink-retrieve-title-synchronously \"%c\")   :captured:web:archived:noexport:
  :PROPERTIES:
  :ID:           %(org-id-new)
  :URL:          %c
  :WGET_OPTIONS: --span-hosts
  :CAPTURED_AT:  %T
  :END:

%?"
          :empty-lines 1)
        org-capture-templates)
  (add-hook 'org-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c o") org-board-keymap))))

;;; org-board.el ends here
