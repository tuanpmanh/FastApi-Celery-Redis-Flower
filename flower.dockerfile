FROM python:3.11-alpine
WORKDIR /app
RUN pip install celery[redis] flower
ENV CELERY_BROKER_URL=redis://:foobar@redis:6379/0
EXPOSE 5555
CMD ["celery", "flower", "--broker=$CELERY_BROKER_URL", "--broker_api=$CELERY_BROKER_URL", "--address=0.0.0.0", "--basic-auth=test:test"]