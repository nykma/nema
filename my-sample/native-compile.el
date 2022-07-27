;;; native-compile --- native-comp support and helper
;;; Commentary:
"Configs for native-comp branch"
;;; Code:

;; 20210303: native-comp generates too much warnings. Disable it.
(if (fboundp 'native-compile-async)
    (setq warning-minimum-level :emergency))

;; Maybe a workaround of
;; Error: Symbol’s function definition is void: cc-bytecomp-is-compiling
(require 'cc-bytecomp)

(setq comp-deferred-compilation t)

;;; native-compile.el ends here
