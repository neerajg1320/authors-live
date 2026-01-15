build:
	docker compose -f local.yml up --build -d --remove-orphans

up-base: up-services up-workers

up-services:
	docker compose -f local.yml up postgres -d
	docker compose -f local.yml up mailhog -d
	docker compose -f local.yml up redis -d
	docker compose -f local.yml up nginx -d

up-workers:
	docker compose -f local.yml up celery_worker -d
	docker compose -f local.yml up flower -d

up-api:
	docker compose -f local.yml up api

up:
	docker compose -f local.yml up -d

down:
	docker compose -f local.yml down

show-logs:
	docker compose -f local.yml logs

show-logs-api:
	docker compose -f local.yml logs api

makemigrations:
	docker compose -f local.yml run --rm api python manage.py makemigrations

migrate:
	docker compose -f local.yml run --rm api python manage.py migrate

collectstatic:
	docker compose -f local.yml run --rm api python manage.py collectstatic --no-input --clear

superuser:
	docker compose -f local.yml run --rm api python manage.py createsuperuser

down-v:
	docker compose -f local.yml down -v

volume:
	docker volume inspect src_local_postgres_data

authors-db:
	docker compose -f local.yml exec postgres psql --username=neeraj --dbname=authors-live

flake8:
	docker compose -f local.yml exec api flake8 .

black-check:
	docker compose -f local.yml exec api black --check --exclude=migrations .

black-diff:
	docker compose -f local.yml exec api black --diff --exclude=migrations .

black:
	docker compose -f local.yml exec api black --exclude=migrations .

isort-check:
	docker compose -f local.yml exec api isort . --check-only --skip venv --skip migrations

isort-diff:
	docker compose -f local.yml exec api isort . --diff --skip venv --skip migrations

isort:
	docker compose -f local.yml exec api isort . --skip venv --skip migrations

