;;; nema-hydra --- Keep doing things
;;; Code:

(use-package hydra
  :ensure t)

(global-set-key
 (kbd "M-o")
 (defhydra hydra-window (:color amaranth)
   "Window"
   ("h" windmove-left)
   ("j" windmove-down)
   ("k" windmove-up)
   ("l" windmove-right)
   ("v" (lambda () (interactive)
	  (split-window-right)
	  (windmove-right))
    "Vertical")
   ("i" (lambda () (interactive)
	  (split-window-below)
	  (windmove-down))
    "Horizonal")
   ("a" ace-window "Ace")
   ("s" ace-swap-window "Swap")
   ("d" ace-delete-window "Close")
   ("o" ace-maximize-window "Maxmize" :color blue)

   ("b" ivy-switch-buffer "Buffer")
   ("F" counsel-find-file "Open")
   ("p" counsel-projectile-switch-project "Project")
   ("f" counsel-projectile-find-file "File in project")

   ("q" nil "Quit")))

(provide 'nema-hydra)
;;; nema-hydra.el ends here
