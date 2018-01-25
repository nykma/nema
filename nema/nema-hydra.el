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
   ("H" hydra-move-splitter-left)
   ("J" hydra-move-splitter-down)
   ("K" hydra-move-splitter-up)
   ("L" hydra-move-splitter-right)
   ("v" (lambda () (interactive)
	  (split-window-right)
	  (windmove-right))
    "Vertical"
    )
   ("i" (lambda () (interactive)
	  (split-window-below)
	  (windmove-down))
    "Horizonal"
    )
   ("a" ace-window "Ace")
   ("s" ace-swap-window "Swap")
   ("d" ace-delete-window "Close")
   ("o" ace-maximize-window "Maxmize" :color blue)
   ("q" nil "Quit")))

(provide 'nema-hydra)
;;; nema-hydra.el ends here
