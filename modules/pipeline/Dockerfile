FROM python:3.7

LABEL maintainer="sainishivu03@gmail.com"

RUN pip install virtualenv
ENV VIRTUAL_ENV=/venv
RUN virtualenv venv -p python3
ENV PATH="VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
ADD . /app

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port 
EXPOSE 5000

# Run the application:
CMD ["python", "app.py"]

