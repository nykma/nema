;;; nema-restclient --- REST client
;;; Code:

(use-package restclient
  :config
  ;; since `url-cookies-list' is lack of flexibility
  (setq restclient-inhibit-cookies t))
(use-package company-restclient)

(provide 'nema-restclient)

;;; nema-restclient.el ends here
