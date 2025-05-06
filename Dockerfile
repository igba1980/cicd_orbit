FROM python:3.13-slim-bookworm

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Copy the rest of the application code
COPY app.py .

EXPOSE 8080

CMD ["python", "app.py"]