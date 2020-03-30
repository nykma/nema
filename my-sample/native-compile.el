;;; native-compile --- Native compile support and helper function
;;; Commentary:
"Native compile helper function"
;;; Code:

(defun nema/native-compile ()
  "Recursively compile elpa folder using `native-compile-async'."
  (interactive)
  (unless (fboundp 'native-compile-async)
    (error "This Emacs is not compatible with native compiling.  Should build a feature/native-comp version"))
  (let* ((target (expand-file-name "elpa" user-emacs-directory)))
    (native-compile-async target t)
    (switch-to-buffer-other-window comp-async-buffer-name)))

;;; native-compile.el ends here
