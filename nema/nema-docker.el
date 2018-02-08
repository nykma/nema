;;; nema-docker --- Docker and dockerfile settings
;;; Commentary:
"Docker and dockerfile settings"
;;; Code:

(use-package docker
  ;; :config
  ;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  ;; (setq exec-path (append exec-path '("/usr/local/bin")))
  ;; Use "docker-machine env box" command to find out your environment variables
  ;; (setenv "DOCKER_TLS_VERIFY" "1")
  ;; (setenv "DOCKER_HOST" "tcp://10.11.12.13:2376")
  ;; (setenv "DOCKER_CERT_PATH" "/Users/foo/.docker/machine/machines/box")
  ;; (setenv "DOCKER_MACHINE_NAME" "box"))
  )

(use-package dockerfile-mode)

(provide 'nema-docker)

;;; nema-docker.el ends here
