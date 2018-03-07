;;; nema-org --- Org
;;; Commentary:
"org-mode enhancement"
;;; Code:

(use-package htmlize
  :defer t)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package org
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :config
  (require 'org-install)
  ;; XeLaTeX config for CJK PDF exporting
  ;; use `Source Han Serif' for main font and `Inziu Iosevka' for monospace font
  ;; SEEALSO: https://kuanyui.github.io/2014/05/10/emacs-org-mode-xelatex-output-chinese-pdf
  (setq org-latex-classes
        '(("article"
           "
\\documentclass[12pt,a4paper]{article}
\\usepackage[margin=2cm]{geometry}
\\usepackage{fontspec}
\\setromanfont{Source Han Serif SC}
\\usepackage{etoolbox}  % Quote 部份的字型設定
\\newfontfamily\\quotefont{Source Han Serif SC}
\\AtBeginEnvironment{quote}{\\quotefont\\small}
\\setmonofont[Scale=0.9]{Inziu Iosevka Slab SC}
\\XeTeXlinebreaklocale ``zh''
\\XeTeXlinebreakskip = 0pt plus 1pt
\\linespread{1.36}
% [FIXME] ox-latex 的設計不良導致 hypersetup 必須在這裡插入
\\usepackage{hyperref}
\\hypersetup{
  colorlinks=true, %把紅框框移掉改用字體顏色不同來顯示連結
  linkcolor=[rgb]{0,0.37,0.53},
  citecolor=[rgb]{0,0.47,0.68},
  filecolor=[rgb]{0,0.37,0.53},
  urlcolor=[rgb]{0,0.37,0.53},
  pagebackref=true,
  linktoc=all,}
"
           ("\\section{%s}" . "\\section*{%s}")
           ("\\subsection{%s}" . "\\subsection*{%s}")
           ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
           ("\\paragraph{%s}" . "\\paragraph*{%s}")
           ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
          ))
  ;; [FIXME]
  ;; 原本是不要讓 org 插入 hypersetup（因為 org-mode 這部份設計成沒辦法自訂，或許可以去 report 一下？）
  ;; 改成自行插入，但這樣 pdfcreator 沒辦法根據 Emacs 版本插入，pdfkeyword 也會無效...幹。
  (setq org-latex-with-hyperref t)
  ;; 把預設的 fontenc 拿掉
  ;; 經過測試 XeLaTeX 輸出 PDF 時有 fontenc[T1]的話中文會無法顯示。
  ;; hyperref 也拿掉，改從 classes 處就插入，原因見上面 org-latex-with-hyperref 的說明。
  (setq org-latex-default-packages-alist
        '(("" "hyperref" nil)
          ("AUTO" "inputenc" t)
          ("" "fixltx2e" nil)
          ("" "graphicx" t)
          ("" "longtable" nil)
          ("" "float" nil)
          ("" "wrapfig" nil)
          ("" "rotating" nil)
          ("normalem" "ulem" t)
          ("" "amsmath" t)
          ("" "textcomp" t)
          ("" "marvosym" t)
          ("" "wasysym" t)
          ("" "multicol" t)  ; 這是我另外加的，因為常需要多欄位文件版面。
          ("" "amssymb" t)
          "\\tolerance=1000"))
  ;; Use XeLaTeX to export PDF in Org-mode
  (setq org-latex-pdf-process
        '("xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"))
  ;; 指定你要用什麼外部 app 來開 pdf 之類的檔案
  (setq org-file-apps '((auto-mode . emacs)
                        ("\\.mm\\'" . default)
                        ("\\.x?html?\\'" . "xdg-open %s")
                        ("\\.pdf\\'" . emacs)
                        ("\\.jpg\\'" . emacs)))
  ;; Log clock when a job is done.
  (setq org-log-done 'clock))

(provide 'nema-org)

;;; nema-org.el ends here
