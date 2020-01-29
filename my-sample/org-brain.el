;;; org-brain --- org-brain related config
;;; Commentary:
"org-brain related config"
;;; Code:

;; Basiclly pasted from
;; https://github.com/Kungsgeten/org-brain
(use-package org-brain
  :init
  ;; I do this in customize-variable
  ;; (setq org-brain-path "directory/path/where-i-want-org-brain")
  (if nema-use-evil
      (with-eval-after-load 'evil
        (evil-set-initial-state 'org-brain-visualize-mode 'emacs)))
  :config
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all
        org-brain-title-max-length 12
        org-brain-include-file-entries nil
        org-brain-file-entries-use-title nil)
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

    (define-key org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource)))

;;; org-brain.el ends here
