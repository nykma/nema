;;; eal --- Emacs Application Framework
;;; Commentary:
"Emacs Application Framework. For Linux & X11 user only.

Dependencies are not checked on booting. Use M-x
nema-eaf-check-dep to check manually.

For i3wm users: Since window focusing policy of i3 does not going
well with EAF, when using an EAF buffer, make sure to move your
mouse out of this buffer area to make Emacs keybinding work.

See also:
https://github.com/manateelazycat/emacs-application-framework/issues/237

Keybindings:
https://github.com/manateelazycat/emacs-application-framework/wiki/Keybindings
"
;;; Code:

(defun nema--pip-package-p (package-name)
  "Test if PACKAGE-NAME is installed."
  (let* ((buffer-name "*nema-pip-probe*")
         (cmd (concat "pip3 show " package-name))
         (result (shell-command cmd buffer-name)))
    (kill-buffer buffer-name)
    (eq result 0)))

(defun nema--pip-packages-p (package-list)
  "Test PACKAGE-LIST of pip packages."
  (if package-list
      (if (nema--pip-package-p (car package-list))
          (nema--pip-packages-p (cdr package-list))
        (error (concat "EAF: pip3 dependency: "
                       (car package-list)
                       " not found. Consider install it." ))
        nil)
    t))

(defun nema-eaf-check-dep ()
  "Check depenency of EAF."
  (interactive "P")
  (let* ((package-list '("dbus-python"
                         "python-xlib"
                         "pyqt5"
                         "pyqtwebengine"
                         "pymupdf"
                         "grip"
                         "qrcode"
                         "feedparser"
                         "aria2p"))
         (package-result (nema--pip-packages-p package-list)))
    package-result))

;; It cannot use quelpa since it lacks some info when packaging into
;; ELPA.
(let* ((eaf-repo "https://github.com/manateelazycat/emacs-application-framework.git")
       (eaf-dir (expand-file-name "my/eaf" user-emacs-directory))
       (eaf-dir-exists (file-directory-p eaf-dir)))
  (unless eaf-dir-exists
    (shell-command (concat "git clone "
                           eaf-repo
                           " "
                           eaf-dir)))
  (eval `(use-package eaf
      :load-path ,eaf-dir
      :custom
      (eaf-find-alternate-file-in-dired t)
      (eaf-config-location ,(expand-file-name ".cache/eaf" user-emacs-directory))
      :config
      ;; Make EAF the default browser of Emacs
      (setq browse-url-function 'eaf-open-browser)
      (defalias 'browse-web #'eaf-open-browser)

      ;; browser settings
      (setq eaf-browser-search-engines 'duckduckgo)
      (eaf-setq eaf-browser-blank-page-url "about:blank")
      (eaf-setq eaf-browser-default-zoom "1.25") ;; I'm using HiDPI display
      (eaf-setq eaf-browser-dark-mode ,(if (eq nema-theme-style 'dark) "true" "false"))

      ;; org intergration
      (defun nema--eaf-org-open-file (file &optional link)
        "An wrapper function on `eaf-open'."
        (eaf-open file))

      ;; use `emacs-application-framework' to open PDF file: link
      (add-to-list 'org-file-apps '("\\.pdf\\'" . nema--eaf-org-open-file)))))

;;; eal.el ends here
