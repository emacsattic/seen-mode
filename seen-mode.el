;;; seen.el --- A syntax highlighting package for text/kepago -*- lexical-binding: t; -*-

;; Copyright (C) 2021 Filipe da Silva Santos

;; Author: Filipe da Silva Santos <contact@shiori.com.br>
;; Created: 25 Feb 2021
;; Keywords: languages
;; Homepage: https://git.sr.ht/~shiorid/seen.el
;; Package-Requires: ((emacs "25.1"))

;;; Commentary:

;; This package provides a major mode for editing text/kepago files.
;; I hope it helps future VN translators and developers.

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.

;; You should have received a copy of the GNU Affero General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:
(defvar seen-datatypes
  '("bit" "bit2" "bit4" "byte" "int" "str"))

(defvar seen-keywords
  '("case" "ecase" "else" "for" "if" "of" "other" "repeat" "till" "while"))

(defvar seen-controlflow
  '("farcall" "farcall_with" "gosub" "gosub_case" "gosub_if" "gosub_on"
    "gosub_unless" "goto" "goto_case" "goto_if" "goto_on" "goto_unless" "jump"
    "pause ""ret" "ret_with" "rtl" "rtl_with"))

(defvar seen-functions
  '("bgmLoop" "grpBuffer" "grpMulti" "objBgClear" "objBgMove" "objBgOfFile"
    "op" "recOpenBg" "title"))

(defvar seen-font-lock-defaults
  `((("\'\\.\\*\\?" . font-lock-string-face)
     ("^\\(#.*\\)$" . font-lock-preprocessor-face)
     ("\\(@[^ \t\n:;]+\\)" . font-lock-function-name-face)
     ("\\(int[A-Z]\\[[0-9]+\\]\\)" . font-lock-variable-name-face)
     ("\\(str[A-Z]\\[[0-9]+\\]\\)" . font-lock-variable-name-face)
     ( ,(regexp-opt seen-keywords    'words) . font-lock-keyword-face)
     ( ,(regexp-opt seen-controlflow 'words) . font-lock-builtin-face)
     ( ,(regexp-opt seen-functions   'words) . font-lock-function-name-face)
     )))

;;;###autoload
(define-derived-mode seen-mode fundamental-mode "seen-mode"
  "Major mode for editing text/kepago scripts"
  (setq font-lock-defaults seen-font-lock-defaults)
  (visual-line-mode 1))

;;;###autoload
(progn
  (add-to-list 'auto-mode-alist '("\\.TXT$" . seen-mode)))

(provide 'seen-mode)
;;; seen-mode.el ends here
