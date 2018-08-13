#|
link : http://www.daregada.sakuraweb.com/paredit_tutorial_ja.html
|#

(defpackage :lem-paredit-mode
  (:use :cl
        :lem
        :lem-vi-mode.word)
  (:export :paredit-mode))
(in-package :lem-paredit-mode)

(define-minor-mode paredit-mode
    (:name "paredit"
     :keymap *paredit-mode-keymap*))

(defun move-to-word-end (q)
  (loop while (not (syntax-space-char-p (character-at q)))
        do (character-offset q 1)))

(defun backward-open-paren-char-p (p)
  (with-point ((q p))
    (skip-whitespace-backward q)
    (syntax-open-paren-char-p (character-at q))))

(defun yank-with-space (yank-point)
  (unless (backward-open-paren-char-p yank-point)
    (move-point (current-point) yank-point))
  (insert-character yank-point #\space)
  (yank))

(defun delete-backward-whitespace (point-end)
  (with-point ((point-start point-end))
    (skip-whitespace-backward point-start)
    (delete-between-points point-start point-end)))

(define-command paredit-insert-paren () ()
  (let ((p (current-point)))
    (dolist (c '(#\( #\)))
      (insert-character p c))
    (character-offset p -1)))

(define-command paredit-backward-delete (&optional (n 1)) ("p")
  (when (< 0 n)
    (with-point ((p (current-point)))
      (character-offset p -1)
      (case (character-at p)
        (#\( (when (char= (character-at p 1) #\))
               (delete-next-char)
               (delete-previous-char)))
        (#\) (backward-char))
        (otherwise
         (delete-previous-char))))
    (paredit-backward-delete (1- n))))

(define-command paredit-slurp () ()
  (with-point ((origin (current-point))
               (p (current-point)))
    (scan-lists p -1 1)
    (when (syntax-open-paren-char-p (character-at p))
      (scan-lists p 1 0)
      (character-offset p -1)
      (with-point ((yank-point p))
        (character-offset p 1)
        (skip-whitespace-forward p)
        (when (not (syntax-closed-paren-char-p (character-at p)))
          (with-point ((kill-end p))
            (if (syntax-open-paren-char-p (character-at p))
                (scan-lists kill-end 1 0)
                (move-to-word-end kill-end))
            (kill-ring-new)
            (kill-region p kill-end)
            (delete-backward-whitespace p))
          (yank-with-space yank-point))))
    (move-point (current-point) origin)))

(define-command paredit-barf () ()
  (with-point ((origin (current-point))
               (p (current-point)))
    (scan-lists p -1 1)
    (when (syntax-open-paren-char-p (character-at p))
      (scan-lists p 1 0)
      (character-offset p -1)
      (with-point ((kill-begin p))
        (character-offset p -1)
        (if (syntax-closed-paren-char-p (character-at p))
            (scan-lists kill-begin -1 0)
            (backward-word-begin kill-begin 1 t))
        (character-offset p 1)
        (kill-ring-new)
        (kill-region kill-begin p)
        (with-point ((yank-point kill-begin))
          (skip-whitespace-backward yank-point)
          (delete-backward-whitespace kill-begin)
          (character-offset yank-point 1)
          (yank-with-space yank-point))))
    (move-point (current-point) origin)))

(loop for (k . f) in '(("(" . paredit-insert-paren)
                       ("Backspace" . paredit-backward-delete)
                       ("C-Right" . paredit-slurp)
                       ("C-Left" . paredit-barf))
      do (define-key *paredit-mode-keymap* k f))
