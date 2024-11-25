FROM python:3.10-slim-bullseye

ENV PYTHONUNBUFFERED = 1



RUN apt-get update && apt-get install -y libcairo2-dev gcc

WORKDIR /app/

COPY . .

# Fix line return from windows
RUN sed -i -e 's/\r$//' entrypoint.sh
RUN sed -i -e 's/\r$//' entrypoint1.sh
RUN sed -i -e 's/\r$//' entrypoint2.sh

RUN chmod +x /app/entrypoint.sh

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python3", "manage.py", "runserver"]
