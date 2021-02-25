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
(setq seen-font-lock-keywords
      (let* ((seen-datatypes '("bit" "bit2" "bit4" "byte" "int" "str"))
	     (seen-keywords  '("case" "ecase" "else" "for" "if" "of" "other"
			       "repeat" "till" "while"))
	     (seen-controlflow '("farcall" "farcall_with" "gosub" "gosub_case"
				 "gosub_if" "gosub_on" "gosub_unless" "goto"
				 "goto_case" "goto_if" "goto_on" "goto_unless" "jump"
				 "ret" "ret_with" "rtl" "rtl_with"))

	     (seen-datatypes-regexp   (regexp-opt seen-datatypes 'words))
	     (seen-keywords-regexp    (regexp-opt seen-keywords  'words))
	     (seen-controlflow-regexp (regexp-opt seen-controlflow 'words)))

	`((,seen-datatypes-regexp   . font-lock-type-face)
	  (,seen-keywords-regexp    . font-lock-type-face)
	  (,seen-controlflow-regexp . font-lock-type-face))))

;;;###autoload
(define-derived-mode seen-mode c-mode "seen-mode"
  "Major mode for editing text/kepago scripts"
  (setq font-lock-defaults '(seen-font-lock-keywords))
  (visual-line-mode 1))

;;;###autoload
(progn
  (add-to-list 'auto-mode-alist '("\\.TXT")))

(provide 'seen-mode)
