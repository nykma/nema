(use-package ibuffer
  :bind (("C-x C-b" . ibuffer))
  ;; Auto update mode seems to be a huge impact to performance.
  ;; :hook ((ibuffer . ibuffer-auto-mode))
  :config
  (setq ibuffer-expert t
        ibuffer-show-empty-filter-groups nil)
  (setq ibuffer-formats
        '((mark modified read-only " "
                (name 18 18 :left :elide)
                " "
                (size 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " "
                project-relative-file))))

(use-package ibuffer-projectile
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-projectile-set-filter-groups)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))
