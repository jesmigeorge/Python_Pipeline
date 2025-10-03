FROM python:3

WORKDIR /app

COPY calc_nums.py .

CMD ["python", "calc_nums.py", "5", "10"]