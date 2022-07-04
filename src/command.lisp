(in-package :lem)

(define-condition executing-command (signal-handler)
  ((command :initarg :command
            :initform (alexandria:required-argument :command)
            :reader executing-command-command)))

(define-condition before-executing-command (executing-command) ()
  (:report (lambda (c s)
             (format s "before executing the ~S command" (executing-command-command c)))))

(define-condition after-executing-command (executing-command) ()
  (:report (lambda (c s)
             (format s "after executing the ~S command" (executing-command-command c)))))

(defconstant +primary-command-class-name+ 'primary-command)

(defvar *this-command*)

(defun this-command ()
  *this-command*)

(defgeneric execute (command argument))

(defclass primary-command () ())

(defun get-command (symbol)
  (alexandria:when-let (class (find-class symbol nil))
    (make-instance class)))

(defun call-command (this-command universal-argument)
  (signal-subconditions 'before-executing-command :command this-command)
  (prog1 (alexandria:if-let (*this-command* (get-command this-command))
           (execute *this-command* universal-argument)
           (editor-error "~A: command not found" this-command))
    (buffer-undo-boundary)
    (signal-subconditions 'after-executing-command :command this-command)))