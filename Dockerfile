FROM python:3.8

RUN apt-get update

RUN pip install --upgrade pip

ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /usr/local/tal/{{repo}}

# Upgrade setup tools
RUN pip install -U setuptools
RUN pip install --extra-index-url https://admin:GIXsa5sDvejKfy9IGnhD@pypi.takealot.com/pypi certalot --trusted-host pypi.takealot.com

COPY requirements.txt .
RUN pip install --extra-index-url https://admin:GIXsa5sDvejKfy9IGnhD@pypi.takealot.com/pypi -r requirements.txt

COPY . .
RUN pip install --extra-index-url https://admin:GIXsa5sDvejKfy9IGnhD@pypi.takealot.com/pypi --upgrade -e .
