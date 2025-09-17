FROM python:3.9

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

# Train model during build
COPY train_model.py .
RUN python train_model.py

COPY . .

EXPOSE 5000
CMD ["python", "app.py"]
