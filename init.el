;;; Emacs Initialization File.

;; Set user emacs directory for Windows.
(setq user-emacs-directory "C:/Users/sanle/AppData/Roaming/.emacs.d/")

;; Packages.
(require 'package)

(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
	("MELPA"        . "https://melpa.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("nongnu"       . "https://elpa.nongnu.org/nongnu/"))
      package-archive-priorities
      '(("GNU ELPA"     . 20)
        ("MELPA"        . 10)
        ("MELPA Stable" . 15)
        ("nongnu"       . 0)))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;; Dired settings.
(use-package dired
  :ensure nil
  :init (setq initial-buffer-choice "C:/Users/sanle/Documents/")
  :hook (dired-mode . dired-hide-details-mode)
  :config (setq dired-free-space nil))

;; LaTeX settings.
(use-package auctex
  :config
  (setq prettify-symbols-unprettify-at-point t)

  (add-hook 'LaTeX-mode-hook
	    (lambda ()
	      (add-to-list
	       'prettify-symbols-alist '("\\dots"       . 8230))
	      (add-to-list
	       'prettify-symbols-alist '("\\mathbb{C}"  . 8450))
	      (add-to-list
	       'prettify-symbols-alist '("\\mathbb{E}"  . 120124))
	      (add-to-list
	       'prettify-symbols-alist '("\\mathbb{F}"  . 120125))
	      (add-to-list
	       'prettify-symbols-alist '("\\mathbb{M}"  . 120132))
	      (add-to-list
	       'prettify-symbols-alist '("\\varnothing" . 8960))
    
	      (prettify-symbols-mode t)))
  
  (setq LaTeX-electric-left-right-brace  t
	TeX-electric-escape              nil
	TeX-electric-math                '("$" . "$")
	TeX-electric-sub-and-superscript t
	TeX-indent-open-delimiters       ""
	TeX-electric-backslash           t))

;(use-package cdlatex
;  :after auctex
;  :hook (LaTeX-mode . turn-on-cdlatex))

;; Magit settings.
(use-package magit
  :ensure t)

;; Org-Mode settings.
(use-package org
  :ensure t)

;; Text mode settings.
(use-package text-mode
  :ensure nil
  :hook (text-mode . turn-on-auto-fill)
  :config (setq fill-column 70))

;; Set everything to UTF-8.
(set-language-environment     "UTF-8")
(setq locale-coding-system    'utf-8
      prefer-coding-system    'utf-8
      default-coding-systems  'utf-8
      terminal-coding-system  'utf-8
      keyboard-coding-system  'utf-8
      selection-coding-system 'utf-8)

;; Appearance.
(push '(tool-bar-lines . 0)         default-frame-alist)
(push '(height         . 49)        default-frame-alist)
(push '(width          . 81)        default-frame-alist)
(push '(cursor-color   . "magenta") default-frame-alist)

(add-hook 'after-change-major-mode-hook 'column-number-mode)
(blink-cursor-mode  0)
(tool-bar-mode      0)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "white smoke"))))
 '(menu-bar ((t (:background "pink" :foreground "black"))))
 '(mode-line ((t (:background "pink" :foreground "black")))))

;;; End.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
