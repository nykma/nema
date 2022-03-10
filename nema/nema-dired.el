;;; nema-dired --- Dired config
;;; Commentary:
"Dired config"
;;; Code:

;; SEEALSO: https://kuanyui.github.io/2014/06/21/dired-tutorial-and-essential-configs/
;; (use-package dired
;;   :ensure nil
;;   :hook (dired-after-readin . dired-directory-sort)
;;   :config
;;   (require 'dired-x)

;;   (setq dired-dwim-target t
;;         ;; Humanize file size
;;         dired-listing-switches "-alh")
;;   ;; Sort directories ahead of files
;;   (defun dired-directory-sort ()
;;     "Dired sort hook to list directories first."
;;     (save-excursion
;;       (let (buffer-read-only)
;;         (forward-line 2) ;; beyond dir. header
;;         (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
;;     (and (featurep 'xemacs)
;;          (fboundp 'dired-insert-set-properties)
;;          (dired-insert-set-properties (point-min) (point-max)))
;;     (set-buffer-modified-p nil)))

;; (use-package dired+
;;   :quelpa (dired+ :fetcher url :url "https://www.emacswiki.org/emacs/download/dired+.el"))

;; Good dired alt
(use-package dirvish
  :bind ("C-c d" . dirvish-dired))

(provide 'nema-dired)

;;; nema-dired.el ends here
