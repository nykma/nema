;;; nema-vcs - Version control tools

;; magit - Magit git
(use-package magit
  :bind (("C-c g g" . magit-status))
  ;; :config
  ;; (setq magit-no-confirm t)
  )


(provide 'nema-vcs)
;;; nema-vcs.el ends here
