;; Auto save buffer immediately focusing-out a window
;; Based on Xah Lee's snippet:
;; http://ergoemacs.org/emacs/emacs_auto_save.html

(defun nema/save-all ()
  "Save all unsaved files. No asking."
  (interactive)
  (save-some-buffers t))

(if (version< emacs-version "27")
    (add-hook 'focus-out-hook #'nema/save-all)
  (setq after-focus-change-function #'nema/save-all))
