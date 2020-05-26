#!/usr/bin/env bash

RETRIES=5
until PGPASSWORD="$POSTGRES_PASSWORD" psql -h db -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "select 1" || [ $RETRIES -eq 0 ]; do
  echo "Waiting for postgres server, $((RETRIES)) remaining attempts..."
  RETRIES=$((RETRIES-=1))
  sleep 1
done

python manage.py migrate

superuser_name=admin
superuser_email=admin@quansight.com

script=$(cat <<END
from django.contrib.auth import get_user_model

User = get_user_model()  # get the currently active user model,

User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', '$superuser_email', '$SUPERUSER_PASSWORD')
END
)


echo "$script" | python manage.py shell
python manage.py runserver 0.0.0.0:8000
