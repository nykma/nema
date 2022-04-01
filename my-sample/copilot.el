;; Use C-e when copilot suggestion is poped up to fill.
(use-package copilot
  :demand t
  :quelpa (copilot.el :fetcher github :repo "zerolfx/copilot.el"
                      :files ("dist" "copilot.el"))
  :bind (("C-e" . nema//copilot-complete))
  :init
  (defun nema//copilot-complete (&optional N)
    "Complete the copilot suggestion at point, or move to EOL."
    (interactive "P")
    (if copilot--overlay
        (progn (copilot-accept-completion) (copilot-clear-overlay))
      (mwim-end-of-code-or-line)))
  :config
  ;; provide completion when typing
  (add-hook 'post-command-hook (lambda ()
                                 (copilot-clear-overlay)
                                 (copilot-complete))))
