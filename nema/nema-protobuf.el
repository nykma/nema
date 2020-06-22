;;; nema-protobuf --- ProtoBuf support
;;; Commentary:
"ProtoBuf support"
;;; Code:

(use-package protobuf-mode
  :delight "protobuf"
  :quelpa (protobuf-mode :fetcher url :url "https://raw.githubusercontent.com/protocolbuffers/protobuf/master/editors/protobuf-mode.el")
  :mode (("\\.proto\\'" . protobuf-mode)))

(provide 'nema-protobuf)

;;; nema-protobuf.el ends here
