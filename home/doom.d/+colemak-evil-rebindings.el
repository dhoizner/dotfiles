;;; +colemak-evil-rebindings.el -*- lexical-binding: t; -*-

(map! :mnv "n" #'evil-next-line
      :mnv "gn" #'evil-next-visual-line
      :mnv "gN" #'evil-next-visual-line
      :mnv "e" #'evil-previous-line
      :mnv "ge" #'evil-previous-visual-line
      :mnv "m" #'evil-backward-char
      :mnv "i" #'evil-forward-char)

(after! magit (evil-define-key* '(normal visual) magit-mode-map
                "n" #'evil-next-line
                "e" #'evil-previous-line
                "m" #'evil-backward-char
                "i" #'evil-forward-char))

(map! :nv "l" #'undo-fu-only-undo
      :nv "N" #'evil-join
      :nv "gN" #'evil-join-whitespace)

(map! :n "u" #'evil-insert
      :nv "U" #'evil-insert-line)

(map! :mnov "f" #'evil-forward-word-end
      :mnov "F" #'evil-forward-WORD-end
      :mnv "t" #'evil-find-char
      :mnv "T" #'evil-find-char-backward
      :mnv "j" #'evil-find-char-to
      :mnv "J" #'evil-find-char-to-backward)

(map! :map evil-window-map
      "m" #'evil-window-left
      "C-m" #'evil-window-left
      "M" #'+evil/window-move-left
      "i" #'evil-window-right
      "C-i" #'evil-window-right
      "I" #'+evil/window-move-right
      "x" #'maximize)

(map! :mnv "C-m" #'evil-window-left
      :mnv "C-i" #'evil-window-right)

(map! :prefix "gz"
      :nv "n" #'evil-mc-make-cursor-move-next-line
      :nv "e" #'evil-mc-make-cursor-move-prev-line)
