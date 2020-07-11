;;; native-compile --- Native compile support and helper function
;;; Commentary:
"Native compile helper function"
;;; Code:

(require 'nema-customize-group)
(require 's) ;; s-contains?/2

(defcustom nema-native-compile-ignore-names '()
  "Packages' name which should be ignored when native-compiling
Default is empty list"
  :tag "Native compile ignore list"
  :group 'nema
  :type '(repeat string))

(defun nema//string-contains-keyword (haystack needle-list)
  "Detect each string in NEEDLE-LIST is found in HAYSTACK string.

Return t if any one in NEEDLE-LIST matches."
  (catch 'found
    (dolist (needle needle-list)
      (when (s-contains? needle haystack)
        (throw 'found t)))))

(defun nema//native-compile-target-p (path)
  "Judge whether PATH is native compilling target."
  (and (not (nema//string-contains-keyword path nema-native-compile-ignore-names))
       (file-directory-p path)))

(defun nema/native-compile ()
  "Recursively compile elpa folder using `native-compile-async'."
  (interactive)
  (unless (fboundp 'native-compile-async)
    (error "This Emacs is not compatible with native compiling.  Should build a feature/native-comp version"))
  (switch-to-buffer-other-window "*Async-native-compile-log*")
  (let* ((dirs (directory-files (expand-file-name "elpa" user-emacs-directory) t "^[^\\.]"))
         (target (seq-filter #'nema//native-compile-target-p dirs)))
    (native-compile-async target t)))

;;; native-compile.el ends here
