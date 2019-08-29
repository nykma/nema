;;; Sublimity: smooth-scrolling, minimap and distraction-free mode.

(use-package sublimity
  :quelpa (sublimity :fetcher github :repo "zk-phi/sublimity")
  :config
  (require 'sublimity-scroll)
  ;; (require 'sublimity-map)
  ;; (require 'sublimity-attractive)
  (sublimity-mode 1))
