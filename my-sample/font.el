;;; font --- Sample font setting
;;; Commentary:
"Sample font setting. Copied from https://github.com/DogLooksGood/meomacs/blob/master/laf.org#font-families"
;;; Code:

(defvar nema-fonts '((default . "VictorMono Nerd Font")
                        (unicode . "LXGW WenKai")
                        (modeline . "Source Serif Pro")
                        (fixed . "Sarasa Mono SC")
                        (variable . "Bembo Std"))
  "Fonts to use.")
(defvar nema--font-size 12 "Font size")

(defun nema//get-font-family (key)
  (alist-get key nema-fonts))

(defun nema//generate-font-spec (key)
  (format "%s-%d"
          (nema//get-font-family key)
          nema--font-size))

(defun nema//load-base-font ()
  "Load the default font for ascii characters."
  (let* ((font-spec (nema//generate-font-spec 'default)))
    (set-frame-parameter nil 'font font-spec)
    (add-to-list 'default-frame-alist (cons 'font font-spec))))

(defun nema//load-face-font ()
  "Load fonts used in faces.

This function must be called after frame creation."
  (let ((modeline-font-spec (nema//generate-font-spec 'modeline))
        (variable-font-spec (nema//generate-font-spec 'variable))
        (fixed-font-spec (nema//generate-font-spec 'fixed)))
    (set-face-attribute 'variable-pitch nil :font variable-font-spec :height 1.1)
    (set-face-attribute 'fixed-pitch nil :font fixed-font-spec)
    (set-face-attribute 'fixed-pitch-serif nil :font fixed-font-spec)
    (set-face-attribute 'mode-line nil :font modeline-font-spec)
    (set-face-attribute 'mode-line-inactive nil :font modeline-font-spec)
    (set-face-attribute 'tab-bar nil :font modeline-font-spec)))

(defun nema//load-ext-font ()
  "Load fonts used for non-ascii characters.

This function must be called after frame creation."
  (let ((font (frame-parameter nil 'font))
        (font-spec (font-spec :family (nema//get-font-family 'unicode))))
    (dolist (charset '(kana han hangul cjk-misc bopomofo symbol))
      (set-fontset-font font charset font-spec))))

(defun nema/load-font()
  "Load all font configuration."
  (interactive)
  (when (display-graphic-p)
    (nema//load-base-font)
    (nema//load-ext-font)
    (nema//load-face-font)))

(if (daemonp)
    (add-hook 'server-after-make-frame-hook #'nema/load-font)
  ;; Else: not in daemon
  (add-hook 'after-init-hook #'nema/load-font))
