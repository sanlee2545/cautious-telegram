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

;; Don't know what this is.
(org-babel-do-load-languages 'org-babel-load-languages
			     '((eshell . t) (python . t)))

;; Dired settings.
(setq dired-free-space nil)
(defun my-dired-init () (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'my-dired-init)
(setq initial-buffer-choice "~/Documents/")

;; Frame size.
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(height . 48)        default-frame-alist)
(push '(width . 84)         default-frame-alist)

;; Show columns in mode line.
(column-number-mode t)

;; Set everything to UTF-8.
(set-language-environment    "UTF-8")
(setq locale-coding-system   'utf-8)
(prefer-coding-system        'utf-8)
(set-default-coding-systems  'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)

;; LaTeX settings.
(add-hook 'LaTeX-mode-hook (lambda ()
			   (add-to-list 'prettify-symbols-alist
					'("\\mathbb{E}" . 120124))
			   (define-abbrev LaTeX-mode-abbrev-table
			     "\\ex" "\\mathbb{E}" nil)
			   (define-abbrev LaTeX-mode-abbrev-table
			     "\\pr" "\\mathbb{P}" nil)
			   (prettify-symbols-mode t)
			   (abbrev-mode t)))

(setq prettify-symbols-unprettify-at-point t)
(setq LaTeX-electric-left-right-brace      t)
(setq TeX-electric-escape                  nil)
(setq TeX-electric-math                    '("$" . "$"))
(setq TeX-electric-sub-and-superscript     t)
(setq TeX-indent-open-delimiters           "")
(setq TeX-electric-backslash               t)

;; Text mode settings.
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'text-mode-hook-identify)

;; Appearance.
(set-face-attribute 'default nil :background "white smoke")
(set-face-attribute 'cursor nil :background "magenta")
(blink-cursor-mode 0)
(tool-bar-mode 0)

;(global-visual-line-mode 1)
