# Модуль: CI/CD (Непрерывная интеграция и доставка)

## 🔄 Цель модуля
Освоение практик непрерывной интеграции, доставки и развертывания для автоматизации процесса разработки и выпуска программного обеспечения.

## 📂 Структура
ci-cd/
├── concepts/ # Основные концепции
│ ├── ci-vs-cd/ # CI vs CD различия
│ ├── pipelines/ # Конвейеры сборки
│ └── best-practices/ # Лучшие практики
│
├── jenkins/ # Jenkins
│ ├── installation/ # Установка и настройка
│ ├── pipelines/ # Declarative/scripted pipelines
│ ├── agents/ # Агенты и распределение
│ └── integrations/ # Интеграции с инструментами
│
├── gitlab-ci/ # GitLab CI/CD
│ ├── yaml-config/ # Конфигурация .gitlab-ci.yml
│ ├── runners/ # GitLab Runners
│ └── artifacts/ # Артефакты и кэширование
│
├── github-actions/ # GitHub Actions
│ ├── workflows/ # Workflow файлы
│ ├── actions/ # Кастомные actions
│ └── marketplace/ # Actions Marketplace
│
├── testing/ # Тестирование в CI/CD
│ ├── unit-tests/ # Модульные тесты
│ ├── integration/ # Интеграционные тесты
│ └── e2e/ # End-to-end тесты
│
└── deployment/ # Стратегии развертывания
├── blue-green/ # Blue-Green
├── canary/ # Canary релизы
└── rolling/ # Rolling updates

## 🎯 Осваиваемые навыки
- Настройка CI/CD пайплайнов
- Автоматизация сборки и тестирования
- Интеграция с системами контроля версий
- Реализация различных стратегий развертывания
- Мониторинг и оповещение о сборках
- Оптимизация времени выполнения пайплайнов

## 🛠️ Практические проекты
1. **CI для Python/Node.js приложения** - автоматическая сборка и тестирование
2. **Docker-образ в CI/CD** - сборка и публикация образов
3. **Kubernetes deployment pipeline** - развертывание в k8s
4. **Мультистедийный пайплайн** - dev/stage/prod окружения

## 🔗 Полезные ресурсы
- [Jenkins Handbook](https://www.jenkins.io/doc/)
- [GitLab CI/CD Documentation](https://docs.gitlab.com/ee/ci/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [CI/CD Best Practices](https://www.redhat.com/en/topics/devops/what-cicd-pipeline)