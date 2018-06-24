;;; nema-exwm --- EXWM config
;;; Commentary:
"EXWM config"
;;; Code:

;; FOLLOW STEPS IN README.org

;; Status bar in minibuffer when idle
(use-package symon
  :config
  (setq symon-sparkline-type 'bounded
        symon-delay 1
        symon-refresh-rate 2
        symon-monitors '(symon-current-time-monitor
                       symon-linux-cpu-monitor
                       symon-linux-memory-monitor
                       symon-linux-battery-monitor
                       symon-linux-network-rx-monitor
                       symon-linux-network-tx-monitor))

  (symon-mode))

;; EXWM core config: a minimal available version.
(use-package exwm
  :config
  (require 'exwm-config)
  (exwm-config-default)
  (require 'exwm-systemtray)
  (exwm-systemtray-enable))

;;; nema-exwm.el ends here
