;;; Forge repo settings

;; See also: https://magit.vc/manual/ghub/Forge-Functions-and-Variables.html#Forge-Functions-and-Variables

;; Sample of adding self-hosted gitlab
(add-to-list 'forge-alist
             '("gitlab.my-server.com" ;; Git host
               "gitlab.my-server.com/api/v4" ;; API endpoint
               "gitlab.my-server.com" ;; ID
               forge-gitlab-repository
               ))

;; Make sure your ~/.gitconfig contains account info as follow:

;; [gitlab "gitlab.my-server.com/api/v4"]
;;	user = username

;; So that forge will not prompt you of username.
;; Then, create an access token in http://gitlab.my-server.com/profile/personal_access_tokens
;; and save it in ~/.authinfo.gpg as follow:

;; machine gitlab.my-server.com/api/v4 login username^forge password PERSONAL_ACCESS_TOKEN

;; forge.el ends here
