(defpackage "cl-dollar"
  (:use #:cl #:alexandria #:cmd #:cl-interpol )
  ;; (:import-from #:serapeum ) ; include win cmd
  (:import-from #:ppcre :all-matches-as-strings :regex-replace)
  (:import-from :named-readtables)
  (:export :readtable)
  (:nicknames "$"))
(in-package "cl-dollar")
(named-readtables:in-readtable :interpol-syntax)

;; copied from Ambrevar 
;; https://github.com/ruricolist/cmd/pull/11/commits/9e0a0f7a7cf4ff59fd91a8d17e1ea9f657fd18a4
(defun read-until (stream delimiter)
  "Return the string read until DELIMITER."
  (concatenate 'string
               (loop :for char = (read-char stream nil :eof)
                     :while (and (not (eq char :eof))
                                 (not (char= char delimiter)))
                     :collect char)))

(defun cmd-reader (stream char1 char2)
  (declare (ignore char1 char2))
  (cmd (read-until stream #\newline)))

(defun $cmd-reader (stream char1 char2)
  (declare (ignore char1 char2))
  ($cmd (read-until stream #\newline)))

(serapeum:export-always 'readtable)
(named-readtables:defreadtable readtable
  (:merge :standard)
  (:dispatch-macro-char #\# #\! #'cmd-reader)
  (:dispatch-macro-char #\# #\$ #'$cmd-reader))
