;; org-mode export settings for Chinese characters

;; XeLaTeX config for CJK PDF exporting
;; use `Source Han Serif' for main font and `Inziu Iosevka' for monospace font
;; SEEALSO: https://kuanyui.github.io/2014/05/10/emacs-org-mode-xelatex-output-chinese-pdf

(setq org-latex-classes
        '(("article"
           "
\\documentclass[12pt,a4paper]{article}
[DEFAULT-PACKAGES]
[PACKAGES]

\\setsansfont{Source Han Sans SC}
\\setromanfont{Source Han Serif SC}
\\setmonofont[Scale=0.9]{Inziu Iosevka Slab SC}
\\newfontfamily\\quotefont{Source Han Serif SC}
\\newfontfamily\\headfootfont{Source Han Sans SC}
\\AtBeginEnvironment{quote}{\\quotefont\\small}
\\XeTeXlinebreaklocale ``zh''
\\XeTeXlinebreakskip = 0pt plus 1pt
\\linespread{1.0}
\\hypersetup{
  colorlinks=true,
  linkcolor=[rgb]{0,0.37,0.53},
  citecolor=[rgb]{0,0.47,0.68},
  filecolor=[rgb]{0,0.37,0.53},
  urlcolor=[rgb]{0,0.37,0.53},
  pagebackref=true,
  linktoc=all,}

\\renewcommand{\\headrulewidth}{0.4pt}
\\renewcommand{\\footrulewidth}{0.4pt}
\\pagestyle{fancy}
\\fancyfoot[C]{} % Clear page number
\\fancyhead[RE]{\\headfootfont\\small\\leftmark} % 在偶数页的右侧显示章名
\\fancyhead[LO]{\\headfootfont\\small\\rightmark} % 在奇数页的左侧显示小节名
\\fancyhead[LE,RO]{\\headfootfont\\small~\\thepage~} % 在偶数页的左侧，奇数页的右侧显示页码

[EXTRA]
"
           ("\\section{%s}" . "\\section*{%s}")
           ("\\subsection{%s}" . "\\subsection*{%s}")
           ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
           ("\\paragraph{%s}" . "\\paragraph*{%s}")
           ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;; [FIXME]
;; 原本是不要讓 org 插入 hypersetup（因為 org-mode 這部份設計成沒辦法自訂，或許可以去 report 一下？
;; 改成自行插入，但這樣 pdfcreator 沒辦法根據 Emacs 版本插入，pdfkeyword 也會無效...幹。
(setq org-latex-with-hyperref t)

;; Export source code using minted
(setq org-latex-listings 'minted)

(setq org-latex-default-packages-alist
      '(("" "nopageno" t)
        ("" "hyperref" t)
        ("" "fontspec" t)
        ("" "etoolbox" t) ;; Quote 部份的字型設定
        ("margin=2cm" "geometry" nil)
        ;; ("AUTO" "inputenc" t)
        ;; ("" "fixltx2e" nil)
        ("dvipdfmx" "graphicx" t)
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
        ("" "fancyhdr" nil) ;; 页眉页脚
        ("cache=false" "minted" nil) ;; Code color
        "\\tolerance=1000"))
