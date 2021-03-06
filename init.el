;;; init.el -*- coding: utf-8; lexical-binding: t -*- 

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

;;
; Adjust garbage collection thresholds during startup, and thereafter
;;
(defconst gc-cons-threshold' gc-cons-threshold)
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold gc-cons-threshold')))

;;
; Load path
;;
(add-to-list 'load-path (expand-file-name "run" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "pref" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lang" user-emacs-directory))          
(add-to-list 'load-path (expand-file-name "pkg" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "themes" user-emacs-directory))

;;
; Bootstrap runtime
;;
(require 'runtime-benchmark)
(require 'runtime-pkg)
(require 'runtime-lib)

;;
; Load config
;;
(require 'cnf-ui)
(require 'cnf-edit)
(require 'cnf-linum)
(require 'cnf-indent)
(require 'cnf-setting)
(require 'cnf-keybinding)
(require 'cnf-locale)
(require 'cnf-backup)
(require 'cnf-auto-save)

;;
; Install dependencies
;;
(require-pkg 'nlinum)




(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))
  
(provide 'init)

;; Local Variables:
;; no-byte-compile: t
;; End:
;;; init.el ends here