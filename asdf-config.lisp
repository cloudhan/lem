;; workaround COMPILE-FILE-ERROR from micros and swank
(setf uiop:*compile-file-failure-behaviour* :warn)
(asdf:load-system :micros)
(asdf:load-system :swank)
(setf uiop:*compile-file-failure-behaviour* :error)

(asdf:load-system :cl-fad)

(defvar curr-dir)
(setq curr-dir (cl-fad:canonical-pathname (truename #P".")))

(asdf:initialize-source-registry
  (append
    '(:source-registry)
    (list (list :directory curr-dir))
    (mapcar
        #'(lambda (p) (list :directory p))
      (cl-fad:list-directory (cl-fad:merge-pathnames-as-directory curr-dir #P"frontends/")))
    (mapcar
        #'(lambda (p) (list :directory p))
      (cl-fad:list-directory (cl-fad:merge-pathnames-as-directory curr-dir #P"extensions/")))
    '(:inherit-configuration)))
