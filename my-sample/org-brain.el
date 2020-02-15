;;; org-brain --- org-brain related config
;;; Commentary:
"org-brain related config"
;;; Code:

;; Basiclly pasted from
;; https://github.com/Kungsgeten/org-brain
(use-package org-brain
  :bind (("C-c a" . org-brain-visualize)
         :map org-mode-map
         ("C-c w" . org-brain-refile))
  :init
  ;; Do this in customize-variable:
  ;; (setq org-brain-path "directory/path/where-i-want-org-brain")
  (if nema-use-evil
      (with-eval-after-load 'evil
        (evil-set-initial-state 'org-brain-visualize-mode 'emacs)))
  :config
  (setq org-brain-visualize-default-choices 'all
        org-brain-title-max-length 12
        org-brain-include-file-entries nil
        org-brain-file-entries-use-title nil)

  (when (fboundp 'org-capture)
      (push '("b" "Brain" plain (function org-brain-goto-end)
              "* %i%?" :empty-lines 1)
            org-capture-templates)
      ;; Prepare INBOX.org in brain path first.
      (push `("i"
              "Brain/Inbox"
              entry
              (file+olp ,(expand-file-name "INBOX.org" org-brain-path) "INBOX")
              "* %? :captured:
  :PROPERTIES:
  :ID:           %(org-id-new)
  :CAPTURED_AT:  %T
  :END:

#+begin_quote
%i
#+end_quote
"
              :empty-lines 1
              )
            org-capture-templates))

  (when (fboundp 'org-cliplink)
    (defun org-brain-cliplink-resource ()
      "Add a URL from the clipboard as an org-brain resource.
Suggest the URL title as a description for resource."
      (interactive)
      (let ((url (org-cliplink-clipboard-content)))
        (org-brain-add-resource
         url
         (org-cliplink-retrieve-title-synchronously url)
         t)))

    (define-key org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource))

  ;; Auto insert UUID ID for every org entry (title). See also:
  ;; https://stackoverflow.com/questions/13340616/assign-ids-to-every-entry-in-org-mode
  (add-hook 'org-capture-prepare-finalize-hook 'org-id-get-create)
  (defun nema/org-add-ids-to-headlines-in-file ()
    "Add ID properties to all headlines in the current file which
do not already have one."
    (interactive)
    (org-map-entries 'org-id-get-create))
  (add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'nema/org-add-ids-to-headlines-in-file nil 'local))))

;;; org-brain.el ends here
