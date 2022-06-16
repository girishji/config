;; To evaluate a single lisp expression, move your
;; cursor to the right of the last closing
;; parenthesis,
;; and Alt + x eval-last-sexp 【 Ctrl + x Ctrl + e 】.
;; To evaluate all elisp code in a text selection,
;; Alt + x eval-region 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc stuff

(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c l") 'display-line-numbers-mode)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<f2>") 'other-window)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-o") 'open-new-line)

(setq-default fill-column 70) ;; match 'git commit' message

;; This variable, if non-nil, means to fill lines automatically within comments only.
(setq comment-auto-fill-only-comments t)

;; Mark ring (save locations in a buffer and jump around
; You can keep pressing C-SPC after the first invocation of C-u C-SPC
;   to jump to previous locations stored in the mark ring.
(setq set-mark-command-repeat-pop t)
; C-space C-space => to save a mark, C-u C-SPC to jump to first mark
; I find it easier to use registers to mark locations:
;   C-x r <space> and then a letter to mark,
;   C-x r j and a letter to jump back. I can maintain
;   a number of marks, very useful when alternating between multiple buffers

(setq case-fold-search t)   ; make searches case insensitive

;; spell check in only comments section:
;; flyspell checks as you type
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'ess-r-mode-hook 'flyspell-prog-mode)
(setq flyspell-prog-text-faces '(font-lock-comment-face font-lock-doc-face))
;; ispell-comments-and-strings checks spelling of comments already typed:
(eval-after-load 'cc-mode 
  '(define-key c-mode-base-map (kbd "C-c s") 'ispell-comments-and-strings))

