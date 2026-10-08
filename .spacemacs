(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     auto-completion
     better-defaults
     claude-code
     colors
     csv
     docker
     elixir
     emacs-lisp
     games
     git
     (go :variables
         go-run-command "go run"
         go-format-before-save t)
     helm
     html
     javascript
     jsonnet
     (latex :variables latex-build-command "LaTeX")
     lua
     markdown
     nginx
     org
     python
     react
     restclient
     ruby
     ruby-on-rails
     rust
     (shell :variables shell-default-shell 'ansi-term
            shell-default-position 'bottom
            shell-default-height 35
            shell-default-full-span nil)
     shell-scripts
     spell-checking
     syntax-checking
     terraform
     (treemacs :variables treemacs-use-git-mode 'deferred)
     typescript
     version-control
     vimscript
     yaml
     )

   ;; List of additional packages that will installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(groovy-mode
                                      org-autolist
                                      org-pretty-tags)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
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
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; The backend used for undo/redo. One of `undo-redo', `undo-fu' or
   ;; `undo-tree'. (default `undo-redo')
   dotspacemacs-undo-system 'undo-tree
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '((recents . 5) (projects . 7))
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; different mode line
   dotspacemacs-mode-line-theme '(spacemacs :separator wave)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '(("Source Code Pro"
                                :size 13
                                :weight normal
                                :width normal
                                :powerline-scale 1.1)
                               ("Menlo"
                                :size 13
                                :weight normal
                                :width normal
                                :powerline-scale 1.1))
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
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
   ;; If non nil the paste transient-state is enabled. When enabled pressing `p`
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `ack' and `grep'.
   ;; (default '("rg" "ag" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "grep")
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
  ;; Keep macOS `tar' from adding AppleDouble `._*' entries to the tarballs
  ;; quelpa builds; Emacs' `package-tar-file-info' cannot parse them.
  (setenv "COPYFILE_DISABLE" "1"))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq-default js2-basic-offset 2
                js-indent-level 2)
  (setq javascript-indent-level 2)
  (setq typescript-indent-level 2)
  (setq system-uses-terminfo nil)
  (setq python-shell-interpreter "python3")
  (add-to-list 'auto-mode-alist '("Jenkinsfile\\'" . groovy-mode))
  ;; fnm's per-shell PATH entries do not exist inside Emacs, so resolve `claude'
  ;; through the fnm alias that `npm install -g' (and Claude's self-update) writes to.
  (setq claude-code-ide-cli-path
        "/Users/juliabiro/.local/share/fnm/aliases/default/bin/claude")
  (setq claude-code-ide-use-side-window nil)
  (setq claude-code-ide-terminal-backend 'eat)
  (setq claude-code-ide-show-backend-recommendation nil)
  (evil-set-initial-state 'eat-mode 'insert)

  (defvar juliabiro/claude-code-ide-scroll-lines 5)

  (defun juliabiro/claude-code-ide-send-wheel (sgr-button)
    "Send SGR-BUTTON wheel events to the Claude Code TUI.
Claude Code runs on the alternate screen, which has no terminal scrollback;
it scrolls its own transcript in response to mouse reports."
    (when (bound-and-true-p eat-terminal)
      (dotimes (_ juliabiro/claude-code-ide-scroll-lines)
        (eat-term-send-string eat-terminal (format "\e[<%d;1;1M" sgr-button)))))

  (defun juliabiro/claude-code-ide-scroll-up ()
    (interactive)
    (juliabiro/claude-code-ide-send-wheel 64))

  (defun juliabiro/claude-code-ide-scroll-down ()
    (interactive)
    (juliabiro/claude-code-ide-send-wheel 65))

  (defvar juliabiro/claude-code-ide-mode-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "M-v") #'juliabiro/claude-code-ide-scroll-up)
      (define-key map (kbd "C-v") #'juliabiro/claude-code-ide-scroll-down)
      (define-key map (kbd "S-<prior>") #'juliabiro/claude-code-ide-scroll-up)
      (define-key map (kbd "S-<next>") #'juliabiro/claude-code-ide-scroll-down)
      ;; Plain `yank' would insert into the terminal buffer's own text rather
      ;; than hand the string to the process.
      (define-key map (kbd "s-v") #'eat-yank)
      map))

  (define-minor-mode juliabiro/claude-code-ide-mode
    "Minor mode holding the Claude Code terminal's own keys.
Eat shares `eat-semi-char-mode-map' between all of its buffers, so these
keys live in a minor mode to keep them out of unrelated eat terminals."
    :keymap juliabiro/claude-code-ide-mode-map)

  (defun juliabiro/claude-code-ide-bind-terminal-keys ()
    (juliabiro/claude-code-ide-mode 1))

  (with-eval-after-load 'claude-code-ide
    (claude-code-ide-emacs-tools-setup)
    (advice-add 'claude-code-ide--setup-terminal-keybindings :after
                #'juliabiro/claude-code-ide-bind-terminal-keys))

  (defvar juliabiro/worktree-directory "~/worktrees/")

  (defun juliabiro/read-worktree-directory (prompt branch)
    "Read a new worktree directory under `juliabiro/worktree-directory'.
Offer NAME-BRANCH, where NAME is the main worktree's directory name, so
that a worktree created from inside another worktree is still named
after the repository rather than after its sibling."
    (make-directory juliabiro/worktree-directory t)
    (read-directory-name
     prompt juliabiro/worktree-directory nil nil
     (concat (file-name-nondirectory
              (directory-file-name (caar (magit-list-worktrees))))
             "-"
             (and branch (string-replace "/" "-" branch)))))

  (defun juliabiro/bootstrap-worktree (directory &rest _)
    "Run the repository's own setup script in the new worktree DIRECTORY.
Repositories opt in by providing `scripts/setup-worktree.bash', which is
called with the main worktree's path, the same contract Claude Code's
`WorktreeCreate' hook uses."
    (when (file-directory-p directory)
      (let* ((default-directory (file-name-as-directory
                                 (expand-file-name directory)))
             (main (caar (magit-list-worktrees)))
             (script (expand-file-name "scripts/setup-worktree.bash" main)))
        (when (file-exists-p script)
          (async-shell-command
           (format "bash %s %s"
                   (shell-quote-argument script)
                   (shell-quote-argument main))
           "*worktree-setup*")))))

  (setq magit-read-worktree-directory-function
        #'juliabiro/read-worktree-directory)
  (advice-add 'magit-worktree-checkout :after #'juliabiro/bootstrap-worktree)
  (advice-add 'magit-worktree-branch :after #'juliabiro/bootstrap-worktree)

  (setq projectile-project-search-path (list juliabiro/worktree-directory))

  (setq magit-repository-directories
        '(("~/kombo" . 0)
          ("~/kombo-workspace-groups" . 0)
          ("~/worktrees" . 1)
          ("~/.emacs.d" . 0)
          ("~" . 0)))

  (with-eval-after-load 'magit
    (magit-add-section-hook 'magit-status-headers-hook
                            #'magit-insert-repo-header
                            #'magit-insert-head-branch-header))

  (defvar juliabiro/magit-fallback-display-buffer-function nil)

  (defun juliabiro/magit-display-buffer (buffer)
    "Show the Magit status BUFFER at the bottom of the frame.
Other Magit buffers keep the placement Spacemacs' purpose layer gives them."
    (if (eq (buffer-local-value 'major-mode buffer) 'magit-status-mode)
        (display-buffer buffer '(display-buffer-at-bottom
                                 (inhibit-purpose . t)
                                 (window-height . 0.5)))
      (funcall juliabiro/magit-fallback-display-buffer-function buffer)))

  (with-eval-after-load 'magit
    (unless (eq magit-display-buffer-function #'juliabiro/magit-display-buffer)
      (setq juliabiro/magit-fallback-display-buffer-function
            magit-display-buffer-function))
    (setq magit-display-buffer-function #'juliabiro/magit-display-buffer)
    (add-hook 'after-save-hook #'magit-after-save-refresh-status t))

  (defun juliabiro/magit-refresh-visible-status ()
    "Refresh the Magit status buffers on screen, but only while Emacs is idle."
    (when (and (current-idle-time) (> (float-time (current-idle-time)) 2))
      (dolist (window (window-list nil 'no-minibuffer))
        (with-current-buffer (window-buffer window)
          (when (derived-mode-p 'magit-status-mode)
            (magit-refresh-buffer))))))

  (cancel-function-timers #'juliabiro/magit-refresh-visible-status)
  (run-with-timer 10 10 #'juliabiro/magit-refresh-visible-status))



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(evil-want-Y-yank-to-eol t)
   '(org-archive-default-command 'org-archive-subtree)
   '(org-archive-location "%s_archive::")
   '(org-babel-load-languages
     '((http . t) (ruby . t) (restclient . t) (shell . t) (python . t)
       (emacs-lisp . t)))
   '(org-confirm-babel-evaluate nil)
   '(package-selected-packages
     '(2048-game ace-link aggressive-indent alchemist all-the-icons auto-compile
                 auto-highlight-symbol auto-yasnippet avy-jump-helm-line
                 browse-at-remote bundler centered-cursor-mode claude-code-ide
                 clean-aindent-mode code-cells code-review color-identifiers-mode
                 column-enforce-mode company-anaconda company-auctex company-go
                 company-lua company-math company-reftex company-restclient
                 company-shell company-terraform company-web csv-mode cython-mode
                 dactyl-mode define-word devdocs diff-hl diminish dired-quick-sort
                 disable-mouse docker dockerfile-mode dotenv-mode drag-stuff
                 dumb-jump eat edit-indirect elisp-def elisp-demos elisp-slime-nav
                 emmet-mode emr esh-help eshell-prompt-extras eshell-z
                 eval-sexp-fu evil-anzu evil-args evil-cleverparens
                 evil-collection evil-easymotion evil-escape evil-evilified-state
                 evil-exchange evil-goggles evil-iedit-state evil-indent-plus
                 evil-lion evil-lisp-state evil-matchit evil-nerd-commenter
                 evil-numbers evil-org evil-surround evil-tex evil-textobj-line
                 evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar
                 expand-region eyebrowse fancy-battery feature-mode fish-mode
                 flycheck-bashate flycheck-credo flycheck-elsa flycheck-package
                 flycheck-pos-tip flyspell-correct-helm gh-md git-link
                 git-messenger git-modes git-timemachine gitignore-templates
                 gnuplot go-eldoc go-fill-struct go-gen-test go-guru go-impl
                 go-rename go-tag godoctor golden-ratio google-translate
                 groovy-mode helm-ag helm-c-yasnippet helm-comint helm-company
                 helm-css-scss helm-descbinds helm-ls-git helm-make
                 helm-mode-manager helm-org helm-org-rifle helm-projectile
                 helm-purpose helm-pydoc helm-swoop helm-xref hide-comnt
                 highlight-indentation highlight-numbers highlight-parentheses
                 hl-todo holy-mode hungry-delete hybrid-mode impatient-mode
                 indent-guide info+ insert-shebang inspector js-doc js2-refactor
                 json-mode json-navigator json-reformat jsonnet-mode link-hint
                 live-py-mode livid-mode lorem-ipsum macrostep markdown-toc
                 minitest monokai-theme multi-line multi-term multi-vterm mwim
                 nameless nginx-mode nodejs-repl npm-mode ob-elixir ob-http
                 ob-restclient open-junk-file org-autolist org-cliplink
                 org-contrib org-download org-mime org-pomodoro org-present
                 org-pretty-tags org-projectile org-rich-yank org-superstar
                 orgit-forge overseer pacmacs page-break-lines paradox
                 password-generator pip-requirements pipenv pippel poetry popwin
                 prettier-js projectile-rails pug-mode py-isort pydoc pyenv-mode
                 pylookup python-pytest quickrun rainbow-delimiters
                 rainbow-identifiers rainbow-mode restart-emacs restclient-helm
                 rjsx-mode robe ron-mode rspec-mode rubocop rubocopfmt
                 ruby-hash-syntax ruby-refactor ruby-test-mode ruby-tools rustic
                 sass-mode scss-mode shell-pop shfmt slim-mode smeargle
                 solarized-theme space-doc spaceline spacemacs-purpose-popwin
                 spacemacs-whitespace-cleanup sphinx-doc string-edit-at-point
                 string-inflection sudoku symbol-overlay symon tagedit term-cursor
                 terminal-here tern tide toc-org toml-mode treemacs-evil
                 treemacs-icons-dired treemacs-magit treemacs-persp
                 treemacs-projectile typescript-mode typit undo-tree unfill
                 vi-tilde-fringe vimrc-mode volatile-highlights web-beautify
                 web-mode wgrep winum writeroom-mode ws-butler yaml-mode yapfify
                 yasnippet-snippets zenburn-theme)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
  )
