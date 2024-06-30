FROM python:3.10.12
RUN mkdir /backend
COPY requirements.txt /backend/requirements.txt
RUN mkdir -p -m 777 /var/log/app_log/
WORKDIR /backend
RUN apt update && apt install ffmpeg -y
RUN  pip3 install -r requirements.txt
COPY . /backend/
EXPOSE 80
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
#CMD ["gunicorn", "--bind", ":80", "--chdir", "erp_central_admin/", "--access-logfile", "/var/log/app_log/gunicorn_access.log", "--workers", "2", "--threads", "4", "--worker-class", "gthread", "--worker-tmp-dir", "/dev/shm", "erp_central_admin.wsgi"]
