FROM python:3

WORKDIR /app

COPY . .

CMD ["python", "calc_nums.py", "5", "10"]