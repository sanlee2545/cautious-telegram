;;; Emacs Initialization File.

;; Packages.
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

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

(use-package auctex)
(use-package cdlatex)
(use-package magit)
(use-package org)

;; Dired settings.
(setq dired-free-space nil)
(setq initial-buffer-choice "~/Documents/")

(use-package dired
  :ensure nil
  :hook (dired-mode . dired-hide-details-mode)
  :config
  )

;; Set everything to UTF-8.
(set-language-environment     "UTF-8")
(setq locale-coding-system    'utf-8
      prefer-coding-system    'utf-8
      default-coding-systems  'utf-8
      terminal-coding-system  'utf-8
      keyboard-coding-system  'utf-8
      selection-coding-system 'utf-8)

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
	TeX-electric-backslash           t)
  )

;; Text mode settings.
(use-package text-mode
  :ensure nil
  :hook (text-mode . turn-on-auto-fill)
  :config
  )

;; Appearance.
(push '(tool-bar-lines . 0)         default-frame-alist)
(push '(height         . 48)        default-frame-alist)
(push '(width          . 80)        default-frame-alist)
(push '(cursor-color   . "magenta") default-frame-alist)

(add-hook 'after-change-major-mode-hook 'column-number-mode)
(blink-cursor-mode  0)
(set-face-attribute 'default nil :background "white smoke")
(tool-bar-mode      0)

;;; End.
