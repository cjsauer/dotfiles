;;;; Package --- init.el
;;;; Commentary:
;;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs Configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Minimal UI
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

;; Shhh
(setq ring-bell-function (quote ignore))

;; Parentheses
(setq-default show-paren-delay 0)
(show-paren-mode 1)
(electric-pair-mode 1)

;; Emacs web browser wrap long lines
(add-hook 'eww-mode-hook 'visual-line-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Package installation/configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybinding setup and helpers

(use-package general
  :ensure t)

;; Constants
(defconst my-leader-key ",")
(defconst my-non-normal-leader-key "M-,")
(defconst my-prefix-key "SPC")
(defconst my-non-normal-prefix-key "M-SPC")

(defmacro pfx (key)
  "Prepend my-prefix-key and a space before KEY."
  `(concat my-prefix-key " " ,key))

(defmacro ldr (key)
  "Prepend my-leader-key and a space before KEY."
  `(concat my-leader-key " " ,key))

(general-create-definer defprefixkeys
  :states '(normal emacs)
  :prefix my-prefix-key
  :non-normal-prefix my-non-normal-prefix-key)

(general-create-definer defldrkeys
  :states '(normal emacs)
  :prefix my-leader-key
  :non-normal-prefix my-non-normal-leader-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doom themes

(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  :config
  ;; (load-theme 'doom-one t)
  ;; (load-theme 'doom-vibrant t)
  ;; (load-theme 'doom-nord t)
  (load-theme 'doom-spacegrey t)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil (Vim) mode

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "fd")
  :config
  (evil-escape-mode 1))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-completion

(use-package company
  :ensure t
  :config
  (global-company-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm - Incremental completion and narrowing selections

(use-package helm
  :ensure t
  :init
  (require 'helm-config)
  (setq-default helm-M-x-fuzzy-match t
		helm-mode-fuzzy-match t
		helm-buffers-fuzzy-matching t
		helm-recentf-fuzzy-match t
		helm-locate-fuzzy-match t
		helm-semantic-fuzzy-match t
		helm-imenu-fuzzy-match t
		helm-completion-in-region-fuzzy-match t
		helm-candidate-number-list 150)
  (setq helm-split-window-inside-p t
	helm-move-to-line-cycle-in-source t
	helm-echo-input-in-header-line t
	helm-autoresize-max-height 0
	helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Which Key - key completion help

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " "
	which-key-prefix-prefix "+")
  :config
  (which-key-mode 1)
  (setq which-key-idle-secondary-delay 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile - project management

(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

(use-package helm-projectile
  :ensure t
  :init
  (setq helm-projectile-fuzzy-match t)
  :config
  (helm-projectile-on))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git support

(use-package magit
  :ensure t)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Global keybindings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defprefixkeys
 ;; Spacemacs style M-x menu
 "SPC" '(helm-M-x :which-key "M-x")

 ;; Projectile
 "pf"  '(helm-projectile-find-file :which-key "find files")

 ;; Files
 "ff"  '(helm-find-files :which-key "find files")

 ;; Windows
 "ws"  '(evil-window-split :which-key "split horizontal")
 "wv"  '(evil-window-vsplit :which-key "split vertical")
 "wk"  '(evil-window-up :which-key "up")
 "wj"  '(evil-window-down :which-key "down")
 "wh"  '(evil-window-left :which-key "left")
 "wl"  '(evil-window-right :which-key "right")
 "wd"  '(evil-window-delete :which-key "delete")
 "wr"  '(evil-window-rotate-upwards :which-key "rotate windows")

 ;; Buffers
 "bb"  '(helm-buffers-list :which-key "find/list buffers")
 "bd"  '(evil-delete-buffer :which-key "delete buffer")

 ;; Git
 "gs"  'magit-status
 "ga"  'magit-stage
 "gc"  'magit-commit
 "gp"  'magit-push-popup
 "gd"  'magit-diff-buffer-file
 "gD"  'magit-diff-popup
 "gl"  'magit-log-all
 )

;; Vim normal mode keybindings
(general-define-key
 :states '(normal emacs)
 "C-u" 'evil-scroll-up
 "[b"  'evil-prev-buffer
 "]b"  'evil-next-buffer)

;; More informative which-key prefix titles
(which-key-add-key-based-replacements
  (pfx "p") "projectile"
  (pfx "f") "files"
  (pfx "w") "windows"
  (pfx "b") "buffers"
  (pfx "g") "git")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Language support
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; syntax checking
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;; PATH fix for MacOS
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lisp(s)

(use-package paredit
  :ensure t)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl"))

(defprefixkeys
 ;; lispy edits
 "kw" 'paredit-wrap-sexp
 "ks" 'paredit-forward-slurp-sexp
 "kb" 'paredit-backward-slurp-sexp
 "kk" 'paredit-kill)

(defldrkeys emacs-lisp-mode-map
  "eb" 'eval-buffer
  "ee" 'eval-last-sexp)

(defldrkeys lisp-mode-map
  "si" 'slime
  "ss" 'inferior-lisp
  "sd" 'slime-documentation
  "sq" 'slime-quit-lisp
  "eb" 'slime-eval-buffer
  "ee" 'slime-eval-last-expression)

(which-key-add-key-based-replacements
  (pfx "k") "lisp/paredit")

(which-key-add-major-mode-key-based-replacements 'lisp-mode
  (ldr "e") "eval"
  (ldr "s") "repl")

(which-key-add-major-mode-key-based-replacements 'emacs-lisp-mode
  (ldr "e") "eval")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clojure

(use-package cider
  :ensure t)

(defun cider-load-buffer-and-switch-to-ns ()
  "Load current Clojure ns and switch to it in the repl."
  (interactive)
  (cider-load-buffer)
  (cider-repl-set-ns (cider-current-ns))
  (cider-switch-to-repl-buffer))

(defldrkeys clojure-mode-map
  "si" 'cider-jack-in
  "ss" 'cider-switch-to-repl-buffer
  "sN" 'cider-load-buffer-and-switch-to-ns
  "mm" 'cider-macroexpand-1
  "ma" 'cider-macroexpand-all

  "eb" 'cider-eval-buffer
  "ee" 'cider-eval-last-sexp
  "ef" 'cider-eval-defun-at-point)

(which-key-add-major-mode-key-based-replacements 'clojure-mode
  (ldr "e") "eval"
  (ldr "s") "repl")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rust

(use-package rust-mode
  :ensure t)

(use-package cargo
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package racer
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode))

(use-package flycheck-rust
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'flycheck-rust-setup))

(defldrkeys rust-mode-map
  "=" 'rust-format-buffer
  "eb" 'cargo-process-build
  "er" 'cargo-process-run)

(which-key-add-major-mode-key-based-replacements 'rust-mode
  (ldr "e") "cargo")





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-commentary cider flycheck-rust exec-path-from-shell flycheck racer slime cargo rust-mode evil-surround paredit general magit helm-projectile projectile which-key helm company evil-escape doom-themes use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
