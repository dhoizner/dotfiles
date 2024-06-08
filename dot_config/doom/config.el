;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dan Hoizner"
      user-mail-address "dan.hoizner@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-shades-of-purple)
(setq catppuccin-flavor 'frappe)
(setq doom-theme 'catppuccin)
(setq doom-dracula-brighter-modeline t)
(setq doom-dracula-brighter-comments t)
(setq doom-dracula-colorful-headers t)
(setq doom-dracula-comment-bg t)
(setq doom-font (font-spec :family "Comic Code Ligatures"))

;; toggle frame transparency
(add-to-list 'default-frame-alist '(alpha . 70))
;; function for toggling frame transparency
(defun dh/toggle-window-transparency ()
  "Toggle transparency."
  (interactive)
  (pcase (frame-parameter nil 'alpha)
    (70 (set-frame-parameter nil 'alpha 100))
    (100 (set-frame-parameter nil 'alpha 70)))
  )

;; (setq doom-theme 'doom-fairy-floss)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/git/dan/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (load! "+colemak-evil-rebindings.el")

(setq org-log-done t)
(setq org-agenda-files (directory-files-recursively "~/git/dan/org/" "\\.org$"))
(setq ob-mermaid-cli-path "/usr/local/bin/mmdc")

;;; scrollers
(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   4)) )
(global-set-key "\M-e"  (lambda () (interactive) (scroll-down 4)) )

(key-chord-define-global "<<" 'smart-shift-left)
(key-chord-define-global ">>" 'smart-shift-right)

;; configure inf-ruby to use pry
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
(setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")

(map! :localleader
      :map robe-mode-map
      :prefix "s"
      "s" #'inf-ruby)

(setq avy-keys '(?a ?r ?s ?t ?g ?m ?n ?e ?i ?o))
(setq avy-all-windows 't)

;; Some more org config
(after! org
  (setq org-log-done 'note) )

(require 'protobuf-mode)

(use-package rainbow-delimiters
  :hook ((json-mode . rainbow-delimiters-mode))
  :hook ((groovy-mode . rainbow-delimiters-mode))
  :hook ((protobuf-mode . rainbow-delimiters-mode))
  :hook ((go-mode . rainbow-delimiters-mode))
  :hook ((makefile-bsdmake-mode . rainbow-delimiters-mode)))

(use-package zoom
  :hook (doom-first-input . zoom-mode)
  :config
  (setq zoom-size '(0.618 . 0.618)
        zoom-ignored-major-modes '(dired-mode vterm-mode dap-ui)
        zoom-ignored-buffer-names '("*doom:scratch*" "*info*" "*helpful variable: argv*")
        zoom-ignored-buffer-name-regexps '("^*calc" "\\*helpful variable: .*\\*" "\\*dap-ui.*\\*")
        zoom-ignore-predicates (list (lambda () (< (count-lines (point-min) (point-max)) 20)))))


(require 'key-chord)
(key-chord-mode 1)

(setq highlight-indent-guides-method 'fill)

;; TODO: must install Symbola for some ligatures to work

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; (use-package chezmoi)

(defun my/find-file-in-chezmoi-config ()
  "Browse to my `chezmoi` config dir."
  (interactive)
  (doom-project-find-file (string-trim (shell-command-to-string "chezmoi source-path"))))

(map! :leader
      :desc "Find file in chezmoi config"
      "f z" #'my/find-file-in-chezmoi-config)

;;;###autoload
(defun +zellij/run (command &optional noreturn)
  (interactive
   (list (read-string "zellij $ ")
         current-prefix-arg))
  (projectile-run-shell-command-in-root (concat "zellij action write-chars "
                                                (shell-quote-argument command)))
  (projectile-run-shell-command-in-root "zellij action write 10"))

(map! :leader
      :desc "Tmux"
      :prefix ("r" . "tmux")
      :desc "CD" "c" #'+tmux/cd
      :desc "CD Here" "h" #'+tmux/cd-to-here
      :desc "SIGINT" "k" (lambda () (interactive) (projectile-run-shell-command-in-root "zellij action write 03"))
      ;; :desc "SIGINT" "k" (lambda () (interactive) (+tmux/run "C-c"))
      :desc "CD Project" "p" #'+tmux/cd-to-project
      :desc "Run" "r" #'+zellij/run
      ;; :desc "Run" "r" #'+tmux/run
      :desc "Rerun" "R" #'+tmux/rerun
      :desc "Send region" "s" #'+tmux/send-region
      :desc "Zellij" "z" (lambda () (interactive) (projectile-run-shell-command-in-root "zellij run --floating -- make test")))

;; ;; daemon configuration
(if (daemonp)
    (message "Loading in the daemon!")
  (message "Loading in regular Emacs!"))

;; workaround: https://github.com/doomemacs/doomemacs/issues/6280#issuecomment-1121596529
(after! centaur-tabs
  (centaur-tabs-group-by-projectile-project))

;; (defun efs/set-font-faces ()
;;   (message "Setting faces!")
;;   (set-face-attribute 'default nil :font "Fira Code Retina" :height efs/default-font-size)

;;   ;; Set the fixed pitch face
;;   (set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height efs/default-font-size)

;;   ;; Set the variable pitch face
;;   (set-face-attribute 'variable-pitch nil :font "Cantarell" :height efs/default-variable-font-size :weight 'regular))

;; (if (daemonp)
;;     (add-hook 'after-make-frame-functions
;;               (lambda (frame)
;;                 (with-selected-frame frame
;;                   (efs/set-font-faces))))
;;   (efs/set-font-faces))

;; macro hydra
(defhydra hydra-keyboard-macros (:columns 6 :foreign-keys run)
  ("x" kmacro-end-or-call-macro-repeat "execute")
  ("u" (lambda()
         (interactive)
         (let ((current-prefix-arg 0))
           (call-interactively #'kmacro-end-or-call-macro)))
   "unlimited")
  ("s" (lambda ()
         (interactive)
         (isearch-forward-regexp)
         (hydra-keyboard-macros/body))  "search" :color blue)
  ("r" (lambda ()
         (interactive)
         (isearch-backward-regexp)
         (hydra-keyboard-macros/body))  "reverse" :color blue)
  ("'" edit-last-kbd-macro "edit")
  ("q" nil "quit"))

(map! :n "gx" #'hydra-keyboard-macros/kmacro-end-or-call-macro-repeat)

;; https://blog.chmouel.com/2016/09/07/dealing-with-yaml-in-emacs/
(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))

;; https://github.com/yoshiki/yaml-mode/issues/25#issuecomment-1070572097
;; https://gist.github.com/leoc/f8c0868051003c4ea6eff638bc614575
(use-package outline-magic :ensure t)
(use-package yaml-mode
  :ensure t
  :config
  (progn
    (add-hook 'yaml-mode-hook 'leoc/yaml-outline-hook)

    ;; Customize folding markers
    (set-display-table-slot
     standard-display-table
     'selective-display
     (let ((face-offset (* (face-id 'shadow) (lsh 1 22))))
       (vconcat (mapcar (lambda (c) (+ face-offset c)) " [+]"))))

    (defun leoc/yaml-outline-level ()
      (s-count-matches "\\([ ]\\{2\\}\\)" (match-string 0)))

    (defun leoc/yaml-outline-hook ()
      (interactive)
      (setq outline-regexp
            (rx
             (seq
              bol
              (group (zero-or-more "  ")
                     (or (group
                          (seq (or (seq "\"" (*? (not (in "\"" "\n"))) "\"")
                                   (seq "'" (*? (not (in "'" "\n"))) "'")
                                   (*? (not (in ":" "\n"))))
                               ":"
                               (?? (seq
                                    (*? " ")
                                    (or (seq "&" (one-or-more nonl))
                                        (seq ">-")
                                        (seq "|"))
                                    eol))))
                         (group (seq
                                 "- "
                                 (+ (not (in ":" "\n")))
                                 ":"
                                 (+ nonl)
                                 eol)))))))

      (setq outline-level 'leoc/yaml-outline-level)

      (outline-minor-mode t)
      (hide-body)
      (show-paren-mode 1)
      (define-key yaml-mode-map [tab] 'outline-cycle)
      (define-key outline-minor-mode-map [M-S-tab] 'indent-for-tab-command)
      (define-key outline-minor-mode-map [M-down] 'outline-move-subtree-down)
      (define-key outline-minor-mode-map [M-up] 'outline-move-subtree-up))))

(use-package makefile-executor
  :config
  (add-hook 'makefile-mode-hook 'makefile-executor-mode))

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(map! :map dap-mode-map
      :leader
      :prefix ("d" . "dap")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

(map! :i "TAB" #'sp-up-sexp)

;; (map! :map org-mode-map
;;       :leader
;;       :prefix ("v" . "verb")
;;       :desc "Send request on point in another window but don't select it" "r" #'verb-send-request-other-window
;;       :desc "Send request on point in another window" "s" #'verb-send-request-other-window-select
;;       :desc "Send request on point, show result status in minibuffer" "m" #'verb-send-request-minibuffer
;;       :desc "Send request on point in selected window" "f" #'verb-send-request
;;       :desc "Kill all response buffers and their windows" "k" #'verb-kill-all-response-buffers
;;       :desc "Export request on point (prompt for format)" "e" #'verb-export-request
;;       :desc "Export request on point to curl format" "u" #'verb-export-request-curl
;;       :desc "Export request on point to Verb format" "b" #'verb-export-request-verb
;;       :desc "Set value of a Verb variable" "v" #'verb-set-variable)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c C-r") verb-command-map))

(after! apheleia
  (after! ruby-mode
    (setf (alist-get 'ruby-mode apheleia-mode-alist) 'rufo)))
