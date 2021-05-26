;; Transparent frame background

(use-package transwin
  :demand t
  :bind
  (("s-p" . transwin-increment-frame-transparent)
   ("s-o" . transwin-decrement-frame-transparent))
  :hook
  ((server-after-make-frame . (lambda () (transwin--set-transparency 95)))))
