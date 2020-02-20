;;; mop-mode.el --- Major Mode for Editing JavaMOP files. -*- coding: utf-8; lexical-binding: t; -*-
;; Copyright © 2017, by you

;; Author: Kenny Ballou <kballou@devnulllabs.io>
;; Version: 1.0.0
;; Created: 29 Feb 2020
;; Keywords: languages
;; Homepage:
;; http://ergoemacs.org/emacs/elisp_syntax_coloring.html

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the
;; GNU General Public License version 3.

;;; Commentary:
;;; Code:

;; create list for font-lock.
(defvar mop-font-lock-keywords
      (let* (
             ;; define syntactic categories
             (x-keywords (list "package" "event" "ere" "after" "before"))
             ;;(x-symbols (list "*" "+" "~" "|" "&" "(" ")" "@"))
             (x-constants (list "empty" "epsilon" "__RESET" "__LOC" "__SKIP" "STATICSIG"))
             (x-functions (list "call" "target" "args" "match" "fail"))
             ;; generate regex string for each cateogry
             (x-keywords-regexp (regexp-opt x-keywords 'words))
             (x-constants-regexp (regexp-opt x-constants 'words))
             (x-functions-regexp (regexp-opt x-functions 'words)))

        `(
          (,x-constants-regexp . font-lock-constant-face)
          (,x-functions-regexp . font-lock-function-name-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          )))

(define-derived-mode javamop-mode java-mode "JavaMOP Mode"
  "Major mode for editing MOP files."

  (setq font-lock-defaults '((mop-font-lock-keywords))))

(provide 'mop-mode)
;;; mop-mode.el ends here
