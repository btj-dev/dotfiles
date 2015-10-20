;;; Set up the Emacs package repositories.
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Set the color scheme (must come after package-initialize). Override the 
;; default background color to black.
(require 'color-theme)
(color-theme-initialize)
(load-theme 'zenburn t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black")))))

;; Set up org mode.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Activate major modes based on the interpreter. This is useful for scripts
;; that are saved without an extension.
(add-to-list 'magic-mode-alist '("#!/usr/bin/env python" . python-mode) )
(add-to-list 'magic-mode-alist '("#!/usr/bin/env Rscript" . R-mode) )

;; Set up ESS for R.
(require 'ess-site)
(add-hook 'ess-mode-hook
	  (lambda ()
	    (ess-set-style 'C++ 'quiet)
	    ;; Because
	    ;;                                 DEF GNU BSD K&R C++
	    ;; ess-indent-level                  2   2   8   5   4
	    ;; ess-continued-statement-offset    2   2   8   5   4
	    ;; ess-brace-offset                  0   0  -8  -5  -4
	    ;; ess-arg-function-offset           2   4   0   0   0
	    ;; ess-expression-offset             4   2   8   5   4
	    ;; ess-else-offset                   0   0   0   0   0
	    ;; ess-close-brace-offset            0   0   0   0   0
	    (add-hook 'local-write-file-hooks
		      (lambda ()
			(ess-nuke-trailing-whitespace)))))
(setq ess-nuke-trailing-whitespace-p 'ask)
(setq ess-fancy-comments nil)
(ess-toggle-underscore nil) ;; Turn off converting underscores to <-

;; Enable LaTeX mode for Rtex files.
(setq auto-mode-alist (cons '("\\.Rtex" . tex-mode) auto-mode-alist))

;;; Set up the LaTeX export process.
(setq latex-run-command "texi2dvi --pdf --clean --verbose --batch %f")
(setq org-latex-pdf-process
      (quote ("texi2dvi --pdf --clean --verbose --batch %f" "bibtex %b" "texi2dvi --pdf --clean --verbose --batch %f" "texi2dvi --pdf --clean --verbose --batch %f")))

;;; Enable C mode for CUDA
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c-mode))

;;; Bind C-c C-f to compile
(global-set-key (kbd "C-c C-f") 'compile)

;;; Set up printing size for printing code with syntax hightlighting.
(setq ps-paper-type 'letter
     ps-font-size 8.0
     ps-print-header nil
     ps-landscape-mode nil
     ps-number-of-columns 1)
