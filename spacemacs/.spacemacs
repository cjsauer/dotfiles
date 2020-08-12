;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     python
     ruby
     asciidoc
     rust
     php
     yaml
     javascript
     html
     clojure
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     ;; org
     shaders
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     flycheck-clj-kondo
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; Midje macro configuration https://github.com/marick/Midje
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2) ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2) ; web-mode, js code in html file
  (setq css-indent-offset 2) ; css-mode
  (setq flycheck-global-modes '(enh-ruby-mode ruby-mode rust-mode php-mode yaml-mode
                                json-mode js2-mode coffee-mode web-mode slim-mode scss-mode
                                sass-mode pug-mode less-mode haml-mode clojure-mode clojurescript-mode))
  (setq php-backend 'lsp)
  (use-package clojure-mode
    :ensure t
    :config
    (require 'flycheck-clj-kondo))
  (add-to-list 'auto-mode-alist '("\\.svelte$" . web-mode))
  (setq python-shell-interpreter "python3")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(cider-clojure-cli-parameters "-A:dev:test -m nrepl.cmdline --middleware '%s'")
 '(cider-lein-parameters "with-profile dev,test repl :headless :host localhost")
 '(clojure-indent-style (quote always-align))
 '(column-number-mode t)
 '(js-indent-level 2)
 '(mode-require-final-newline nil)
 '(package-selected-packages
   (quote
    (yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic flycheck-clj-kondo rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby adoc-mode markup-faces parseedn parseclj a lv transient toml-mode racer flycheck-rust cargo rust-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode yaml-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode glsl-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data xterm-color unfill smeargle shell-pop orgit mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub treepy graphql with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider sesman queue clojure-mode auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed ace-link ace-jump-helm-line helm helm-core popup which-key undo-tree org-plus-contrib hydra evil-unimpaired f s dash async aggressive-indent adaptive-wrap ace-window avy)))
 '(require-final-newline nil)
 '(safe-local-variable-values
   (quote
    ((eval define-clojure-indent
           (action 1)
           (dom/a 1)
           (dom/abbr 1)
           (dom/address 1)
           (dom/altGlyph 1)
           (dom/altGlyphDef 1)
           (dom/altGlyphItem 1)
           (dom/animate 1)
           (dom/animateColor 1)
           (dom/animateMotion 1)
           (dom/animateTransform 1)
           (dom/area 1)
           (dom/article 1)
           (dom/aside 1)
           (dom/audio 1)
           (dom/b 1)
           (dom/base 1)
           (dom/bdi 1)
           (dom/bdo 1)
           (dom/big 1)
           (dom/blockquote 1)
           (dom/body 1)
           (dom/br 1)
           (dom/button 1)
           (dom/canvas 1)
           (dom/caption 1)
           (dom/circle 1)
           (dom/cite 1)
           (dom/clipPath 1)
           (dom/code 1)
           (dom/col 1)
           (dom/colgroup 1)
           (dom/color-profile 1)
           (dom/cursor 1)
           (dom/data 1)
           (dom/datalist 1)
           (dom/dd 1)
           (dom/defs 1)
           (dom/del 1)
           (dom/desc 1)
           (dom/details 1)
           (dom/dfn 1)
           (dom/dialog 1)
           (dom/discard 1)
           (dom/div 1)
           (dom/dl 1)
           (dom/dt 1)
           (dom/ellipse 1)
           (dom/em 1)
           (dom/embed 1)
           (dom/feBlend 1)
           (dom/feColorMatrix 1)
           (dom/feComponentTransfer 1)
           (dom/feComposite 1)
           (dom/feConvolveMatrix 1)
           (dom/feDiffuseLighting 1)
           (dom/feDisplacementMap 1)
           (dom/feDistantLight 1)
           (dom/feDropShadow 1)
           (dom/feFlood 1)
           (dom/feFuncA 1)
           (dom/feFuncB 1)
           (dom/feFuncG 1)
           (dom/feFuncR 1)
           (dom/feGaussianBlur 1)
           (dom/feImage 1)
           (dom/feMerge 1)
           (dom/feMergeNode 1)
           (dom/feMorphology 1)
           (dom/feOffset 1)
           (dom/fePointLight 1)
           (dom/feSpecularLighting 1)
           (dom/feSpotLight 1)
           (dom/feTile 1)
           (dom/feTurbulence 1)
           (dom/fieldset 1)
           (dom/figcaption 1)
           (dom/figure 1)
           (dom/filter 1)
           (dom/font 1)
           (dom/font-face 1)
           (dom/font-face-format 1)
           (dom/font-face-name 1)
           (dom/font-face-src 1)
           (dom/font-face-uri 1)
           (dom/footer 1)
           (dom/foreignObject 1)
           (dom/form 1)
           (dom/g 1)
           (dom/glyph 1)
           (dom/glyphRef 1)
           (dom/h1 1)
           (dom/h2 1)
           (dom/h3 1)
           (dom/h4 1)
           (dom/h5 1)
           (dom/h6 1)
           (dom/hatch 1)
           (dom/hatchpath 1)
           (dom/head 1)
           (dom/header 1)
           (dom/hkern 1)
           (dom/hr 1)
           (dom/html 1)
           (dom/i 1)
           (dom/iframe 1)
           (dom/image 1)
           (dom/img 1)
           (dom/input 1)
           (dom/ins 1)
           (dom/kbd 1)
           (dom/keygen 1)
           (dom/label 1)
           (dom/legend 1)
           (dom/li 1)
           (dom/line 1)
           (dom/linearGradient 1)
           (dom/link 1)
           (dom/main 1)
           (dom/map 1)
           (dom/mark 1)
           (dom/marker 1)
           (dom/mask 1)
           (dom/menu 1)
           (dom/menuitem 1)
           (dom/mesh 1)
           (dom/meshgradient 1)
           (dom/meshpatch 1)
           (dom/meshrow 1)
           (dom/meta 1)
           (dom/metadata 1)
           (dom/meter 1)
           (dom/missing-glyph 1)
           (dom/mpath 1)
           (dom/nav 1)
           (dom/noscript 1)
           (dom/object 1)
           (dom/ol 1)
           (dom/optgroup 1)
           (dom/option 1)
           (dom/output 1)
           (dom/p 1)
           (dom/param 1)
           (dom/path 1)
           (dom/pattern 1)
           (dom/picture 1)
           (dom/polygon 1)
           (dom/polyline 1)
           (dom/pre 1)
           (dom/progress 1)
           (dom/q 1)
           (dom/radialGradient 1)
           (dom/rect 1)
           (dom/rp 1)
           (dom/rt 1)
           (dom/ruby 1)
           (dom/s 1)
           (dom/samp 1)
           (dom/script 1)
           (dom/section 1)
           (dom/select 1)
           (dom/set 1)
           (dom/small 1)
           (dom/solidcolor 1)
           (dom/source 1)
           (dom/span 1)
           (dom/stop 1)
           (dom/strong 1)
           (dom/style 1)
           (dom/sub 1)
           (dom/summary 1)
           (dom/sup 1)
           (dom/svg 1)
           (dom/switch 1)
           (dom/symbol 1)
           (dom/table 1)
           (dom/tbody 1)
           (dom/td 1)
           (dom/text 1)
           (dom/textPath 1)
           (dom/textarea 1)
           (dom/tfoot 1)
           (dom/th 1)
           (dom/thead 1)
           (dom/time 1)
           (dom/title 1)
           (dom/tr 1)
           (dom/track 1)
           (dom/tref 1)
           (dom/tspan 1)
           (dom/u 1)
           (dom/ul 1)
           (dom/unknown 1)
           (dom/use 1)
           (dom/var 1)
           (dom/video 1)
           (dom/view 1)
           (dom/vkern 1)
           (dom/wbr 1))
     (eval define-clojure-indent
           (dom/a 1)
           (dom/abbr 1)
           (dom/address 1)
           (dom/altGlyph 1)
           (dom/altGlyphDef 1)
           (dom/altGlyphItem 1)
           (dom/animate 1)
           (dom/animateColor 1)
           (dom/animateMotion 1)
           (dom/animateTransform 1)
           (dom/area 1)
           (dom/article 1)
           (dom/aside 1)
           (dom/audio 1)
           (dom/b 1)
           (dom/base 1)
           (dom/bdi 1)
           (dom/bdo 1)
           (dom/big 1)
           (dom/blockquote 1)
           (dom/body 1)
           (dom/br 1)
           (dom/button 1)
           (dom/canvas 1)
           (dom/caption 1)
           (dom/circle 1)
           (dom/cite 1)
           (dom/clipPath 1)
           (dom/code 1)
           (dom/col 1)
           (dom/colgroup 1)
           (dom/color-profile 1)
           (dom/cursor 1)
           (dom/data 1)
           (dom/datalist 1)
           (dom/dd 1)
           (dom/defs 1)
           (dom/del 1)
           (dom/desc 1)
           (dom/details 1)
           (dom/dfn 1)
           (dom/dialog 1)
           (dom/discard 1)
           (dom/div 1)
           (dom/dl 1)
           (dom/dt 1)
           (dom/ellipse 1)
           (dom/em 1)
           (dom/embed 1)
           (dom/feBlend 1)
           (dom/feColorMatrix 1)
           (dom/feComponentTransfer 1)
           (dom/feComposite 1)
           (dom/feConvolveMatrix 1)
           (dom/feDiffuseLighting 1)
           (dom/feDisplacementMap 1)
           (dom/feDistantLight 1)
           (dom/feDropShadow 1)
           (dom/feFlood 1)
           (dom/feFuncA 1)
           (dom/feFuncB 1)
           (dom/feFuncG 1)
           (dom/feFuncR 1)
           (dom/feGaussianBlur 1)
           (dom/feImage 1)
           (dom/feMerge 1)
           (dom/feMergeNode 1)
           (dom/feMorphology 1)
           (dom/feOffset 1)
           (dom/fePointLight 1)
           (dom/feSpecularLighting 1)
           (dom/feSpotLight 1)
           (dom/feTile 1)
           (dom/feTurbulence 1)
           (dom/fieldset 1)
           (dom/figcaption 1)
           (dom/figure 1)
           (dom/filter 1)
           (dom/font 1)
           (dom/font-face 1)
           (dom/font-face-format 1)
           (dom/font-face-name 1)
           (dom/font-face-src 1)
           (dom/font-face-uri 1)
           (dom/footer 1)
           (dom/foreignObject 1)
           (dom/form 1)
           (dom/g 1)
           (dom/glyph 1)
           (dom/glyphRef 1)
           (dom/h1 1)
           (dom/h2 1)
           (dom/h3 1)
           (dom/h4 1)
           (dom/h5 1)
           (dom/h6 1)
           (dom/hatch 1)
           (dom/hatchpath 1)
           (dom/head 1)
           (dom/header 1)
           (dom/hkern 1)
           (dom/hr 1)
           (dom/html 1)
           (dom/i 1)
           (dom/iframe 1)
           (dom/image 1)
           (dom/img 1)
           (dom/input 1)
           (dom/ins 1)
           (dom/kbd 1)
           (dom/keygen 1)
           (dom/label 1)
           (dom/legend 1)
           (dom/li 1)
           (dom/line 1)
           (dom/linearGradient 1)
           (dom/link 1)
           (dom/main 1)
           (dom/map 1)
           (dom/mark 1)
           (dom/marker 1)
           (dom/mask 1)
           (dom/menu 1)
           (dom/menuitem 1)
           (dom/mesh 1)
           (dom/meshgradient 1)
           (dom/meshpatch 1)
           (dom/meshrow 1)
           (dom/meta 1)
           (dom/metadata 1)
           (dom/meter 1)
           (dom/missing-glyph 1)
           (dom/mpath 1)
           (dom/nav 1)
           (dom/noscript 1)
           (dom/object 1)
           (dom/ol 1)
           (dom/optgroup 1)
           (dom/option 1)
           (dom/output 1)
           (dom/p 1)
           (dom/param 1)
           (dom/path 1)
           (dom/pattern 1)
           (dom/picture 1)
           (dom/polygon 1)
           (dom/polyline 1)
           (dom/pre 1)
           (dom/progress 1)
           (dom/q 1)
           (dom/radialGradient 1)
           (dom/rect 1)
           (dom/rp 1)
           (dom/rt 1)
           (dom/ruby 1)
           (dom/s 1)
           (dom/samp 1)
           (dom/script 1)
           (dom/section 1)
           (dom/select 1)
           (dom/set 1)
           (dom/small 1)
           (dom/solidcolor 1)
           (dom/source 1)
           (dom/span 1)
           (dom/stop 1)
           (dom/strong 1)
           (dom/style 1)
           (dom/sub 1)
           (dom/summary 1)
           (dom/sup 1)
           (dom/svg 1)
           (dom/switch 1)
           (dom/symbol 1)
           (dom/table 1)
           (dom/tbody 1)
           (dom/td 1)
           (dom/text 1)
           (dom/textPath 1)
           (dom/textarea 1)
           (dom/tfoot 1)
           (dom/th 1)
           (dom/thead 1)
           (dom/time 1)
           (dom/title 1)
           (dom/tr 1)
           (dom/track 1)
           (dom/tref 1)
           (dom/tspan 1)
           (dom/u 1)
           (dom/ul 1)
           (dom/unknown 1)
           (dom/use 1)
           (dom/var 1)
           (dom/video 1)
           (dom/view 1)
           (dom/vkern 1)
           (dom/wbr 1)))))
 '(tab-width 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
