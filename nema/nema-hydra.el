;;; nema-hydra --- Keep doing things
;;; Commentary:
"Keep doing things"
;;; Code:

(use-package hydra)

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
   ("=" balance-windows "Bal")
   ("a" ace-window "Ace")
   ("s" ace-swap-window "Swp")
   ("d" ace-delete-window "Close")
   ("o" ace-maximize-window "Max" :color blue)

   ("b" ivy-switch-buffer "Buf")
   ("F" counsel-find-file "Open")
   ("p" counsel-projectile-switch-project "Proj")
   ("f" counsel-projectile-find-file "In proj")
   ("t" multi-term "Term")
   ("q" nil)))

(provide 'nema-hydra)
;;; nema-hydra.el ends here
