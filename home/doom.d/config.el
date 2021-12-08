;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling font
;;(global-evil-colemak-basics-mode)

(load! "+colemak-evil-rebindings.el")


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

(map! :map go-mode-map
      :localleader
      "p" #'gorepl-hydra/body)

;; Some more org config
(after! org
  (setq org-log-done 'note) )

(require 'protobuf-mode)

(use-package rainbow-delimiters
  :hook ((json-mode . rainbow-delimiters-mode))
  :hook ((groovy-mode . rainbow-delimiters-mode))
  :hook ((protobuf-mode . rainbow-delimiters-mode))
  :hook ((go-mode . rainbow-delimiters-mode)))

(require 'key-chord)
(key-chord-mode 1)

(custom-set-variables '(zoom-mode t))
;; resize using the [golden ratio](https://en.wikipedia.org/wiki/Golden_ratio)
(custom-set-variables '(zoom-size '(0.618 . 0.618)))

(setq highlight-indent-guides-mode 'fill)

;; TODO: must install Symbola for some ligatures to work

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
