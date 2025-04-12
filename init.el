;;; Emacs Initialization File.

;;; Packages.
(require 'package)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
	("MELPA"        . "https://melpa.org/packages/")
	("ORG"          . "https://orgmode.org/elpa/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("nongnu"       . "https://elpa.nongnu.org/nongnu/"))
      package-archive-priorities
      '(("GNU ELPA"     . 20)
        ("MELPA"        . 15)
        ("ORG"          . 10)
        ("MELPA Stable" . 5)
        ("nongnu"       . 0)))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auctex)
(use-package cdlatex)
(use-package magit)
(use-package org)

;;; Set some values.

(org-babel-do-load-languages 'org-babel-load-languages
			     '((eshell . t) (python . t)))


(setq dired-free-space nil)
(defun my-dired-init () (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'my-dired-init)
(setq initial-buffer-choice "~/Documents/")

(push '(tool-bar-lines . 0) default-frame-alist)
(push '(height . 48) default-frame-alist)
(push '(width . 84) default-frame-alist)

(column-number-mode t)

(set-language-environment    "UTF-8")
(setq locale-coding-system   'utf-8)
(prefer-coding-system        'utf-8)
(set-default-coding-systems  'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)

(dolist (mode
         '(tool-bar-mode
           blink-cursor-mode))
  (funcall mode 0))

(add-hook 'TeX-mode-hook #'prettify-symbols-mode)
(setq prettify-symbols-unprettify-at-point t)
;(setq font-latex-fontify-script nil)
;(setq font-latex-script-display '(nil))

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'text-mode-hook-identify)

(set-face-attribute 'default nil :background "white smoke")
(set-face-attribute 'cursor nil :background "magenta")

;(global-visual-line-mode 1)

;(add-hook 'TeX-mode-hook
;	  (lambda ()
;	    (add-to-list 'tex-prettify-symbols-alist
;			 '("\\mathbb{E}" . 120124))))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(LaTeX-electric-left-right-brace t)
;;  '(LaTeX-indent-environment-list
;;    '(("verbatim" current-indentation) ("verbatim*" current-indentation)
;;      ("filecontents" current-indentation) ("filecontents*" current-indentation)
;;      ("tabular" LaTeX-indent-tabular) ("tabular*" LaTeX-indent-tabular)
;;      ("array" LaTeX-indent-tabular) ("eqnarray" LaTeX-indent-tabular)
;;      ("eqnarray*" LaTeX-indent-tabular) ("align" LaTeX-indent-tabular)
;;      ("align*" LaTeX-indent-tabular) ("aligned" LaTeX-indent-tabular)
;;      ("alignat" LaTeX-indent-tabular) ("alignat*" LaTeX-indent-tabular)
;;      ("alignedat" LaTeX-indent-tabular) ("xalignat" LaTeX-indent-tabular)
;;      ("xalignat*" LaTeX-indent-tabular) ("xxalignat" LaTeX-indent-tabular)
;;      ("flalign" LaTeX-indent-tabular) ("flalign*" LaTeX-indent-tabular)
;;      ("split" LaTeX-indent-tabular) ("matrix" LaTeX-indent-tabular)
;;      ("pmatrix" LaTeX-indent-tabular) ("bmatrix" LaTeX-indent-tabular)
;;      ("Bmatrix" LaTeX-indent-tabular) ("vmatrix" LaTeX-indent-tabular)
;;      ("Vmatrix" LaTeX-indent-tabular) ("smallmatrix" LaTeX-indent-tabular)
;;      ("cases" LaTeX-indent-tabular) ("longtable" LaTeX-indent-tabular)
;;      ("longtable*" LaTeX-indent-tabular) ("matrix*" LaTeX-indent-tabular)
;;      ("pmatrix*" LaTeX-indent-tabular) ("bmatrix*" LaTeX-indent-tabular)
;;      ("Bmatrix*" LaTeX-indent-tabular) ("vmatrix*" LaTeX-indent-tabular)
;;      ("Vmatrix*" LaTeX-indent-tabular) ("smallmatrix*" LaTeX-indent-tabular)
;;      ("psmallmatrix" LaTeX-indent-tabular) ("psmallmatrix*" LaTeX-indent-tabular)
;;      ("bsmallmatrix" LaTeX-indent-tabular) ("bsmallmatrix*" LaTeX-indent-tabular)
;;      ("vsmallmatrix" LaTeX-indent-tabular) ("vsmallmatrix*" LaTeX-indent-tabular)
;;      ("Vsmallmatrix" LaTeX-indent-tabular) ("Vsmallmatrix*" LaTeX-indent-tabular)
;;      ("dcases" LaTeX-indent-tabular) ("dcases*" LaTeX-indent-tabular)
;;      ("rcases" LaTeX-indent-tabular) ("rcases*" LaTeX-indent-tabular)
;;      ("drcases" LaTeX-indent-tabular) ("drcases*" LaTeX-indent-tabular)
;;      ("cases*" LaTeX-indent-tabular) ("stabular" LaTeX-indent-tabular)
;;      ("stabular*" LaTeX-indent-tabular) ("supertabular" LaTeX-indent-tabular)
;;      ("supertabular*" LaTeX-indent-tabular) ("mpsupertabular" LaTeX-indent-tabular)
;;      ("mpsupertabular*" LaTeX-indent-tabular) ("tblr" LaTeX-indent-tabular)
;;      ("longtblr" LaTeX-indent-tabular) ("talltblr" LaTeX-indent-tabular)
;;      ("booktabs" LaTeX-indent-tabular) ("+array" LaTeX-indent-tabular)
;;      ("+matrix" LaTeX-indent-tabular) ("+bmatrix" LaTeX-indent-tabular)
;;      ("+Bmatrix" LaTeX-indent-tabular) ("+pmatrix" LaTeX-indent-tabular)
;;      ("+vmatrix" LaTeX-indent-tabular) ("+Vmatrix" LaTeX-indent-tabular)
;;      ("+cases" LaTeX-indent-tabular) ("tabularx" LaTeX-indent-tabular)
;;      ("tabulary" LaTeX-indent-tabular) ("xltabular" LaTeX-indent-tabular)
;;      ("xtabular" LaTeX-indent-tabular) ("xtabular*" LaTeX-indent-tabular)
;;      ("mpxtabular" LaTeX-indent-tabular) ("mpxtabular*" LaTeX-indent-tabular)
;;      ("displaymath") ("equation") ("picture") ("tabbing") ("gather") ("gather*")
;;      ("gathered") ("equation*") ("multline") ("multline*") ("macrocode")
;;      ("macrocode*")))
;;  '(TeX-electric-escape nil)
;;  '(TeX-electric-math '("$" . "$"))
;;  '(TeX-electric-sub-and-superscript t)
;;  '(TeX-indent-open-delimiters "")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
