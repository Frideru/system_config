(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(custom-enabled-themes '(wombat))
 '(package-selected-packages '(vscode-dark-plus-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font" :foundry "JB" :slant normal :weight normal :height 115 :width normal)))))
(setq make-backup-files nil)      ; Отключить создание резервных копий
(setq auto-save-default nil)      ; Отключить автосохранение
(setq inhibit-startup-message t)  ; Отключить начальный экран
(global-linum-mode t)             ; Включить номера строк
(global-display-line-numbers-mode 1) ; Современный способ
(tool-bar-mode -1)                ; Выключить паннель инструментов
(scroll-bar-mode -1)              ; Выключить строку прокрутки

;; Убедитесь, что пакет 'package' загружен
(require 'package)

;; Добавьте MELPA в список источников пакетов
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Инициализируйте пакетный менеджер
(package-initialize)

;; Установите use-package, если он еще не установлен
(unless (package-installed-p 'use-package)
  (package-refresh-contents)  ;; Обновите список пакетов
  (package-install 'use-package))

;; Загрузите use-package
(require 'use-package)

; vscode theme
(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