(when window-system
  ;;The value is in 1/10pt, so 100 will give you 10pt, etc.
  ;; (set-face-attribute 'default nil
  ;; 		      :family "Menlo" :height 140 :weight 'normal)
  ;; (setq-default line-spacing 4)
  (set-face-attribute 'default nil
  		      :family "Courier New" :height 170 :weight 'normal)
  (setq-default line-spacing 3)
  ;; set window size
  (set-frame-size (selected-frame) 100 62)
  (setq default-directory "~/help")
  )

;; turn of all alarms (visual, audible bells)
(setq ring-bell-function 'ignore)

(setq initial-scratch-message "")

;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t)
;; Useful for programing:
;; will make the last line end in a carriage return.
(setq require-final-newline t)

(column-number-mode 1)
;; line numbers only for programming modes:
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; mode to make it easy to search buffers and file
(require 'ido)
(ido-mode t)

(custom-set-variables
 ;; '(show-paren-mode t) ;; using smartparens, so not needed
 '(tool-bar-mode nil)
 )


;; (unless window-system
;;   (custom-set-variables
;;     '(menu-bar-mode nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start neotree on startup
;;(unless window-system
;;  (defun neotree-startup ()
;;    (interactive)
;;    (neotree-show)
;;    (call-interactively 'other-window))
;;  (if (daemonp)
;;      (add-hook 'server-switch-hook #'neotree-startup)
;;    (add-hook 'after-init-hook #'neotree-startup)
;;    )
;;  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Melpa
;;   https://thoughtbot.com/blog/emacs-as-a-python-ide)

;; (require 'package)
;; (package-initialize)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; 
;; ;; packages to install
;; ;; (defvar local-packages '(ess company smartparens clean-aindent-mode ws-butler yasnippet yasnippet-snippets))
;; (defvar local-packages '(smartparens clean-aindent-mode ws-butler))
;; 
;; 
;; ;; return true if package is not installed
;; (defun uninstalled-packages (packages)
;;   (delq nil
;;  	(mapcar (lambda (p) (if (package-installed-p p nil) nil p)) packages)))
;; 
;; (let ((need-to-install (uninstalled-packages local-packages)))
;;   (when need-to-install
;;     (progn
;;       (package-refresh-contents)
;;       (dolist (p need-to-install)
;;  	(package-install p)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; stuff from http://tuhdo.github.io/c-ide.html#sec-2

;; ;; smartparens is a minor mode that provides many features for
;; ;;   manipulating pairs.
;; ;; C-M-f (and b) to match parenthesis
;; ;; Package: smartparens
;; (require 'smartparens-config)
;; (show-smartparens-global-mode +1)
;; (smartparens-global-mode 1)
;; (setq sp-highlight-pair-overlay nil) ;; otherwise it highlights white spaces
;; ;; when you press RET, the curly braces automatically
;; ;; add another newline
;; (sp-with-modes '(c-mode c++-mode)
;;   (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
;;   (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
;;                                             ("* ||\n[i]" "RET"))))

;; yasnippet: YASnippet is a template system for Emacs. It allows you
;; to type an abbreviation and automatically expand it into function
;; templates.
;; I installed yasnippet-classic-snippets and snippets are in
;;   elpa/yasnippet-snippets-20210408.1234/snippets
;; Usage:
;; For example, in a C buffer, if you type for and TAB, it expands
;; to for loop. watch Tommy Bennett: https://www.youtube.com/watch?v=tSq7yDwS1vM
;; also a vim snippet: https://github.com/SirVer/ultisnips
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; ;; Setup indentation (see above website for full docs)
;; (global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET
;; 
;; ;; activate whitespace-mode to view all whitespace characters
;; (global-set-key (kbd "C-c w") 'whitespace-mode)
;; 
;; ;; show unncessary whitespace that can mess up your diff
;; (add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))
;; 
;; ;; To clean up trailing whitespace, you can also run
;; ;; whitespace-cleanup command.To convert between TAB and space, you
;; ;; also have two commands: tabify to turn an active region to use TAB
;; ;; for indentation, and untabify to turn an active region to use space
;; ;; for indentation.
;; 
;; ;; Package: clean-aindent-mode
;; (require 'clean-aindent-mode)
;; (add-hook 'prog-mode-hook 'clean-aindent-mode)
;; 
;; ;; Package: ws-butler
;; (require 'ws-butler)
;; (add-hook 'c-mode-common-hook 'ws-butler-mode)
;; 
;; ;; make indent use only spaces
;; (with-eval-after-load "c++-mode"
;;   (setq indent-tabs-mode nil))
;;   ;; (setq fill-prefix "//   ") ;; turn this off later


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company mode (comp-lete any-thing)
;; http://tuhdo.github.io/c-ide.html#sec-2

;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; 
;; ;; see http://tuhdo.github.io/c-ide.html#sec-2
;; (eval-after-load 'cc-mode
;;   '(progn
;;      (setq company-backends (delete 'company-semantic company-backends))
;;      (define-key c-mode-map  [(tab)] 'company-complete)
;;      (define-key c++-mode-map  [(tab)] 'company-complete)
;;      ))

;; https://stackoverflow.com/questions/49232454/emacs-ess-how-to-auto-complete-library-function
;; bind Shift-Tab for popup autocomplete
;; (global-set-key (kbd "<backtab>") 'company-complete-common)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; R ESS related
;; ;; standalone emacs does not find R, so do this:
;; (setq inferior-R-program-name "/usr/local/bin/R")
;; ;;
;; 
;; ;; 1) Try M-= for <- and cycle through to pipe command. Also,
;; ;;   C-c C-= is now bound to ess-cycle-assign by default.
;; ;; 2) Use M-return to evaluate line
;; (eval-after-load "ess-r-mode"
;;   '(progn
;;      (define-key ess-r-mode-map (kbd "M-=") 'ess-cycle-assign)
;;      (define-key inferior-ess-r-mode-map (kbd "M-=") 'ess-cycle-assign)
;;      (define-key ess-r-mode-map (kbd "<M-RET>")
;;        'ess-eval-region-or-line-visibly-and-step)
;;      (define-key inferior-ess-r-mode-map (kbd "<M-RET>")
;;        'ess-eval-region-or-line-visibly-and-step)
;;      (define-key ess-r-mode-map (kbd "C-c s")
;;        'ispell-comments-and-strings)
;;      (define-key inferior-ess-r-mode-map (kbd "C-c s")
;;        'ispell-comments-and-strings)
;;      )
;;   )
;; 
;; ;; Make M-= above cycle through <- and pipe
;; (custom-set-variables
;;  '(ess-assign-list '(" <- " " %>% ")))
;; 
;; ;; Make R not ask "Active processes exist, kill them?" after R is started
;; ;;  R is killed anyway
;; (custom-set-variables
;;  '(confirm-kill-processes nil))
;; 
;; ;; Turn off new indent behaviour where ### is supposed to be full line comment,
;; ;;   ## is block comment and # is comment to the right of code
;; (setq ess-indent-with-fancy-comments nil)
;; 
;; ;; start R in current working directory, don't let R ask user:
;; (setq ess-ask-for-ess-directory nil)
;; 
;; ;; Don't need this:
;; ;; ;; press ';' once for <-. press ; twice for ;
;; ;; (eval-after-load "ess-r-mode"
;; ;;   '(define-key ess-r-mode-map (kbd ";") 'ess-insert-assign))
;; ;; (eval-after-load "ess-r-mode"
;; ;;   '(define-key inferior-ess-r-mode-map (kbd ";") 'ess-insert-assign))
;; 
;; ;; Following only works in standalone emacs, and C-return is defined
;; ;; better in standalone emacs (see c-h k) and will not work in iterm anyway.
;; ;; ESS Mode (.R file)
;; ;; in iTerm emacs M-ret and S-ret don't work, in
;; ;;   standalone emacs M-ret and S-ret works.
;; ;; (eval-after-load "ess-r-mode"
;; ;;   '(define-key ess-r-mode-map (kbd "<M-return>") 'ess-eval-line-and-step))
;; ;; (eval-after-load "ess-r-mode"
;; ;;   '(define-key ess-r-mode-map (kbd "<S-return>") 'ess-eval-line-and-step))
;; ;;
;; ;; iESS Mode (R console)
;; ;; (eval-after-load "ess-r-mode"
;; ;;  (define-key inferior-ess-r-mode-map "\C-u" 'comint-kill-input))
;; ;;  
;; ;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python: default python-mode provides auto-complete, syntax and such.
;;  Using Jedi (https://jedi.readthedocs.io/en/latest/docs/usage.html) for peeking
;;  into documentation of functions. It is well maintained.
;;  See also: https://jedi.readthedocs.io/en/latest/docs/usage.html
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)                 ; optional

;; jedi does not work, gives 'deferred error'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Run R on startup, if needed
;;(when window-system
;;  ;;(setq inferior-ess-own-frame t)
;;  ;; make sure you install.packages('lintr') in R
;;  (setq inferior-ess-r-program "/usr/local/bin/R")
;;  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
;;  (setq inferior-ess-same-window nil)
;;  (R-mode)
;;  (split-window-right)
;;  (run-ess-r)
;;  )
;;
;; ;; stop R for asking for dir
;; (setq ess-ask-for-ess-directory nil)
;; ;; Stop asking question before exiting when R process is running
;; (setq confirm-kill-processes nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ITERM2 MOUSE SUPPORT
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  ;;  (defun track-mouse (e))
  ;;  (setq mouse-sel-mode t)
  (global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
  (global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))
  (global-set-key [S-mouse-4] (lambda () (interactive) (scroll-down 4)))
  (global-set-key [S-mouse-5] (lambda () (interactive) (scroll-up 4)))
  (global-set-key [C-mouse-4] (lambda () (interactive) (scroll-down)))
  (global-set-key [C-mouse-5] (lambda () (interactive) (scroll-up)))
  ;; mouse+click should select text
  (define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)
  ;; Remove background color set by theme
  (add-to-list 'default-frame-alist '(background-color . "nil"))
  (add-to-list 'default-frame-alist '(foreground-color . "nil"))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Put backup and autosave files in one place (/tmp/girish).
(when (> emacs-major-version 21)
  (defvar user-temporary-file-directory
    (concat temporary-file-directory user-login-name "/"))
  (make-directory user-temporary-file-directory t)
  (setq backup-by-copying t)
  (setq backup-directory-alist
        `(("." . ,user-temporary-file-directory)
          (,tramp-file-name-regexp nil)))
  (setq auto-save-list-file-prefix
        (concat user-temporary-file-directory ".auto-saves-"))
  (setq auto-save-file-name-transforms
        `((".*" ,user-temporary-file-directory t)))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions
(defun replace-string-in-region (string replacement)
  "Replace a string in a given region"
  (interactive "sReplace String: \nsWith: "  )
  (let ((currentpoint (point)))
    (narrow-to-region (region-beginning) (region-end))
    (goto-char (region-beginning))
    (replace-string string replacement)
    (widen)
    (goto-char currentpoint)))

(defun rsir (string replacement)
  "Replace a string in a given region"
  (interactive "sReplace String: \nsWith: "  )
  (replace-string-in-region string replacement))

(defun open-new-line ()
  (interactive)
  (end-of-line 'nil)
  (newline)
  )

;; Replace "yes or no" with y or n
(defun yes-or-no-p (arg)
  "An alias for y-or-n-p, because I hate having to type 'yes' or 'no'."
  (y-or-n-p arg))

(defun ke ()
  (interactive)
  (kill-emacs 'nil)
  )


