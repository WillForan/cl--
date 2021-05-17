# cl-dollar

a convenience user library for using common lisp as a shell/repl a la https://ambrevar.xyz/lisp-repl-shell/index.html

This simply includes others that are useful. 
But, at least until [cmd:pull#11](https://github.com/ruricolist/cmd/pull/11/commits/9e0a0f7a7cf4ff59fd91a8d17e1ea9f657fd18a4) is resolved, `#!` and `#$` readtable modifications -- as written by [ambrevar](https://gitlab.com/ambrevar/), are also included.

 * [`cmd`](https://github.com/ruricolist/cmd) (not in quicklisp)
 * `alexandria`
 * [`serapeum`](https://github.com/ruricolist/serapeum) esp for [strings](https://github.com/ruricolist/serapeum/blob/master/REFERENCE.md#strings)
 * [`cl-interpol`](http://edicl.github.io/cl-interpol/) for readtable mod, enabling e.g. `#?"var: ${var} list: @{list}"`
 * `cl-ppcre` (scan from serapeum) matches-as-strings regexp-replace from ppcre

## Loading
 * requires pulling `cmd` from github
 * run the `#-(or nil)` portion of ~.sbclrc~ below
 * `(in-package :cl-dollar)`

### example config

in `.sbclrc`
```lisp
; quicklisp load should already be here
; #-quicklisp
; (load ....)

; local quicklisp - customize as desird
(defvar *my-quicklisp-dir* (merge-pathnames #P"src/quicklisp/" (user-homedir-pathname))
       "local lisp libaries root directory")
(pushnew  *my-quicklisp-dir* ql:*local-project-directories*)

; get cmd+this library. neither in quicklisp/ultralisp.
; *run by hand*
#|
(progn
  (setq saveto (namestring (merge-pathnames *my-quicklisp-dir* #p"cmd")))
  (uiop:run-program (list "git" "clone" "https://github.com/ruricolist/cmd" (saveto)))
  (ql:quickload :cmd)
  (cmd:cmd "git clone https://github.com/WillForan/cl-dollar" :in *my-quicklisp-dir*))
|#

; only run when exists
(if (probe-file (merge-pathnames "cl-dollar/" *my-quicklisp-dir*))
    (ql:quickload "cl-dollar"))

```
