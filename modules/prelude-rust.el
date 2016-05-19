;; Shanghai, China

;;; Code;

(require 'prelude-programming)

(prelude-require-packages '(company-racer
                            racer
                            flycheck
                            flycheck-rust
                            rust-mode))

;; Enable company globally for all mode
(global-company-mode)

;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)

;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)

(setq racer-cmd "/usr/local/bin/racer")

(setq racer-rust-src-path "/Users/ivan/.rust/src/")

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Setting up configurations when you load rust-mode
(add-hook 'rust-mode-hook

          '(lambda ()
             ;; Enable racer
             (racer-activate)

             ;; Hook in racer with eldoc to provide documentation
             (racer-turn-on-eldoc)

             ;; Use flycheck-rust in rust-mode
             (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

             ;; Use company-racer in rust mode
             (set (make-local-variable 'company-backends) '(company-racer))

             ;; Key binding to jump to method definition
             (local-set-key (kbd "M-.") #'racer-find-definition)

             ;; Key binding to auto complete and indent
             (local-set-key (kbd "TAB") #'racer-complete-or-indent)))

(provide 'prelude-rust)
;;; prelude-rust.el ends here
