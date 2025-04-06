(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace t)
 '(LaTeX-indent-environment-list
   '(("verbatim" current-indentation) ("verbatim*" current-indentation)
     ("filecontents" current-indentation) ("filecontents*" current-indentation)
     ("tabular" LaTeX-indent-tabular) ("tabular*" LaTeX-indent-tabular)
     ("array" LaTeX-indent-tabular) ("eqnarray" LaTeX-indent-tabular)
     ("eqnarray*" LaTeX-indent-tabular) ("align" LaTeX-indent-tabular)
     ("align*" LaTeX-indent-tabular) ("aligned" LaTeX-indent-tabular)
     ("alignat" LaTeX-indent-tabular) ("alignat*" LaTeX-indent-tabular)
     ("alignedat" LaTeX-indent-tabular) ("xalignat" LaTeX-indent-tabular)
     ("xalignat*" LaTeX-indent-tabular) ("xxalignat" LaTeX-indent-tabular)
     ("flalign" LaTeX-indent-tabular) ("flalign*" LaTeX-indent-tabular)
     ("split" LaTeX-indent-tabular) ("matrix" LaTeX-indent-tabular)
     ("pmatrix" LaTeX-indent-tabular) ("bmatrix" LaTeX-indent-tabular)
     ("Bmatrix" LaTeX-indent-tabular) ("vmatrix" LaTeX-indent-tabular)
     ("Vmatrix" LaTeX-indent-tabular) ("smallmatrix" LaTeX-indent-tabular)
     ("cases" LaTeX-indent-tabular) ("longtable" LaTeX-indent-tabular)
     ("longtable*" LaTeX-indent-tabular) ("matrix*" LaTeX-indent-tabular)
     ("pmatrix*" LaTeX-indent-tabular) ("bmatrix*" LaTeX-indent-tabular)
     ("Bmatrix*" LaTeX-indent-tabular) ("vmatrix*" LaTeX-indent-tabular)
     ("Vmatrix*" LaTeX-indent-tabular) ("smallmatrix*" LaTeX-indent-tabular)
     ("psmallmatrix" LaTeX-indent-tabular) ("psmallmatrix*" LaTeX-indent-tabular)
     ("bsmallmatrix" LaTeX-indent-tabular) ("bsmallmatrix*" LaTeX-indent-tabular)
     ("vsmallmatrix" LaTeX-indent-tabular) ("vsmallmatrix*" LaTeX-indent-tabular)
     ("Vsmallmatrix" LaTeX-indent-tabular) ("Vsmallmatrix*" LaTeX-indent-tabular)
     ("dcases" LaTeX-indent-tabular) ("dcases*" LaTeX-indent-tabular)
     ("rcases" LaTeX-indent-tabular) ("rcases*" LaTeX-indent-tabular)
     ("drcases" LaTeX-indent-tabular) ("drcases*" LaTeX-indent-tabular)
     ("cases*" LaTeX-indent-tabular) ("stabular" LaTeX-indent-tabular)
     ("stabular*" LaTeX-indent-tabular) ("supertabular" LaTeX-indent-tabular)
     ("supertabular*" LaTeX-indent-tabular) ("mpsupertabular" LaTeX-indent-tabular)
     ("mpsupertabular*" LaTeX-indent-tabular) ("tblr" LaTeX-indent-tabular)
     ("longtblr" LaTeX-indent-tabular) ("talltblr" LaTeX-indent-tabular)
     ("booktabs" LaTeX-indent-tabular) ("+array" LaTeX-indent-tabular)
     ("+matrix" LaTeX-indent-tabular) ("+bmatrix" LaTeX-indent-tabular)
     ("+Bmatrix" LaTeX-indent-tabular) ("+pmatrix" LaTeX-indent-tabular)
     ("+vmatrix" LaTeX-indent-tabular) ("+Vmatrix" LaTeX-indent-tabular)
     ("+cases" LaTeX-indent-tabular) ("tabularx" LaTeX-indent-tabular)
     ("tabulary" LaTeX-indent-tabular) ("xltabular" LaTeX-indent-tabular)
     ("xtabular" LaTeX-indent-tabular) ("xtabular*" LaTeX-indent-tabular)
     ("mpxtabular" LaTeX-indent-tabular) ("mpxtabular*" LaTeX-indent-tabular)
     ("displaymath") ("equation") ("picture") ("tabbing") ("gather") ("gather*")
     ("gathered") ("equation*") ("multline") ("multline*") ("macrocode")
     ("macrocode*")))
 '(TeX-electric-escape nil)
 '(TeX-electric-math '("$" . "$"))
 '(TeX-electric-sub-and-superscript t)
 '(TeX-indent-open-delimiters "")
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(doc-view-continuous t)
 '(font-latex-fontify-script nil)
 '(font-latex-script-display '(nil))
 '(initial-buffer-choice "~/Documents/")
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages '(auctex cdlatex magit))
 '(scroll-bar-mode nil)
 '(text-mode-hook '(turn-on-auto-fill text-mode-hook-identify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "white smoke" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 98 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
 '(cursor ((t (:background "magenta")))))

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(require 'ob-core)
(org-babel-do-load-languages 'org-babel-load-languages
			     '((eshell . t) (python . t)))

(setq dired-free-space nil)

(defun my-dired-init () (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'my-dired-init)

(push '(tool-bar-lines . 0) default-frame-alist)
(push '(height . 48) default-frame-alist)
(push '(width . 84) default-frame-alist)

(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-hook 'TeX-mode-hook #'prettify-symbols-mode)
(setq prettify-symbols-unprettify-at-point t)

(global-visual-line-mode 1)
