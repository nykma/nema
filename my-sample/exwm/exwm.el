;;; nema-exwm --- EXWM config
;;; Commentary:
"EXWM config"
;;; Code:

(require 'nema-customize-group)

(server-mode 1)

;; FOLLOW STEPS IN README.org

;; Status bar in minibuffer when idle
;; (use-package symon
;;   :config
;;   (setq symon-sparkline-type 'bounded
;;         symon-delay 1
;;         symon-refresh-rate 2
;;         symon-monitors '(symon-current-time-monitor
;;                        symon-linux-cpu-monitor
;;                        symon-linux-memory-monitor
;;                        symon-linux-battery-monitor
;;                        symon-linux-network-rx-monitor
;;                        symon-linux-network-tx-monitor))

;;   (symon-mode))

;; EXWM core config: a minimal available version.
(use-package exwm
  :config
  (require 'exwm-config)

  (setq exwm-workspace-number 10)
  ;; Make class name the buffer name
  (add-hook 'exwm-update-class-hook
            (lambda ()
              (exwm-workspace-rename-buffer exwm-class-name)))

  (setq exwm-input-global-keys
          `(
            ;; 's-r': Reset (to line-mode).
            ([?\s-r] . exwm-reset)
            ;; 's-w': Switch workspace.
            ([?\s-w] . exwm-workspace-switch)
            ;; 's-&': Launch application.
            ([?\s-&] . (lambda (command)
                         (interactive (list (read-shell-command "$ ")))
                         (start-process-shell-command command nil command)))
            ;; 's-N': Switch to certain workspace.
            ,@(mapcar (lambda (i)
                        `(,(kbd (format "s-%d" i)) .
                          (lambda ()
                            (interactive)
                            (exwm-workspace-switch-create ,i))))
                      (number-sequence 0 9))))
  (setq exwm-input-simulation-keys
          '(([?\C-b] . [left])
            ([?\C-f] . [right])
            ([?\C-p] . [up])
            ([?\C-n] . [down])
            ([?\C-a] . [home])
            ([?\C-e] . [end])
            ([?\M-v] . [prior])
            ([?\C-v] . [next])
            ([?\C-d] . [delete])
            ([?\C-k] . [S-end delete])))

  (exwm-enable)
  (exwm-config-ido)

  (when (executable-find "xrandr")
    (require 'exwm-randr)
    (setq exwm-randr-workspace-output-plist '(1 "DP-0" 2 "DVI-D-0"))
    (add-hook 'exwm-randr-screen-change-hook (lambda () (start-process-shell-command "xrandr" nil "xrandr --output DVI-D-0 --auto --output DP-0 --primary --auto --below DVI-D-0")))
    (exwm-randr-enable))

  (require 'exwm-systemtray)
  (exwm-systemtray-enable)

  (when (eq nema-emacs-completion-engine 'helm)
    (use-package helm-exwm
      :quelpa (helm-exwm :fetcher github :repo "emacs-helm/helm-exwm" :files ("helm-exwm.el")))))

;;; nema-exwm.el ends here
