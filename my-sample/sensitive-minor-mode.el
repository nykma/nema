;;; sensitive-minor-mode.el --- Minor mode for sensitive files

;; Copyright (C) 2010-2013

;; Author: Andreas Spindler <info@visualco.de>
;; Maintained at: <http://www.visualco.de>
;; Keywords: Emacs, Lisp
;; Modified by: Nyk Ma <i@nyk.ma>

;; For sensitive files like password Lids. It disables backup creation and auto
;; saving.

;; This program  is free  software; you  can redistribute  it and/or  modify it
;; under the terms of  the GNU General Public License as  published by the Free
;; Software Foundation,  either version 3 of  the License, or (at  your option)
;; any later version.

;; This program is distributed in the hope  that it will be useful, but WITHOUT
;; ANY  WARRANTY;  without even  the  implied  warranty of  MERCHANTABILITY  or
;; FITNESS FOR  A PARTICULAR PURPOSE.  See the  GNU General Public  License for
;; more details.

;; You should have received a copy of the GNU General Public License along with
;; this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Define `sensitive-minor-mode' to disables backup and auto-save files (based on code from
;; `http://anirudhs.chaosnet.org/blog/2005.01.21.html').

;;; Code:

(eval-when-compile
  (require 'cl))

(defvar sensitive-minor-mode nil
  "Sensitive file minor mode.")

;;;###autoload
(define-minor-mode sensitive-minor-mode
  "For sensitive files like password lists.
Disables backup creation and auto saving in the current buffer.

With no argument toggles the mode. Non-null prefix argument turn on the mode,
null prefix argument turn off the mode."
  ;; The initial value.
  nil
  ;; The indicator for the mode line.
  " SENSITIVE"
  ;; The minor mode bindings.
  nil
  (if (symbol-value sensitive-minor-mode)
      (progn
        ;; disable backups
        (set (make-local-variable 'backup-inhibited) t)
        ;; disable auto-save
        (if auto-save-default
            (auto-save-mode -1))
        ;; Disable EPA file auto save
        (set (make-local-variable 'epa-file-inhibit-auto-save) t))
    ;; resort to default value of backup-inhibited
    (kill-local-variable 'backup-inhibited)
    ;; resort to default auto save setting
    (if auto-save-default
        (auto-save-mode 1)))
  )

(provide 'sensitive-minor-mode)

;;; sensitive-minor-mode.el ends here
