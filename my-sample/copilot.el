;; Use C-e when copilot suggestion is poped up to fill.
(use-package copilot
  :quelpa (copilot.el :fetcher github :repo "zerolfx/copilot.el"
                      :files ("dist" "*.el"))
  :bind (("<f12>" . copilot-accept-completion))
  :hook ((prog-mode . copilot-mode))
  :config
  (if nema-use-evil (customize-set-variable 'copilot-enable-predicates '(evil-insert-state-p))))
