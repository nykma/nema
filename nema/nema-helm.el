;;; nema-helm --- Helm configs
;;; Commentary:
"Helm configs"
;;; Code:

(use-package helm
  :delight
  (helm-mode)
  (helm-ff-cache-mode)
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files))
  :config
  (require 'helm-config)
  (helm-mode 1))

(use-package helm-swoop
  ;; See also: https://github.com/ShingoFukuyama/helm-swoop
  :bind
  (("M-i" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all)
   :map isearch-mode-map
   ("M-i" . helm-swoop-from-isearch)
   :map helm-swoop-map
   ("M-i" . helm-multi-swoop-all-from-helm-swoop)
   ("M-m" . helm-multi-swoop-current-mode-from-helm-swoop))
  :config
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)

  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows t)

  ;; Cache causes too much trouble. Disable it.
  (setq helm-ff-keep-cached-candidates nil))

(provide 'nema-helm)

;;; nema-helm.el ends here
