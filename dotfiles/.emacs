;; girish
;;-----------------------------------------------------------

(setq emacs-lisp-dir "~/.emacs.d")
(setq emacs-conf-el-file (concat emacs-lisp-dir "/emacs.el"))
(setq emacs-conf-elc-file (concat emacs-lisp-dir "/emacs.elc"))
(if (file-newer-than-file-p emacs-conf-el-file emacs-conf-elc-file)
                                (byte-compile-file emacs-conf-el-file))
(load-file emacs-conf-elc-file)

;; Meta-g g: goto-line
;;(global-set-key (kbd "<f8>") 'neotree-toggle) ; 'g' to refresh dir tree

;;  ;; Needed for some themes inside iterm2. disable theme bg color.
;;  (unless window-system
;;    (set-face-background 'default "unspecified-bg"))
;;
;;  ;; Wombat theme has a bad background color, change it
;;  ;; when not opened within terminal
;;  (when window-system 
;;    (set-face-background 'default "#001b2d"))
;;  
;; Needed for themes to function inside iterm2
;; (unless window-system
;;   (set-terminal-parameter nil 'background-mode 'light))

;; change comment background color:
;; https://emacs.stackexchange.com/questions/38843/spacemacs-change-line-background-color-when-has-comment
;; M-x customize-face and then font-lock-comment-face (color used is #e3fcec for background
;; this was automatically done in standalone emacs

;;  (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;   '(custom-enabled-themes '(spacemacs-light))
;;   '(custom-safe-themes
;;     '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
;;   '(package-selected-packages '(spacemacs-theme solarized-theme))
;;   '(show-paren-mode t)
;;   '(tool-bar-mode nil))
;;  (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;   '(font-lock-comment-face ((t (:background "#e3fcec" :foreground "#008787" :slant normal)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(confirm-kill-processes nil)
 '(custom-enabled-themes '(tango-dark))
 '(ess-assign-list '(" <- " " %>% "))
 '(package-selected-packages
   '(yasnippet-snippets clean-aindent-mode ws-butler yasnippet smartparens ess company))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
