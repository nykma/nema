;;; nema-dired --- Dired config
;;; Commentary:
"Dired config"
;;; Code:

;; SEEALSO: https://kuanyui.github.io/2014/06/21/dired-tutorial-and-essential-configs/
(require 'dired)
(require 'dired-x)
(require 'dired+)

(setq dired-dwim-target t)

;; 目錄排在檔案之前。
(defun dired-directory-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))
(add-hook 'dired-after-readin-hook 'dired-directory-sort)

;;使用 KB, MB 等方式顯示檔案大小（這個應該是 Unix 限定...Windows 我不
;;知該怎麼辦）。
(setq dired-listing-switches "-alh")

(provide 'nema-dired)

;;; nema-dired.el ends here
