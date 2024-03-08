FROM --platform=linux/arm64 python:3.10

EXPOSE 443
EXPOSE 5223
EXPOSE 8007
EXPOSE 8883

COPY requirements.txt /requirements.txt

# install required python packages
RUN apt-get update && apt-get install git build-essential && pip3 install -r requirements.txt

WORKDIR /bumper

# Copy only required folders instead of all
COPY bumper/ bumper/

ENTRYPOINT ["python3", "-m", "bumper"]
