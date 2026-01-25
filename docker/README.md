# Модуль: Docker

## 🐳 Цель модуля
Изучение контейнеризации приложений с помощью Docker: создание образов, управление контейнерами, организация многоконтейнерных приложений.

## 📂 Структура
docker/
├── basics/ # Основы Docker
│ ├── installation/ # Установка и настройка
│ ├── images/ # Работа с образами
│ └── containers/ # Управление контейнерами
│
├── dockerfiles/ # Создание Dockerfile
│ ├── best-practices/ # Лучшие практики
│ ├── multi-stage/ # Многостадийные сборки
│ └── optimization/ # Оптимизация образов
│
├── docker-compose/ # Оркестрация контейнеров
│ ├── basics/ # Основы docker-compose
│ ├── networks/ # Сети в docker-compose
│ └── volumes/ # Тома и хранение данных
│
├── registry/ # Работа с реестрами
│ ├── docker-hub/ # Docker Hub
│ └── private-reg/ # Приватные реестры
│
└── best-practices/ # Лучшие практики
├── security/ # Безопасность
├── performance/ # Производительность
└── monitoring/ # Мониторинг

## 🎯 Осваиваемые навыки
- Установка и настройка Docker
- Создание Dockerfile и сборка образов
- Управление жизненным циклом контейнеров
- Оркестрация с помощью Docker Compose
- Работа с Docker Hub и приватными реестрами
- Безопасность Docker-контейнеров

## 📦 Практические проекты
1. **Веб-приложение в контейнере** - упаковка простого веб-приложения
2. **Многоконтейнерное приложение** - связка БД и приложения
3. **Кастомные образы** - создание оптимизированных образов

## 🔗 Полезные ресурсы
- [Docker Documentation](https://docs.docker.com/)
- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Play with Docker](https://labs.play-with-docker.com/)