(require 'nema-customize-group)

(use-package solidity-mode
  :quelpa (emacs-solidity :fetcher github :repo "ethereum/emacs-solidity" :files ("*.el"))
  :mode "\\.sol\\'"
  :bind-keymap
  ("C-c C-g" . solidity-mode-map)
  :config
  (setq solidity-comment-style 'slash)
  (when nema-use-flycheck
    (require 'solidity-flycheck)
    (setq solidity-flycheck-solc-checker-active t
          flycheck-solidity-solc-addstd-contracts t))
  (when (functionp 'company-mode)
    (require 'company-solidity)
    (add-hook 'solidity-mode-hook
	      (lambda ()
	        (set (make-local-variable 'company-backends)
                     '((company-solidity company-capf company-dabbrev-code))))))
  ;; LSP config
  ;; https://github.com/hyperledger-labs/solang-vscode
  ;; cd solang-server && cargo build --release
  (when (and
         (functionp 'lsp)
         (executable-find "solang-server"))
    (add-to-list 'lsp-language-id-configuration '(solidity-mode . "solidity"))
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-stdio-connection (lambda () (executable-find "solang-server")))
      :server-id 'solang
      :language-id 'solidity
      :major-modes '(solidity-mode)
      :priority -1))
    (add-to-list 'company-backends '(company-lsp))))
